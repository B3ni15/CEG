-- Készítsünk egy adatbázist:
CREATE DATABASE gyakorlas;

-- Készítsunk táblákat:
-- drinks
-- retailers
-- clients
-- trainsactionsClients
-- transactionsRetailers
-- employees

-- retailers tábla (max 10) (id, company_name, company_tax_num, company_address, email, phone)
create table if not exists retailers (
    id tinyint unsigned primary key,
    company_name varchar(128) unique not null,
    company_tax_num varchar(12) unique not null,
    company_address varchar(255) not null,
    email varchar(255),
    phone varchar(12)
);

-- Mi az 'Alföld shop Kft.' telefonszáma?
select phone from retailers where company_name = 'Alföld shop Kft.';

-- Írjuk ki a lakcímet azon forgalmazóknál akik 'Bt.'-k
select company_address from retailers where company_name like '%Bt.%';

create table if not exists clients (
    id smallint unsigned primary key,
    name varchar(128) not null,
    tax_num varchar(12) unique not null,
    client_address varchar(255) not null,
    email varchar(255),
    phone varchar(12)
);

-- Mi 'Fanni Bíró' telefonszáma?
select phone from clients where name = 'Fanni Bíró';

-- Hány vásárló lakik 'Békéscsaba'-n?
select count(*) from clients where client_address like '%Békéscsaba%';

create table if not exists drinks (
    id smallint unsigned primary key,
    name varchar(128) unique not null,
    volume smallint unsigned not null,
    constraint volumeValid check (volume between 100 and 5000),
    price mediumint unsigned not null,
    constraint priceValid check (price between 1 and 1000000),
    retailer_id tinyint unsigned not null,
    foreign key (retailer_id) references retailers(id),
);

-- Számoljuk meg hány ALKOHOLMENTES ital árolunk?
-- Ugyanez, de pl. a 330ml és a 500ml Lager Beer egynek számít.

-- melyik forgalmazó árulja a sprite italt? 
select company_name from retailers r join drinks d on r.id = d.retailer_id where d.name = 'Sprite';

-- milyen alkohol mentes italokat árol az alföld shop kft.?
select drinks.name from drinks join retailers on drinks.retailer_id = retailers.id where retailers.company_name = 'Alföld shop Kft.';

-- transactionsRetailers tábla (id, drinks_id, retailer_id, quantity, transaction_date)
create table if not exists transactionsRetailers (
    id int unsigned primary key auto_increment,
    retailer_id tinyint unsigned not null,
    drink_id smallint unsigned not null,
    quantity smallint unsigned not null,
    transaction_date date not null,
    constraint quantityValid check (quantity > 0),
    foreign key (retailer_id) references retailers(id),
    foreign key (drink_id) references drinks(id)
);

-- tranactionsClients tábla (id, drinks_id, client_id, employee_id, price, transaction_date)
create table if not exists transactionsClients (
    id int unsigned primary key auto_increment,
    client_id smallint unsigned not null,
    drink_id smallint unsigned not null,
    employee_id smallint unsigned not null,
    price mediumint unsigned not null,
    transaction_date date not null,
    constraint priceValid check (price between 1 and 1000000),
    foreign key (client_id) references clients(id),
    foreign key (drink_id) references drinks(id),
    foreign key (employee_id) references employees(id)
);

-- 2025. december 11-én melyik vásárlók vásároltak, melyik eladóktól? 
select clients.name as client_name, employees.name as employee_name from transactionsClients tc join clients on tc.client_id = clients.id join employees on tc.employee_id = employees.id where tc.transaction_date = '2025-12-11';

-- milyen italokat vásárolt "Bence Kovács"?
select drinks.name from transactionsClients tc join clients on tc.client_id = clients.id join drinks on tc.drink_id = drinks.id where clients.name = 'Bence Kovács';

-- Hány üveg alkoholos ital adtunk el 2025 decemberében?
select sum(quantity) from transactionsRetailers where transaction_date between '2025-12-01' and '2025-12-31' and drink_id in (select id from drinks where is_alcoholic = 1);

select count(distinct drinks.name) from drinks where drinks.is_alcoholic = true and drinks.volume <= 500;

-- Alkoholmentes, maximum fél literes termékek: írjuk ki melyik italból mennyi félénk van(vol).
select name, count(*) from drinks where is_alcoholic = false and volume <= 500 group by name;

-- Számoljuk ki hogy hány alholos és hány alkoholmentes ital van?
select is_alcoholic, count(*) from drinks group by is_alcoholic;

-- Írjuk ki melyik ital (pl. COca-Cola) átlagosan mennyibe kerül? Az összes Volume árának átlaga.
select name, avg(price) from drinks group by name;

-- Írjuk ki, melyik ratailer(név) hány féle italt szállíz be.
-- Kül,  volumr, kül ital.
select retailer.company_name, count(distinct drinks.name) from retailers join drinks on retailers.id = drinks.retailer_id group by retailers.id;

-- Tábla létrehozás discounts néven, id, description, discountMultiplier, clientDiscount(boolean)
create table if not exists discounts (
    id tinyint unsigned primary key,
    description varchar(255) not null,
    discountMultiplier decimal(3,2) not null,
    constraint discountMultiplierValid check (discountMultiplier between 0 and 1),
    clientDiscount boolean not null
);

alter table transactionsRetailers add column discount_id tinyint unsigned;
alter table transactionsRetailers add constraint discountFk foreign key (discount_id) references discounts(id);
-- Kedvezmény készítés
insert into discounts (id, description, discountMultiplier, clientDiscount) values (1, '10% kedvezmény', 0.9, true);

-- Várárlás hozzáadása
insert into transactionsClients (client_id, drink_id, employee_id, price, transaction_date, discount_id) values (1, (select id from drinks where name = "Coca-Cola"), 1, 1000, '2025-12-11', (select id from discounts where description = "10% kedvezmény"));

-- írjuk ki milyen termékeket vásároltak a summer sale 20% részeként
select drinks.name from transactionsClients 
join discounts on transactionsClients.discount_id = discounts.id 
join drinks on transactionsClients.drink_id = drinks.id 
where discounts.description = '10% kedvezmény';

-- Új kedvezmény: Barna csütörtök 15% kedvezmény (retailer)
insert into discounts (id, description, discountMultiplier, clientDiscount) values (2, 'Barna csütörtök 15% kedvezmény', 0.85, false);
-- új vásárlás: 48db, Orange Juice(1l), 2025.szeptember 1
insert into transactionsRetailers (retailer_id, drink_id, quantity, transaction_date, discount_id) 
values (1, (select id from drinks where name = "Orange Juice" and volume = 1000), 48, '2025-09-01', 
(select id from discounts where description = 'Barna csütörtök 15% kedvezmény'));

-- Új kedvezmény: Usual customer 30% (client)
insert into discounts (id, description, discountMultiplier, clientDiscount) values (3, 'Usual customer 30% kedvezmény', 0.7, true);
-- Új vásárlás: 2db, sprite(1.5l) 2026. február 20
insert into transactionsClients (client_id, drink_id, employee_id, price, transaction_date, discount_id) 
values (1, (select id from drinks where name = "Sprite" and volume = 1500), 1, 2000, '2026-02-20',
(select id from discounts where description = 'Usual customer 30% kedvezmény'));

-- Opcionális feladat: az űrmértéket literben adjuk meg(számolni)

-- Írjuk ki azon vásárlásokat(retailer) amik nem voltak kedvezményesek és kevesebb mint 10db terméket vásároltak.
select retailers.company_name, drinks.name, transactionsRetailers.quantity from transactionsRetailers
join retailers on transactionsRetailers.retailer_id = retailers.id
join drinks on transactionsRetailers.drink_id = drinks.id
where transactionsRetailers.discount_id is null and transactionsRetailers.quantity < 10;

insert into discounts (id, description, discountMultiplier, clientDiscount) values (4, 'Black Friday 99% kedvezmény', 0.01, true);

delete from discounts where description = 'Black Friday 99% kedvezmény';

-- írjuk át a Black friday kedvezményt 10%-osra
update discounts set discountMultiplier = 0.9, description = 'Black Friday 10% kedvezmény' where description = 'Black Friday 99% kedvezmény';
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


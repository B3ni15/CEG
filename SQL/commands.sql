-- delete
-- join 

-- Készítsünk adatbázist car_db néven.
create database car_db;
-- Készítsünk egy táblát cars néven, amelynek oszlopai: 
-- id, egész szám, max 1000 db (Check Nélkül)
-- brand, szöveg, max 50 karakter
-- model, szöveg, max 50 karakter
-- owner, join az owners táblával, amelynek id-je megegyezik a cars owner oszlopával

create table cars (
    id tinyint primary key auto_increment,
    brand varchar(50) not null,
    model varchar(50) not null,
    owner tinyint unsigned,
    foreign key (owner) references owners(id)
);
    
-- Készítsunk egy táblát owners néven, amelynek oszlopai:
-- id, egész szám, max 100 db (Check Nélkül)
-- first_name, szöveg, max 50 karakter
-- middle_name, szöveg, max 50 karakter
-- last_name, szöveg, max 50 karakter
-- email, szöveg, max 100 karakter
-- address ???

create table owners (
    id tinyint unsigned primary key auto_increment,
    first_name varchar(50) not null,
    middle_name varchar(50),
    last_name varchar(50) not null,
    email varchar(100) not null unique,
    address tinyint unsigned,
    foreign key (address) references addresses(id)
);

-- Készítsünk egy addresses táblát:
-- id, egész szám, max 100 db (Check Nélkül)
-- zip_code, egész szám, max 10000 (Check Nélkül)
-- city, szöveg, max 50 karakter
-- street_name, szöveg, max 100 karakter
-- door_number, egész szám, max 200 (Check Nélkül)

create table addresses (
    id tinyint unsigned primary key auto_increment,
    zip_code smallint unsigned not null,
    city varchar(100) not null,
    street_name varchar(100) not null,
    door_number tinyint unsigned not null
);

-- Írjuk felül azokat a tulajdonsosokat akiknek a középső neve "A" -> "Andrew"
update owners set middle_name = 'Andrew' where middle_name = 'A';

-- Melyik felhasználónak van ".com"-ra végződő email címe?
select * from owners where email like '%.com';

-- Hány felhasználónak van .com-ra végződő email címe?
select count(*) from owners where email like '%.com';

-- Adjunk a cars táblához egy price oszlopot. (Dollárban)
-- MIN: 1000.00 MAX: 100000.00
alter table cars add column price decimal(10,2) not null check (price >= 1000.00 and price <= 100000.00);

-- Toyota Corolla ára: 15000.00 dollár
-- Állítsunk be árat minden autónak.
update cars
set price = case
    when brand = 'Toyota' and model = 'Corolla' then 15000.00
    when brand = 'Honda' and model = 'Civic' then 14500.00
    when brand = 'Ford' and model = 'Focus' then 13200.00
    when brand = 'BMW' and model = '320i' then 21900.00
    when brand = 'Audi' and model = 'A4' then 23800.00
    when brand = 'Mercedes' and model = 'C200' then 24900.00
    when brand = 'Volkswagen' and model = 'Golf' then 15400.00
    when brand = 'Hyundai' and model = 'Elantra' then 14100.00
    when brand = 'Kia' and model = 'Ceed' then 13600.00
    when brand = 'Nissan' and model = 'Qashqai' then 17200.00
    else price
end;

-- Átlagosan mennyibe kerül egy autó?
select concat("Average Price: $", round(avg(price), 2)) as "Average Price" from cars;

-- Összesen mennyibe kerülnek az autók?
select concat("Total Price: $", sum(price)) as "Total Price" from cars;

-- Mennyibe kerül a lególóbb autó?
select concat("Cheapest Car Price: $", min(price)) as "Cheapest Car Price" from cars;

-- Mennyibe kerül a legdrágább autó?
select concat("Most Expensive Car Price: $", max(price)) as "Most Expensive Car Price" from cars;

-- Melyik városban lakik "Sara Farkas"?
select addresses.city from addresses
join owners on owners.address = addresses.id
where owners.first_name = 'Sara' and owners.last_name = 'Farkas';

-- Mennyibe kerül "Eva Varga" autója?
select concat("Eva Varga's Car Price: $", cars.price) as "Eva Varga's Car Price" from cars
join owners on owners.id = cars.owner
where owners.first_name = 'Eva' and owners.last_name = 'Varga';

-- Mi a zip_code-ja az AUDI A4 tulajdonosának?
select addresses.zip_code from addresses
join owners on owners.address = addresses.id
join cars on cars.owner = owners.id
where cars.brand = 'Audi' and cars.model = 'A4';

-- Illeszünk be egy autót az adatbázisba
-- Ferrari F8, tulajdonos: "John Andrew Smith"-hez tartozzon.
-- Ne illeszük be az 1-es owner.id-t a hozzáadásban. 

insert into cars (brand, model, price, owner) values (
    'Ferrari',
    'F8', 
    274000.00,
    (select id from owners where first_name = 'John' and middle_name = 'Andrew' and last_name = 'Smith')
);

-- Kinek hány autója van?
select concat(owners.first_name, ' ', owners.last_name) as "Owner Name", count(cars.id) as "Number of Cars" from owners
left join cars on cars.owner = owners.id
group by owners.id;
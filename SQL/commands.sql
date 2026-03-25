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
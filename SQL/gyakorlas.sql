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

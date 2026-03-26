-- 1. Készíts adatbázist books_db néven.
create database books_db;

-- 2. Készíts táblát books néven a következő oszlopokkal. Ebben és a későbbi feladatokban sem kell még a CHECK megkötést használni.
-- id
-- title, szöveg, max 100 karakter nem null
-- isbn, szöveg, max 13 karakter nem null
-- price, tizedes szám, max 100_000 forint
-- author, szerző azonosítója az authors táblából, idegen kulcs

create table books (
    id tinyint unsigned primary key auto_increment,
    title varchar(100) not null,
    isbn varchar(13) not null,
    price decimal(10,2) unsigned,
    author tinyint unsigned,
    foreign key (author) references authors(id)
);

-- 3. Készíts táblát authors néven a szerzőknek, a következő oszlopokkal:
-- id 
-- full_name
-- country
-- date_of_birth

create table authors (
    id tinyint unsigned primary key auto_increment,
    full_name varchar(100) not null,
    country varchar(50) not null,
    date_of_birth date not null
);

-- 4. Készíts táblát inventory néven a készletnek, a következő oszlopokkal:
-- id
-- book, könyv azonosítója a books táblából, idegen kulcs
-- quantity, egész szám, max 100 db nem null

create table inventory (
    id tinyint unsigned primary key auto_increment,
    book tinyint unsigned,
    quantity tinyint unsigned not null,
    foreign key (book) references books(id)
);

-- 5. Készíts táblát sales néven az eladásoknak, a következő oszlopokkal:
-- id
-- book, könyv azonosítója a books táblából, idegen kulcs
-- date_of_transaction, tranzakció dátuma nem null 
-- customer, vásárló egyedi azonosítója a customers táblából, idegen kulcs

create table sales (
    id tinyint unsigned primary key auto_increment,
    book tinyint unsigned,
    date_of_transaction date not null,
    customer tinyint unsigned,
    foreign key (book) references books(id),
    foreign key (customer) references customers(id)
);

-- 6. Készíts táblát customers néven az vásárlóknak, a következő oszlopokkal:
-- id
-- full_name, szöveg, max 100 karakter nem null
-- email, szöveg, max 100 karakter nem null
-- phone, szöveg, max 12 karakter nem null
-- address, szöveg, max 100 karakter

create table customers (
    id tinyint unsigned primary key auto_increment,
    full_name varchar(100) not null,
    email varchar(100) not null,
    phone varchar(12) not null,
    address varchar(100) not null
);

-- 8. Írj lekérdezéseket. A vizsgált értékeket cseréld, ki a sajátjaiddal. (Kovacs Adam):

-- a: Melyik könyveket írta Kovacs Adam?
select title from books join authors on books.author = authors.id where authors.full_name = 'Kovacs Adam';

-- b: Mennyibe kerül atlagosan egy könyv a books táblában?
select avg(price) from books;

-- c: Hol született Kovacs Adam?
select country from authors where full_name = 'Kovacs Adam';

-- d: A könyvek hány százalékát írta Kovacs Adam?
select (count(*) / (select count(*) from books)) * 100 as percentage from books join authors on books.author = authors.id where authors.full_name = 'Kovacs Adam';

-- e: Hány alkalommal vásárolták meg a Dűne című könyvet?
select count(*) from sales join books on sales.book = books.id where books.title = 'The Hobbit';

-- f: Összesen hány Kovacs Adam könyv van jelenleg raktáron?
select sum(quantity) from inventory join books on inventory.book = books.id join authors on books.author = authors.id where authors.full_name = 'Kovacs Adam';

-- g: Utoljára mikor vásároltak olyan könyvet amit Kovacs Adam írt?
select max(date_of_transaction) from sales join books on sales.book = books.id join authors on books.author = authors.id where authors.full_name = 'Kovacs Adam';

-- h: Mi a telefonszáma azoknak a vásárlóknak akik megvásárolták a Dűne című könyvet?
select phone from customers join sales on customers.id = sales.customer join books on sales.book = books.id where books.title = 'The Hobbit';

-- A felhasználók hány százalékának van elmentve a lakcíme?
select (count(*) / (select count(*) from customers)) * 100 as percentage from customers where address != '';

-- Mennyibe kerül a legolcsóbb könyv?
select min(price) from books;

-- k: Melyik könyvet vették meg a legutóbbi vásárlás alkalmával?
select title from books join sales on books.id = sales.book where date_of_transaction = (select max(date_of_transaction) from sales);

-- l: Hány felhasználónak van gmail-es e-mail címe?
select count(*) from customers where email LIKE '%@gmail.com';
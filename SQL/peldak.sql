-- DDL, DML, TCL, DQL, DCL

-- DDL: Data Definition Language (Adatdefiniálő nyelv)

-- DML: Data Manipulation Language (Adatmanipulációs nyelv)

-- DQL: Data Query Language: (Select)

-- Adatbezis létrehozása:
create database school_db;

-- Tábla létrehozása:
create table students (
    id tinyint primary key,
    name varchar(100) not null,
    age tinyint
)

-- Adatok beszúrása a táblába:
insert into students (id, name, age) values (1, 'John Doe', 20);

-- Adatok beszúrása a táblába (több sor):
insert into students (id, name, age) values
(2, 'Jane Smith', 22),
(3, 'Alice Johnson', 19),
(4, 'Bob Brown', 21);

-- Lekérdezés:
select * from students;

-- Specifikus lekérdezés:
select name from students;
select name, age from students;
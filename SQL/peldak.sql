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

-- Szűrés
select * from students where age > 20;

-- Operátorok:

-- < kisebb
-- > nagyobb
-- = egyenlő
-- <= kisebb vagy egyenlő
-- >= nagyobb vagy egyenlő
-- <> nem egyenlő

-- Szűrés (17-18 inkluzívsn):
select * from students where age >= 17 and age <= 18;
select * from students where age between 17 and 18;

-- Bővítés: Hozzá adok egy doboszlopot (date of birth):
alter table students add column dob date;

-- Adatmanipuláció: Mindenki 2000.01.01-én született:
update students set dob = '2000-01-01';
update students set dob = Date('2000-01-01');

-- Specifikus adatmanipuláció: John Doe 1999.12.31-én született:
update students set dob = '1999-12-31' where name = 'John Doe';

-- Sorbarendezés név szerint: 
select * from students order by name asc;
-- ASC: növekvő sorrend
-- DESC: csökkenő sorrend

select name, dob from students where dob like '2008%';

-- Akinek a vezetékneve 'Jonh', azokat szűrjük ki:
select * from students where name like 'John%';


insert into students (id, name, age) values (5, 'John Smith Sigma', 23);

-- Azok akiknek a neve 3 részből áll?
select * from students where name like '% % %';
-- HIBA: "Nagy  Pétert"-t is elfogadja (2 szöközzel)

select * from students where name like '% % %' and name not like '%  %';

select format(avg(age), 1) as 'Átlagéletkor' from students;
select format(avg(age)) as 'Átlagéletkor' from students;
select round(avg(age)) as 'Átlagéletkor' from students;


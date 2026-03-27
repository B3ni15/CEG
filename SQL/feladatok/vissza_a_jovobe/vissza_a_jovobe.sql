--1. Hozd létre az adatbázist
--Hozz létre egy új adatbázist:
--Adatbázis neve: vissza_a_jovobe

create database vissza_a_jovobe;

-- 2. Készítsd el a filmek táblát
-- Ebben a táblában a filmek adatait fogjuk tárolni.
-- A mezők:
--  id
--  cim
--  megjelenes_datuma
--  rendezo
--  jatekido_perc
--  koltsegvetes_millio
--  ertekeles
--  idosutazas_van
--  leiras
-- Elvárások
--  Az id legyen elsődleges kulcs.
--  Az id automatikusan növekedjen.
--  A cim kötelező legyen.
--  A cim legyen egyedi.
--  A rendezo kötelező legyen.
--  Az idosutazas_van alapértelmezetten legyen igaz.
--  A leiras hosszabb szöveg lehessen.

create table filmek (
    id tinyint unsigned primary key auto_increment,
    cim varchar(100) not null unique,
    megjelenes_datuma date,
    rendezo varchar(100) not null,
    jatekido_perc tinyint unsigned,
    koltsegvetes_millio decimal(10,2) unsigned,
    ertekeles decimal(3,1) unsigned,
    idosutazas_van boolean default true,
    leiras text
);

-- Megjegyzés:
-- Itt a filmek alapadatait tároljuk. Mivel a témában kevés film van, különösen fontos, hogy
-- pontos adatokat vigyünk fel.

-- 3. Készítsd el a szereplok táblát
-- Ebben a táblában a filmek szereplőit fogjuk tárolni.
-- A mezők:
--  id
--  nev
--  szinesz
--  elso_megjelenes
--  fontos_szereplo
--  megjegyzes
--  film_id
-- Elvárások
--  Az id legyen elsődleges kulcs.
--  Az id automatikusan növekedjen.
--  A nev kötelező legyen.
--  A szinesz kötelező legyen.
--  A fontos_szereplo alapértelmezetten legyen hamis.
--  A film_id egész szám legyen.

create table szereplok (
    id tinyint unsigned primary key auto_increment,
    nev varchar(100) not null,
    szinesz varchar(100) not null,
    elso_megjelenes date,
    fontos_szereplo boolean default false,
    megjegyzes text,
    film_id tinyint unsigned,
    foreign key (film_id) references filmek(id)
);

-- 6. Táblamódosítások
-- A valóságban gyakran menet közben derül ki, hogy egy tábla szerkezete nem teljesen
-- megfelelő.
-- 6/a.
-- A filmek táblához adj hozzá egy új oszlopot:
--  bevetel_millio
-- Ez tört számokat is tudjon kezelni.
alter table filmek add bevetel_millio decimal(10,2) unsigned;

-- 6/b.
-- A szereplok táblához adj hozzá egy új oszlopot:
--  szereplo_tipus
-- Például: főszereplő, mellékszereplő, antagonista.
alter table szereplok add szereplo_tipus varchar(50);

-- 6/c.
-- A filmek táblához hozz létre egy fölösleges oszlopot:
--  plakat_szine
-- Majd később töröld ezt az oszlopot.
alter table filmek add plakat_szine varchar(20);

-- 6/d.
-- A szereplok táblában rájöttök, hogy nem akartok külön megjegyzést tárolni.
-- Töröld a megjegyzes oszlopot.
alter table szereplok drop column megjegyzes;

-- 7. Frissíts adatokat
-- 7/a.
-- Adj meg legalább 3 filmhez bevételi adatot.
update filmek set bevetel_millio = 500.00 where id = 1;
update filmek set bevetel_millio = 300.00 where id = 2;
update filmek set bevetel_millio = 200.00 where id = 3;

-- 7/b.
-- Adj meg legalább 4 szereplőhöz szereplő típust.
update szereplok set szereplo_tipus = 'főszereplő' where id = 1;
update szereplok set szereplo_tipus = 'mellékszereplő' where id = 2;
update szereplok set szereplo_tipus = 'antagonista' where id = 3;
update szereplok set szereplo_tipus = 'főszereplő' where id = 4;

-- 7/c.
-- Javítsd ki egy film értékelését.
update filmek set ertekeles = 8.5 where id = 1;

-- 7/d.
-- Módosítsd egy film költségvetését.
update filmek set koltsegvetes_millio = 150.00 where id = 2;

-- 7/e.
-- Állíts be legalább 3 szereplőnél, hogy fontos szereplők.
update szereplok set fontos_szereplo = true where id in (1, 4, 5);

-- 8. Törölj adatokat
-- 8/a.
-- Töröld a tesztfilmként felvett filmet.
delete from filmek where id = 4;

--8/b.
-- Törölj egy tesztként felvett szereplőt.
delete from szereplok where id = 5;

-- 8/c.
-- Törölj egy véletlenül kétszer felvitt szereplőt.
-- delete from szereplok where id = 6; -- Nekem ilen nem volt xD

-- 9. Egyszerű lekérdezések – SELECT és WHERE
-- Írj lekérdezéseket az alábbiakra.

-- 9/a.
-- Listázd ki az összes filmet.
select * from filmek;

-- 9/b.
-- Listázd ki az összes szereplőt.
select * from szereplok;

-- 9/c.
-- Csak a filmek címét és rendezőjét jelenítsd meg.
select cim, rendezo from filmek;

-- 9/d.
-- Listázd ki azokat a filmeket, amelyek értékelése nagyobb 8.5-nél.
select * from filmek where ertekeles > 8.5;

-- 9/e.
-- Listázd ki azokat a filmeket, amelyek játékideje több 110 percnél.
select * from filmek where jatekido_perc > 110;

-- 9/f.
-- Listázd ki azokat a filmeket, amelyekben van időutazás.
select * from filmek where idosutazas_van = true;

-- 9/g.
-- Listázd ki azokat a szereplőket, akik fontos szereplők.
select * from szereplok where fontos_szereplo = true;

-- 9/h.
-- Listázd ki azokat a szereplőket, akik egy megadott színészhez tartoznak.
select * from szereplok where szinesz = 'Michael J. Fox';

-- 9/i.
-- Listázd ki azokat a filmeket, amelyek egy megadott dátum után jelentek meg.
select * from filmek where megjelenes_datuma > '1985-01-01';

-- 9/j.
-- Listázd ki azokat a szereplőket, amelyekhez tartozik szereplő típus.
select * from szereplok where szereplo_tipus is not null;

-- 10. INNER JOIN feladatok
-- Most már két táblád van:
--  filmek

--  szereplok
-- A szereplok táblában szerepel egy film_id mező, amely megmondja, hogy az adott szereplő
-- melyik filmhez tartozik.
-- Oldd meg az alábbi feladatokat INNER JOIN segítségével.

-- 10/a.
-- Listázd ki a szereplők nevét és a hozzájuk tartozó film címét.
select szereplok.nev, filmek.cim from szereplok inner join filmek on szereplok.film_id = filmek.id;

-- 10/b.
-- Listázd ki a szereplők nevét, a színész nevét és a film címét.
select szereplok.nev, szereplok.szinesz, filmek.cim from szereplok inner join filmek on szereplok.film_id = filmek.id;

-- 10/c.
-- Listázd ki azokat a szereplőket a film címével együtt, akik fontos szereplők.
select szereplok.nev, filmek.cim from szereplok inner join filmek on szereplok.film_id = filmek.id where szereplok.fontos_szereplo = true;

-- 10/d.
-- Listázd ki azokat a szereplőket a film címével együtt, akikhez meg van adva szereplő típus.
select szereplok.nev, filmek.cim from szereplok inner join filmek on szereplok.film_id = filmek.id where szereplok.szereplo_tipus is not null;

-- 10/e.
-- Listázd ki azokat a filmeket és szereplőket, ahol a film értékelése nagyobb 8.5-nél.
select filmek.cim, szereplok.nev from filmek inner join szereplok on filmek.id = szereplok.film_id where filmek.ertekeles > 8.5;

-- 10/f.
-- Listázd ki azokat a szereplőket és filmeket, ahol a film 1989 után jelent meg.
select szereplok.nev, filmek.cim from szereplok inner join filmek on szereplok.film_id = filmek.id where filmek.megjelenes_datuma > '1989-12-31';

-- 10/g.
-- Listázd ki a film címét, a rendezőt és a szereplő nevét.
select filmek.cim, filmek.rendezo, szereplok.nev from filmek inner join szereplok on filmek.id = szereplok.film_id;

-- 10/h.
-- Listázd ki a fontos szereplők nevét és azoknak a filmeknek a címét, ahol van időutazás.
select szereplok.nev, filmek.cim from szereplok inner join filmek on szereplok.film_id = filmek.id where szereplok.fontos_szereplo = true and filmek.idosutazas_van = true;

-- 10/i.
-- Listázd ki a szereplő nevét, a színész nevét és a film értékelését.
select szereplok.nev, szereplok.szinesz, filmek.ertekeles from szereplok inner join filmek on szereplok.film_id = filmek.id;

-- 10/j.
-- Listázd ki azokat a szereplőket, akik a Vissza a jövőbe III. című filmhez tartoznak.
select szereplok.nev from szereplok inner join filmek on szereplok.film_id = filmek.id where filmek.cim = 'Vissza a jövőbe III.';
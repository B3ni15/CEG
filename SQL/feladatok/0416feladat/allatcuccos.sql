-- 2026.04.16. SQL feladat
-- 1. Tervezz adatbázist kisállatboltnak.
-- A bolt egy körülbelül 100 m^2-es térség.
-- Kis és közepes méretű állatok vannak benne.
-- Átlagosan napi 20 vásárló látogatja.
-- Legalább 5 évig nem szeretnénk módosítani az adatbázis szerkezetét.
-- Ezeket vedd figyelembe a típusok megadásánál.

create database kisallatbolt;
use kisallatbolt;

-- 2. Készíts táblát animals néven. Minden állatnak van:
-- azonosító
-- faja
-- neve
-- helyigénye (kis(pl. egér), közepes(pl. tengerimalac), nagy(pl. boa))
-- ára
-- befogadás dátuma
-- eladás dátuma (lehet null)
-- tápláléka
-- Adj hozzá 20 bejegyzést.

create table animals (
    id int primary key auto_increment,
    faj varchar(50),
    nev varchar(50),
    helyigeny enum('kis', 'kozepes', 'nagy'),
    ar decimal(10, 2),
    befogadas_datum date,
    eladas_datum date,
    taplaleka varchar(100)
);

-- 3. Készíts táblát customers néven.
-- azonosító
-- név
-- cím
-- telefonszám
-- e-mail
-- Adj hozzá 20 bejegyzést.

create table customers (
    id int primary key auto_increment,
    nev varchar(50),
    cim varchar(100),
    telefonszam varchar(20),
    email varchar(50)
);

-- 4. Készíts táblát purchases néven:
-- azonosító
-- ügyfél
-- állat
-- dátum
-- fizetési mód (kártya / készpénz)
-- Adj hozzá 10 bejegyzést.
-- 5. Írj lekérdezést a következőknek:

create table purchases (
    id int primary key auto_increment,
    ugyfel_id int,
    allat_id int,
    datum date,
    fizetesi_mod enum('kartya', 'keszpenz'),
    foreign key (ugyfel_id) references customers(id),
    foreign key (allat_id) references animals(id)
);

-- 2. feladat: mintaadatok az animals táblába
insert into animals (faj, nev, helyigeny, ar, befogadas_datum, eladas_datum, taplaleka) values
('eger', 'Pötty', 'kis', 3500.00, '2026-03-01', '2026-03-05', 'magkeverek'),
('eger', 'Morzsi', 'kis', 3200.00, '2026-03-03', null, 'magkeverek'),
('tengerimalac', 'Luna', 'kozepes', 12900.00, '2026-02-20', '2026-03-02', 'friss zoldseg, szena'),
('tengerimalac', 'Bodza', 'kozepes', 13500.00, '2026-02-25', null, 'friss zoldseg, szena'),
('hullamos papagaj', 'Sky', 'kis', 9800.00, '2026-03-10', null, 'mag, gyumolcs'),
('hullamos papagaj', 'Mimi', 'kis', 10200.00, '2026-03-11', '2026-03-18', 'mag, gyumolcs'),
('nyul', 'Hopp', 'kozepes', 14900.00, '2026-02-15', '2026-03-30', 'szena, zoldseg'),
('nyul', 'Tapso', 'kozepes', 15200.00, '2026-02-18', '2026-02-28', 'szena, zoldseg'),
('csincsilla', 'Felhő', 'kis', 21900.00, '2026-03-05', null, 'szaraz takarmany, szena'),
('törpenyúl', 'Mogyi', 'kis', 16800.00, '2026-03-06', '2026-03-20', 'szena, zoldseg'),
('gekkó', 'Zizi', 'kis', 17900.00, '2026-03-08', null, 'rovarok'),
('mosolygó gőte', 'Bubi', 'kozepes', 24900.00, '2026-03-09', '2026-03-25', 'fagyasztott eleseg'),
('kígyó', 'Vili', 'nagy', 39900.00, '2026-03-01', null, 'egerek, kisemlosok'),
('kígyó', 'Nora', 'nagy', 42900.00, '2026-03-02', '2026-03-22', 'egerek, kisemlosok'),
('sün', 'Cicó', 'kis', 18900.00, '2026-03-12', null, 'rovarok, gyumolcs'),
('patkany', 'Kormi', 'kis', 5200.00, '2026-03-13', '2026-03-19', 'magkeverek'),
('degu', 'Pici', 'kis', 7800.00, '2026-03-14', null, 'szena, magok'),
('tengerimalac', 'Bambusz', 'kozepes', 14100.00, '2026-03-15', null, 'friss zoldseg, szena'),
('papagaj', 'Rio', 'kis', 27500.00, '2026-03-16', '2026-03-29', 'magkeverek, gyumolcs'),
('nyul', 'Bundi', 'kozepes', 15800.00, '2026-03-17', null, 'szena, zoldseg');

-- 3. feladat: mintaadatok a customers táblába
insert into customers (nev, cim, telefonszam, email) values
('Kovacs Anna', '1111 Budapest, Alom utca 12.', '+36 20 111 1111', 'anna.kovacs@example.com'),
('Nagy Peter', '1052 Budapest, Foutca 8.', '+36 20 222 2222', 'peter.nagy@example.com'),
('Szabo Edit', '4024 Debrecen, Virag utca 4.', '+36 30 333 3333', 'edit.szabo@example.com'),
('Toth Gabor', '6720 Szeged, Tisza Lajos korut 22.', '+36 30 444 4444', 'gabor.toth@example.com'),
('Horvath Petra', '7621 Pecs, Kiraly utca 10.', '+36 20 555 5555', 'petra.horvath@example.com'),
('Varga Balazs', '9021 Gyor, Arany Janos utca 3.', '+36 70 666 6666', 'balazs.varga@example.com'),
('Kiss Judit', '8000 Szekesfehervar, Szent Istvan ter 1.', '+36 20 777 7777', 'judit.kiss@example.com'),
('Mészáros Dániel', '3525 Miskolc, Kazinczy utca 14.', '+36 70 888 8888', 'daniel.meszaros@example.com'),
('Farkas Zsófi', '9400 Sopron, Fő tér 6.', '+36 20 999 9999', 'zsofi.farkas@example.com'),
('Balogh Levente', '4400 Nyiregyhaza, Kossuth ter 2.', '+36 30 121 2121', 'levente.balogh@example.com'),
('Szekely Orsolya', '5000 Szolnok, Szapary utca 18.', '+36 20 131 3131', 'orsolya.szekely@example.com'),
('Takacs Martin', '3300 Eger, Dobó tér 5.', '+36 70 141 4141', 'martin.takacs@example.com'),
('Papp Rebeka', '5600 Békéscsaba, Andrássy út 11.', '+36 20 151 5151', 'rebeka.papp@example.com'),
('Barta Norbert', '8200 Veszprém, Jókai Mór utca 9.', '+36 30 161 6161', 'norbert.barta@example.com'),
('Szalai Dóra', '6000 Kecskemét, Rákóczi út 7.', '+36 20 171 7171', 'dora.szalai@example.com'),
('Lakatos Krisztián', '7400 Kaposvár, Fő utca 15.', '+36 70 181 8181', 'krisztian.lakatos@example.com'),
('Oláh Eszter', '6200 Kiskunfélegyháza, Petőfi utca 4.', '+36 20 191 9191', 'eszter.olah@example.com'),
('Molnár Bence', '2100 Gödöllő, Szabadság út 23.', '+36 30 202 0202', 'bence.molnar@example.com'),
('Király Réka', '3100 Salgótarján, Munkácsy út 1.', '+36 20 212 1212', 'reka.kiraly@example.com'),
('Juhász Márk', '2700 Cegléd, Kertész utca 8.', '+36 70 222 2223', 'mark.juhasz@example.com');

-- 4. feladat: mintaadatok a purchases táblába
insert into purchases (ugyfel_id, allat_id, datum, fizetesi_mod) values
(1, 1, '2026-03-05', 'keszpenz'),
(2, 3, '2026-03-02', 'kartya'),
(3, 6, '2026-03-18', 'kartya'),
(4, 8, '2026-02-28', 'keszpenz'),
(5, 10, '2026-03-20', 'kartya'),
(6, 12, '2026-03-25', 'keszpenz'),
(7, 14, '2026-03-22', 'kartya'),
(8, 16, '2026-03-19', 'keszpenz'),
(9, 19, '2026-03-29', 'kartya'),
(10, 7, '2026-03-30', 'keszpenz');

-- Listázd ki azokat az állatokat, amelyeket méreladtak.
select * from animals where eladas_datum is not null;
-- Számold ki az állatok átlagárát akiket még nem adtak el.
select avg(ar) as atlagar from animals where eladas_datum is null;
-- Keresd meg a legdrágább állatot.
select * from animals order by ar desc limit 1;
-- Listázd ki a vásárlásokat úgy, hogy megjelenik az ügyfél neve, az állat faja és a vásárlás dátuma.
select c.nev as ugyfel_neve, a.faj as allat_faja, p.datum as vasarlas_datum
from purchases p
join customers c on p.ugyfel_id = c.id
join animals a on p.allat_id = a.id;
-- Számold meg, hogy hány állat tartozik az egyes helyigény kategóriákba (amiket még nem adtunk el).
select helyigeny, count(*) as allat_szam
from animals
where eladas_datum is null
group by helyigeny;
-- Listázd ki melyik vásárló hány állatot vásárolt.
select c.nev as ugyfel_neve, count(*) as vasarolt_allatok_szama
from purchases p
join customers c on p.ugyfel_id = c.id
group by c.id;
-- Számold ki a bevételek összegét az állatok helyigénye szerint.
select a.helyigeny, sum(a.ar) as bevetel
from purchases p
join animals a on p.allat_id = a.id
group by a.helyigeny;
-- Listázd ki, hogy fajonként hány állatot adtak el.
select faj, count(*) as eladott_allatok_szama
from animals
where eladas_datum is not null
group by faj;
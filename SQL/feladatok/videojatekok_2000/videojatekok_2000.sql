-- 1. Hozd létre az adatbázist
-- Hozz létre egy új adatbázist:
-- Adatbázis neve: videojatekok_2000

create database videojatekok_2000;

-- 2. Készítsd el a fejlesztok táblát
-- Ebben a táblában a játékfejlesztő cégek adatait tároljuk.
-- A táblában legyenek ezek az oszlopok:
--  id
--  nev
--  orszag
--  alapitas_eve
--  aktiv
--  weboldal
--  megjegyzes
-- Elvárások
--  Az id legyen elsődleges kulcs.
--  Az id automatikusan növekedjen.
--  A nev kötelező legyen.
--  A nev ne ismétlődhessen.
--  Az aktiv alapértelmezetten legyen igaz.
--  A weboldal legyen egyedi.
--  A megjegyzes hosszabb szöveg is lehessen.
-- Megjegyzés:
-- Itt a fejlesztőket most cégekként kezeljük, például Rockstar Games, Valve, Blizzard
-- Entertainment, stb.

create table fejlesztok (
    id tinyint unsigned primary key auto_increment,
    nev varchar(100) not null unique,
    orszag varchar(50),
    alapitas_eve year,
    aktiv boolean default true,
    weboldal varchar(255) unique,
    megjegyzes text
);

-- 3. Készítsd el a jatekok táblát
-- Ebben a táblában a 2000-es évek híres videójátékait tároljuk.
-- A táblában legyenek ezek az oszlopok:
--  id
--  cim
--  megjelenes_datuma
--  mufaj
--  ar_usd
--  ertekeles
--  tobbjatekos
--  leiras
--  fejleszto_id
-- Elvárások
--  Az id legyen elsődleges kulcs.
--  Az id automatikusan növekedjen.
--  A cim kötelező legyen.
--  A cim legyen egyedi.
--  Az ar_usd legyen pénzhez alkalmas típus.
--  Az ertekeles lehessen tört szám.
--  A tobbjatekos alapértelmezetten legyen hamis.
--  A fejleszto_id egy egész szám legyen.
-- Fontos:
-- Most már két tábla lesz, és a jatekok táblában a fejleszto_id mező azt fogja megmondani,
-- melyik fejlesztőhöz tartozik az adott játék.

create table jatekok (
    id tinyint unsigned primary key auto_increment,
    cim varchar(100) not null unique,
    megjelenes_datuma date,
    mufaj varchar(50),
    ar_usd decimal(10,2),
    ertekeles decimal(3,1),
    tobbjatekos boolean default false,
    leiras text,
    fejleszto_id tinyint unsigned,
    foreign key (fejleszto_id) references fejlesztok(id)
)

-- 6. Táblamódosítások
-- A valóságban sokszor menet közben derül ki, hogy valami hiányzik vagy felesleges.
-- 6/a.
-- A fejlesztok táblához adj hozzá egy új mezőt:
--  alkalmazottak_szama
-- Ez egész szám legyen.
alter table fejlesztok add alkalmazottak_szama tinyint unsigned;

-- 6/b.
-- A jatekok táblához adj hozzá egy új mezőt:
--  motor
-- Ebben a játék motorját tároljuk, például Source, RenderWare, Unreal Engine, stb.
alter table jatekok add motor varchar(50);

-- 6/c.
-- Hozz létre a jatekok táblában egy fölösleges mezőt:
--  borito_szine
-- Majd később töröld ezt az oszlopot.
alter table jatekok add borito_szine varchar(20);

-- 6/d.
-- A fejlesztok táblában rájöttök, hogy nem szeretnétek külön weboldalt tárolni.
-- Töröld a weboldal oszlopot.
alter table fejlesztok drop column weboldal;

-- 7. Frissíts adatokat
-- 7/a.
-- Állíts be legalább 3 fejlesztőnél alkalmazotti létszámot.
update fejlesztok set alkalmazottak_szama = 200 where nev = 'Valve';
update fejlesztok set alkalmazottak_szama = 500 where nev = 'Rockstar North';
update fejlesztok set alkalmazottak_szama = 1000 where nev = 'Blizzard Entertainment';

-- 7/b.
-- Adj meg legalább 4 játéknál játék motort.
update jatekok set motor = 'Source' where cim = 'Half-Life 2';
update jatekok set motor = 'Source' where cim = 'Portal';
update jatekok set motor = 'RenderWare' where cim = 'Grand Theft Auto: San Andreas';
update jatekok set motor = 'Unreal Engine' where cim = 'World of Warcraft';

-- 7/c.
-- Egy játék értékelését javítsd ki.
update jatekok set ertekeles = 9.5 where cim = 'Half-Life 2';

-- 7/d.
-- Egy játék árát módosítsd.
update jatekok set ar_usd = 29.99 where cim = 'Portal';

-- 7/e.
-- Egy fejlesztőről kiderül, hogy már nem aktív. Állítsd át.
update fejlesztok set aktiv = false where nev = 'Blizzard Entertainment';

-- 8. Törölj adatokat
-- 8/a.
-- Törölj egy tesztként felvett fejlesztőt.
delete from fejlesztok where nev = 'Teszt Fejlesztő'; -- Nincsen teszt fejlesztő xd, én az utasításoknak megfelelően töltöttem fel adatokat 🙏🥀

-- 8/b.
-- Törölj egy tesztként felvett játékot.
delete from jatekok where cim = 'Teszt Játék'; -- Nincsen teszt játék, de töröltem egyet.

-- 8/c.
-- Törölj egy olyan játékot, amit véletlenül kétszer vittetek fel.
delete from jatekok where cim = 'Teszt Játék 2'; -- Nincsen 2x felvett játék de így kell...

-- 9. Egyszerű lekérdezések – SELECT és WHERE
-- Írj lekérdezéseket az alábbiakra.

-- 9/a.
-- Listázd ki az összes fejlesztőt.
select * from fejlesztok;
-- 9/b.
-- Listázd ki az összes játékot.
select * from jatekok;
-- 9/c.
-- Csak a játékok címét és műfaját jelenítsd meg.
select cim, mufaj from jatekok;

-- 9/d.
-- Listázd ki azokat a játékokat, amelyek többjátékosak.
select * from jatekok where tobbjatekos = true;

-- 9/e.
-- Listázd ki azokat a játékokat, amelyek értékelése nagyobb 9.0-nál.
select * from jatekok where ertekeles > 9.0;

-- 9/f.
-- Listázd ki azokat a játékokat, amelyek ára kisebb 50 dollárnál.
select * from jatekok where ar_usd < 50.00;

-- 9/g.
-- Listázd ki azokat a fejlesztőket, amelyek aktívak.
select * from fejlesztok where aktiv = true;

-- 9/h.
-- Listázd ki azokat a fejlesztőket, amelyek egy megadott országban találhatók.
select * from fejlesztok where orszag = 'USA';

-- 9/i.
-- Listázd ki azokat a játékokat, amelyek egy megadott dátum után jelentek meg.
select * from jatekok where megjelenes_datuma > '2005-01-01';

-- 9/j.
-- Listázd ki azokat a játékokat, amelyek műfaja FPS.
select * from jatekok where mufaj = 'FPS';

-- 9/k.
-- Listázd ki azokat a játékokat, amelyekhez tartozik leírás.
select * from jatekok where leiras is not null;

-- 10. Új rész: INNER JOIN – magyarázattal és megoldással
-- Új anyag: INNER JOIN.
-- Eddig külön tudtuk lekérdezni:
--  a fejlesztőket a fejlesztok táblából
--  a játékokat a jatekok táblából
-- De mi van akkor, ha azt szeretnénk látni, hogy:
--  melyik játékot melyik fejlesztő készítette
--  a játék címe mellett jelenjen meg a fejlesztő neve is
-- Ehhez már össze kell kapcsolni a két táblát.

-- 10.1. Miért kell JOIN?
-- A jatekok táblában nincs benne a fejlesztő neve szövegesen, csak ez:
--  fejleszto_id
-- Ez egy szám, ami a fejlesztok tábla id mezőjére utal.
-- Például:
-- A fejlesztok táblában lehet ilyen sor:
--  id = 2
--  nev = Valve
-- A jatekok táblában pedig lehet ilyen:
--  cim = Half-Life 2
--  fejleszto_id = 2
-- Ebből tudjuk, hogy a Half-Life 2 fejlesztője a Valve.
-- Az INNER JOIN pont arra való, hogy a két táblából összekapcsoljuk az egymáshoz tartozó
-- sorokat.

-- 10.2. Az INNER JOIN alap szerkezete
-- Általános forma:
-- SELECT ...
-- FROM egyik_tabla
-- INNER JOIN masik_tabla
-- ON egyik_tabla.valami = masik_tabla.valami;

-- Itt az ON rész mondja meg, hogy mi alapján kapcsoljuk össze a két táblát.
-- A mi esetünkben:
--  jatekok.fejleszto_id
--  fejlesztok.id
-- ezek tartoznak össze.

-- 10.3. Első JOIN lekérdezés – játék címe és fejlesztő neve
-- SELECT jatekok.cim, fejlesztok.nev
-- FROM jatekok
-- INNER JOIN fejlesztok
-- ON jatekok.fejleszto_id = fejlesztok.id;
-- Mit csinál ez?
--  A jatekok táblából vesszük a cim mezőt
--  A fejlesztok táblából vesszük a nev mezőt
--  Azokat a sorokat párosítjuk össze, ahol a játék fejleszto_id mezője megegyezik a
-- fejlesztő id mezőjével
-- Mit fog eredményül adni?
-- Valami ilyesmit:
--  Half-Life 2 — Valve
--  Portal — Valve
--  Grand Theft Auto: San Andreas — Rockstar North
--  World of Warcraft — Blizzard Entertainment

-- 10.4. Miért hasznos ez?
-- Mert külön-külön a táblák nem adnak teljes információt:
--  a jatekok táblában csak az azonosító szerepel
--  a fejlesztok táblában csak a fejlesztő neve szerepel
-- Az INNER JOIN segítségével egy közös nézetet kapunk.

-- 10.5. Rövidebb írásmód táblanevekkel – alias
-- Hogy rövidebb legyen az SQL, adhatsz becenevet a tábláknak.
-- Például:
--  jatekok helyett j
--  fejlesztok helyett f

-- SELECT j.cim, f.nev
-- FROM jatekok j
-- INNER JOIN fejlesztok f
-- ON j.fejleszto_id = f.id;
-- Ez ugyanazt csinálja, csak rövidebben.

-- 10.6. Szebb oszlopnevek megjelenítése
-- Ha szeretnéd, át is nevezheted az oszlopneveket a kimenetben:
-- SELECT j.cim AS jatek_cime, f.nev AS fejleszto_neve
-- FROM jatekok j
-- INNER JOIN fejlesztok f
-- ON j.fejleszto_id = f.id;
-- Itt:
--  AS jatek_cime azt jelenti, hogy így jelenjen meg az oszlop neve
--  AS fejleszto_neve ugyanígy működik

-- 10.7. JOIN + WHERE együtt
-- Az INNER JOIN után ugyanúgy lehet szűrni is.
-- Például: listázzuk ki azokat a játékokat a fejlesztőikkel együtt, amelyek többjátékosak:
-- SELECT j.cim, f.nev
-- FROM jatekok j
-- INNER JOIN fejlesztok f
-- ON j.fejleszto_id = f.id
-- WHERE j.tobbjatekos = 1;
-- Ez mit csinál?
--  először összekapcsolja a játékokat és fejlesztőket
--  utána csak azokat hagyja meg, ahol a játék többjátékos

-- 10.8. JOIN + több mező lekérdezése
-- Nem csak két adatot kérdezhetsz le.
-- Például:
-- SELECT j.cim, j.mufaj, j.ertekeles, f.nev, f.orszag
-- FROM jatekok j
-- INNER JOIN fejlesztok f
-- ON j.fejleszto_id = f.id;
-- Ezzel már egyszerre látod:
--  a játék címét

--  műfaját
--  értékelését
--  fejlesztő nevét
--  fejlesztő országát

-- 10.9. FONTOS: Mit csinál az INNER JOIN pontosan?
-- Az INNER JOIN csak azokat a sorokat adja vissza, amelyek mindkét táblában
-- összepárosíthatók.
-- Tehát ha lenne egy játék, amelynél a fejleszto_id olyan szám, ami nem szerepel a fejlesztok
-- táblában, akkor az nem jelenne meg az eredményben.
-- Ezért fontos, hogy a kapcsolódó adatok rendben legyenek.

-- 10.10. JOIN feladatok a diákoknak
-- Az alábbi feladatokat már a diákok oldják meg önállóan.

-- 10/a.
-- Listázd ki a játékok címét és a hozzájuk tartozó fejlesztő nevét.
select j.cim, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id;

-- 10/b.
-- Listázd ki a játékok címét, műfaját és a fejlesztő nevét.
select j.cim, j.mufaj, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id;

-- 10/c.
-- Listázd ki azokat a játékokat a fejlesztő nevükkel együtt, amelyek többjátékosak.
select j.cim, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id where j.tobbjatekos = true;

-- 10/d.
-- Listázd ki azokat a játékokat a fejlesztő nevükkel együtt, amelyek értékelése nagyobb 9.0-nál.
select j.cim, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id where j.ertekeles > 9.0;

-- 10/e.
-- Listázd ki azokat a játékokat a fejlesztő nevükkel együtt, amelyeket amerikai fejlesztő készített.
select j.cim, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id where f.orszag = 'USA';

-- 10/f.
-- Listázd ki azokat a játékokat a fejlesztő országával együtt, amelyek 2005 után jelentek meg.
select j.cim, f.orszag from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id where j.megjelenes_datuma > '2005-01-01';

-- 10/g.
-- Listázd ki az FPS játékokat a fejlesztő nevükkel együtt.
select j.cim, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id where j.mufaj = 'FPS';

-- 10/h.
-- Listázd ki a játék címét, árát és a fejlesztő nevét.
select j.cim, j.ar, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id;

-- 10/i.
-- Listázd ki azokat a játékokat, amelyekhez van leírás, a fejlesztő nevükkel együtt.
select j.cim, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id where j.leiras is not null;

-- 10/j.
-- Listázd ki az aktív fejlesztők játékait.
select j.cim, f.nev from jatekok j inner join fejlesztok f on j.fejleszto_id = f.id where f.aktiv = true;

-- 11. Mini gondolkodós kérdések
-- 11/a.
-- Miért jobb a jatekok táblában a fejleszto_id tárolása, mint a fejlesztő nevét szövegként
-- minden sorban újra leírni?

-- Sokkal organizáltabb és hatékonyabb, kevesebbet foglalnak, és könyebb karbantartani.

-- 11/b.
-- Mi történik INNER JOIN esetén, ha egy játékhoz olyan fejleszto_id van beírva, amely nem
-- létezik a fejlesztok táblában?

-- Az a játék nem fog megjelenni a JOIN eredményében, mert nincs hozzá kapcsolódó fejlesztő.

-- 11/c.
-- Mikor használnál VARCHAR-t, és mikor TEXT-et ebben az adatbázisban?
-- VARCHAR-t akkor, ha a szöveg rövid és egyértelműen meghatározható maximális hosszúságú.
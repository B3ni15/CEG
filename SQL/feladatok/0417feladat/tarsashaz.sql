-- Adatbázis létrehozása
CREATE DATABASE IF NOT EXISTS tarsashaz DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE tarsashaz;

-- Táblák létrehozása
-- tbl: lakasok
CREATE TABLE lakas (
    id INT PRIMARY KEY,
    utca VARCHAR(50),
    hazszam VARCHAR(10),
    alapterulet INT,
    szobaszam INT
);

-- tbl: tulajok
CREATE TABLE tulajdonos (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    adoszam VARCHAR(15)
);

-- tbl: tulajdoni hanyad
CREATE TABLE tulajdon (
    lakasid INT,
    tulajdonosid INT,
    hanyad DOUBLE,
    FOREIGN KEY (lakasid) REFERENCES lakas(id),
    FOREIGN KEY (tulajdonosid) REFERENCES tulajdonos(id)
);

-- Lekérdezések (Mintapéldák a feladatleírás alapján)
-- 2. feladat: Összes lakás száma
SELECT COUNT(l.id) AS lakasszam
FROM lakas l;

-- 3. feladat: Adott tulajdonos lakásai
SELECT l.utca, l.hazszam
FROM lakas l
JOIN tulajdon t ON l.id = t.lakasid
JOIN tulajdonos tu ON t.tulajdonosid = tu.id
WHERE tu.adoszam = '68396';

-- 5. feladat: Statisztika adósávok szerint (példa logika)
-- random megj.: ez inkabb utca szerinti mini-kimutatas
SELECT COUNT(l.id) AS telek_szam, SUM(l.alapterulet * 100) AS ossz_ado
FROM lakas l
GROUP BY l.utca;
-- Adatbázis létrehozása
CREATE DATABASE IF NOT EXISTS tarsashaz DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE tarsashaz;

-- Táblák létrehozása
CREATE TABLE lakas (
    id INT PRIMARY KEY,
    utca VARCHAR(50),
    hazszam VARCHAR(10),
    alapterulet INT,
    szobaszam INT
);

CREATE TABLE tulajdonos (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    adoszam VARCHAR(15)
);

CREATE TABLE tulajdon (
    lakasid INT,
    tulajdonosid INT,
    hanyad DOUBLE,
    FOREIGN KEY (lakasid) REFERENCES lakas(id),
    FOREIGN KEY (tulajdonosid) REFERENCES tulajdonos(id)
);

-- Lekérdezések (Mintapéldák a feladatleírás alapján)
-- 2. feladat: Összes lakás száma
SELECT COUNT(id) AS lakasszam FROM lakas;

-- 3. feladat: Adott tulajdonos lakásai
SELECT l.utca, l.hazszam FROM lakas l 
JOIN tulajdon t ON l.id = t.lakasid 
JOIN tulajdonos tu ON t.tulajdonosid = tu.id 
WHERE tu.adoszam = '68396';

-- 5. feladat: Statisztika adósávok szerint (példa logika)
SELECT COUNT(id) AS telek_szam, SUM(alapterulet * 100) AS ossz_ado 
FROM lakas GROUP BY utca;
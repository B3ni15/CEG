CREATE DATABASE IF NOT EXISTS nobel_dijak DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE nobel_dijak;

-- tbl: evek/korszakok
CREATE TABLE kor (
    id INT PRIMARY KEY,
    evszam INT
);

-- tbl: dijazottak
CREATE TABLE dijazott (
    id INT PRIMARY KEY,
    korid INT,
    nev VARCHAR(100),
    szuletes_halal VARCHAR(20),
    orszagkod VARCHAR(5),
    FOREIGN KEY (korid) REFERENCES kor(id)
);

-- 2. feladat: 2022-es díjazottak
SELECT d.nev
FROM dijazott d
JOIN kor k ON d.korid = k.id
WHERE k.evszam = 2022;

-- 3. feladat: Curie család
SELECT k.evszam, d.nev
FROM dijazott d
JOIN kor k ON d.korid = k.id
WHERE d.nev LIKE '%Curie%'
ORDER BY k.evszam;

-- 4. feladat: Országonkénti statisztika (legalább 5 díj)
SELECT d.orszagkod, COUNT(d.id) AS dij_db
FROM dijazott d
GROUP BY d.orszagkod
HAVING COUNT(d.id) >= 5
ORDER BY COUNT(d.id) DESC;

-- 5. feladat: Szervezetnek adott díjak
SELECT k.evszam, d.nev
FROM dijazott d
JOIN kor k ON d.korid = k.id
WHERE d.szuletes_halal = '' OR d.szuletes_halal IS NULL;

-- 6. feladat: Jelentéshez (Dajka-féle kutatás)
-- random megj.: H = magyar jeloles itt az adatban
SELECT d.nev, k.evszam
FROM dijazott d
JOIN kor k ON d.korid = k.id
WHERE d.orszagkod = 'H'
ORDER BY k.evszam;
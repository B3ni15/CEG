CREATE DATABASE IF NOT EXISTS tarsasjatek DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE tarsasjatek;

-- tbl: palyak
CREATE TABLE palya (
    id INT PRIMARY KEY,
    nev VARCHAR(50)
);

-- tbl: mezok
CREATE TABLE mezo (
    palyaid INT,
    sorszam INT,
    tipus CHAR(1),
    FOREIGN KEY (palyaid) REFERENCES palya(id)
);

-- 2. feladat: "Veszély" típusú mezők száma pályánként
SELECT p.nev, COUNT(m.sorszam) AS veszely_db
FROM palya p
JOIN mezo m ON p.id = m.palyaid
WHERE m.tipus = 'V'
GROUP BY p.id;

-- 3. feladat: A leghosszabb pálya
SELECT p.nev
FROM palya p
WHERE p.id = (
    SELECT m.palyaid
    FROM mezo m
    GROUP BY m.palyaid
    ORDER BY MAX(m.sorszam) DESC
    LIMIT 1
);

-- 5. feladat: Mezőtípusok eloszlása egy adott pályán (pl. 9-es)
-- random: ez jo gyors ellenorzes palyankent
SELECT m.tipus, COUNT(*) AS tipus_db
FROM mezo m
WHERE m.palyaid = 9
GROUP BY m.tipus;
CREATE DATABASE IF NOT EXISTS tarsasjatek DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE tarsasjatek;

CREATE TABLE palya (
    id INT PRIMARY KEY,
    nev VARCHAR(50)
);

CREATE TABLE mezo (
    palyaid INT,
    sorszam INT,
    tipus CHAR(1),
    FOREIGN KEY (palyaid) REFERENCES palya(id)
);

-- 2. feladat: "Veszély" típusú mezők száma pályánként
SELECT p.nev, COUNT(m.sorszam) FROM palya p JOIN mezo m ON p.id = m.palyaid 
WHERE m.tipus = 'V' GROUP BY p.id;

-- 3. feladat: A leghosszabb pálya
SELECT nev FROM palya WHERE id = (SELECT palyaid FROM mezo GROUP BY palyaid ORDER BY MAX(sorszam) DESC LIMIT 1);

-- 5. feladat: Mezőtípusok eloszlása egy adott pályán (pl. 9-es)
SELECT tipus, COUNT(*) FROM mezo WHERE palyaid = 9 GROUP BY tipus;
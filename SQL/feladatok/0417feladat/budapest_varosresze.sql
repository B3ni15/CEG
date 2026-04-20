CREATE DATABASE IF NOT EXISTS budapest DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE budapest;

-- tbl: keruletek
CREATE TABLE kerulet (
    id INT PRIMARY KEY,
    nev VARCHAR(20),
    lakossagszam INT,
    terulet DOUBLE
);

-- tbl: varosreszek
CREATE TABLE varosresz (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    keruletid INT,
    lakossagszam INT,
    FOREIGN KEY (keruletid) REFERENCES kerulet(id)
);

-- Lekérdezések
-- 2. feladat: V. kerületi városrészek
SELECT v.nev
FROM varosresz v
WHERE v.keruletid = 5;

-- 5. feladat: Kerületek átlagos lakosságszáma
SELECT AVG(k.lakossagszam) AS atlag_lakossag
FROM kerulet k;

-- 7. feladat: XIII. kerület pontossága (összeg összehasonlítása)
-- random megj.: arany ~ 1 korul jo, ha az adatok passzolnak
SELECT (SUM(v.lakossagszam) / k.lakossagszam) AS arany
FROM varosresz v
JOIN kerulet k ON v.keruletid = k.id
WHERE k.nev = 'XIII.'
GROUP BY k.id;
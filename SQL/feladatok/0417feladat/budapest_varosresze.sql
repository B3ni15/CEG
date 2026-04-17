CREATE DATABASE IF NOT EXISTS budapest DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE budapest;

CREATE TABLE kerulet (
    id INT PRIMARY KEY,
    nev VARCHAR(20),
    lakossagszam INT,
    terulet DOUBLE
);

CREATE TABLE varosresz (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    keruletid INT,
    lakossagszam INT,
    FOREIGN KEY (keruletid) REFERENCES kerulet(id)
);

-- Lekérdezések
-- 2. feladat: V. kerületi városrészek
SELECT nev FROM varosresz WHERE keruletid = 5;

-- 5. feladat: Kerületek átlagos lakosságszáma
SELECT AVG(lakossagszam) FROM kerulet;

-- 7. feladat: XIII. kerület pontossága (összeg összehasonlítása)
SELECT (SUM(v.lakossagszam) / k.lakossagszam) AS arany 
FROM varosresz v JOIN kerulet k ON v.keruletid = k.id 
WHERE k.nev = 'XIII.' GROUP BY k.id;
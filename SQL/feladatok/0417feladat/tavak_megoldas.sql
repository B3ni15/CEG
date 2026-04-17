-- Adatbázis és táblák létrehozása
CREATE DATABASE IF NOT EXISTS magyar_tavak;
USE magyar_tavak;

-- tbl: allovizek
CREATE TABLE alloviz (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    tipus VARCHAR(50),
    terulet DOUBLE,
    vizgyujto DOUBLE
);

-- tbl: telepules GPS
CREATE TABLE telepulesgps (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    hosszusag DOUBLE,
    szelesseg DOUBLE
);

-- tbl: kapcsolat to-many
CREATE TABLE helykapcs (
    allovizid INT,
    gpsid INT,
    FOREIGN KEY (allovizid) REFERENCES alloviz(id),
    FOREIGN KEY (gpsid) REFERENCES telepulesgps(id)
);

-- Lekérdezések
-- 2morotva
SELECT a.nev, a.terulet
FROM alloviz a
WHERE a.tipus LIKE '%morotva%'
ORDER BY a.terulet DESC;

-- 3vizarany
SELECT SUM(a.terulet) / 93036 AS vizarany
FROM alloviz a;

-- 4kozepes
SELECT a.nev, a.tipus, a.terulet
FROM alloviz a
WHERE a.terulet BETWEEN 3 AND 10
    AND a.vizgyujto >= 10 * a.terulet;

-- 5sok
SELECT a.nev, COUNT(h.gpsid) AS telep_db
FROM alloviz a
JOIN helykapcs h ON a.id = h.allovizid
GROUP BY a.nev
HAVING COUNT(h.gpsid) >= 3;

-- 6keletnyugat
SELECT a.nev
FROM alloviz a
JOIN helykapcs h ON a.id = h.allovizid
JOIN telepulesgps t ON h.gpsid = t.id
GROUP BY a.nev
ORDER BY (MAX(t.hosszusag) - MIN(t.hosszusag)) DESC
LIMIT 1;

-- 7egyegy
SELECT a.nev, a.terulet, t.nev
FROM alloviz a
JOIN helykapcs h ON a.id = h.allovizid
JOIN telepulesgps t ON t.id = h.gpsid
WHERE h.allovizid IN (
        SELECT h2.allovizid
        FROM helykapcs h2
        GROUP BY h2.allovizid
        HAVING COUNT(h2.gpsid) = 1
)
AND h.gpsid IN (
        SELECT h3.gpsid
        FROM helykapcs h3
        GROUP BY h3.gpsid
        HAVING COUNT(h3.allovizid) = 1
);

-- 8tipus
-- random: tipus szerinti rendezes, riporthoz jo
SELECT a.tipus, a.nev, a.terulet
FROM alloviz a
WHERE a.tipus IS NOT NULL
ORDER BY a.tipus, a.nev;
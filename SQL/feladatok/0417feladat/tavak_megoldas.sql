-- Adatbázis és táblák létrehozása
CREATE DATABASE IF NOT EXISTS magyar_tavak;
USE magyar_tavak;

CREATE TABLE alloviz (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    tipus VARCHAR(50),
    terulet DOUBLE,
    vizgyujto DOUBLE
);

CREATE TABLE telepulesgps (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    hosszusag DOUBLE,
    szelesseg DOUBLE
);

CREATE TABLE helykapcs (
    allovizid INT,
    gpsid INT,
    FOREIGN KEY (allovizid) REFERENCES alloviz(id),
    FOREIGN KEY (gpsid) REFERENCES telepulesgps(id)
);

-- Lekérdezések
-- 2morotva
SELECT nev, terulet FROM alloviz WHERE tipus LIKE '%morotva%' ORDER BY terulet DESC;

-- 3vizarany
SELECT SUM(terulet) / 93036 AS vizarany FROM alloviz;

-- 4kozepes
SELECT nev, tipus, terulet FROM alloviz WHERE terulet BETWEEN 3 AND 10 AND vizgyujto >= 10 * terulet;

-- 5sok
SELECT alloviz.nev, COUNT(helykapcs.gpsid) FROM alloviz 
JOIN helykapcs ON alloviz.id = helykapcs.allovizid 
GROUP BY alloviz.nev HAVING COUNT(helykapcs.gpsid) >= 3;

-- 6keletnyugat
SELECT alloviz.nev FROM alloviz 
JOIN helykapcs ON alloviz.id = helykapcs.allovizid 
JOIN telepulesgps ON helykapcs.gpsid = telepulesgps.id 
GROUP BY alloviz.nev ORDER BY (MAX(hosszusag) - MIN(hosszusag)) DESC LIMIT 1;

-- 7egyegy
SELECT a.nev, a.terulet, t.nev FROM alloviz a, helykapcs h, telepulesgps t 
WHERE a.id=h.allovizid AND t.id=h.gpsid 
AND h.allovizid IN (SELECT allovizid FROM helykapcs GROUP BY allovizid HAVING COUNT(gpsid)=1)
AND h.gpsid IN (SELECT gpsid FROM helykapcs GROUP BY gpsid HAVING COUNT(allovizid)=1);

-- 8tipus
SELECT tipus, nev, terulet FROM alloviz WHERE tipus IS NOT NULL ORDER BY tipus, nev;
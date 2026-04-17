CREATE DATABASE IF NOT EXISTS bubi_allomasok;
USE bubi_allomasok;

CREATE TABLE allomas (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    ev INT,
    dokszam INT
);

CREATE TABLE hely (
    allomasid INT,
    kerulet INT,
    cim VARCHAR(200),
    FOREIGN KEY (allomasid) REFERENCES allomas(id)
);

-- 2belvaros
SELECT cim FROM hely WHERE kerulet = 5;

-- 3bovules
SELECT ev, COUNT(id), SUM(dokszam) FROM allomas GROUP BY ev;

-- 4uj
SELECT DISTINCT h.kerulet FROM hely h JOIN allomas a ON h.allomasid = a.id WHERE a.ev >= 2016;

-- 5atlag
SELECT AVG(dokszam) FROM allomas a JOIN hely h ON a.id = h.allomasid WHERE h.kerulet = 2;

-- 6ellatottsag
SELECT kerulet, COUNT(allomasid) FROM hely GROUP BY kerulet ORDER BY COUNT(allomasid) DESC LIMIT 1;

-- 7kerulet
SELECT a.id, a.dokszam, h.cim FROM allomas a JOIN hely h ON a.id = h.allomasid WHERE h.kerulet = 7;
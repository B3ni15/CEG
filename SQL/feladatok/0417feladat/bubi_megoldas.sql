CREATE DATABASE IF NOT EXISTS bubi_allomasok;
USE bubi_allomasok;

-- tbl: allomasok
CREATE TABLE allomas (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    ev INT,
    dokszam INT
);

-- tbl: hely adatok
CREATE TABLE hely (
    allomasid INT,
    kerulet INT,
    cim VARCHAR(200),
    FOREIGN KEY (allomasid) REFERENCES allomas(id)
);

-- 2) Belvarosi cimek (5. ker.)
SELECT h.cim
FROM hely h
WHERE h.kerulet = 5;

-- 3) Bovules evek szerint
SELECT a.ev, COUNT(a.id) AS all_db, SUM(a.dokszam) AS dok_ossz
FROM allomas a
GROUP BY a.ev;

-- 4) Mely keruletekben volt uj allomas 2016-tol
SELECT DISTINCT h.kerulet
FROM hely h
JOIN allomas a ON h.allomasid = a.id
WHERE a.ev >= 2016;

-- 5) 2. keruleti allomasok atlagos dsz
SELECT AVG(a.dokszam) AS atlag_dok
FROM allomas a
JOIN hely h ON a.id = h.allomasid
WHERE h.kerulet = 2;

-- 6) Legjobban ellatott kerulet
SELECT h.kerulet, COUNT(h.allomasid) AS all_db
FROM hely h
GROUP BY h.kerulet
ORDER BY COUNT(h.allomasid) DESC
LIMIT 1;

-- 7) 7. keruleti allomasok listaja
-- random megj.: ezt altalaban mindig kerdezik zh-n
SELECT a.id, a.dokszam, h.cim
FROM allomas a
JOIN hely h ON a.id = h.allomasid
WHERE h.kerulet = 7;
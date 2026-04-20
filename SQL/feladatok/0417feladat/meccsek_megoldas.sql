CREATE DATABASE IF NOT EXISTS focimeccs;
USE focimeccs;

-- tbl: meccsek
CREATE TABLE meccs (
    id INT PRIMARY KEY,
    datum DATE,
    kezdes TIME,
    tipus VARCHAR(20),
    belepo INT
);

-- tbl: nezok
CREATE TABLE nezo (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    ferfi BOOLEAN,
    berletes BOOLEAN
);

-- tbl: belepesek
CREATE TABLE belepes (
    meccsid INT,
    nezoid INT,
    idopont DATETIME,
    FOREIGN KEY (meccsid) REFERENCES meccs(id),
    FOREIGN KEY (nezoid) REFERENCES nezo(id)
);

-- 2) Bajnoki meccsek datum szerint
SELECT m.datum
FROM meccs m
WHERE m.tipus = 'bajnoki'
ORDER BY m.datum;

-- 3) Legutolso meccs belepoara
SELECT m.belepo
FROM meccs m
ORDER BY m.datum DESC, m.kezdes DESC
LIMIT 1;

-- 4) Nezoszam meccsenkent
SELECT m.datum, COUNT(b.nezoid) AS nezoszam
FROM meccs m
LEFT JOIN belepes b ON m.id = b.meccsid
GROUP BY m.id;

-- 5) Szept. jegybevetel (berletes nelkul)
SELECT SUM(m.belepo) AS bevetel
FROM meccs m
JOIN belepes b ON m.id = b.meccsid
JOIN nezo n ON b.nezoid = n.id
WHERE m.datum BETWEEN '2018-09-01' AND '2018-09-30'
    AND n.berletes = FALSE;

-- 6) Egyutt mely meccseken voltak bent
SELECT DISTINCT m.datum
FROM meccs m
JOIN belepes b1 ON m.id = b1.meccsid
JOIN nezo n1 ON b1.nezoid = n1.id
JOIN belepes b2 ON m.id = b2.meccsid
JOIN nezo n2 ON b2.nezoid = n2.id
WHERE n1.nev = 'Kiss Dorina'
    AND n2.nev = 'Varga Zsolt';

-- 7) Jelentes sorok
-- random megj.: ez tipikus lista-feladat
SELECT m.datum, m.kezdes, m.belepo
FROM meccs m
WHERE m.tipus = 'bajnoki'
ORDER BY m.datum;
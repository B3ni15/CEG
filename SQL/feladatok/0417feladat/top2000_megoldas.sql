CREATE DATABASE IF NOT EXISTS zene_lista;
USE zene_lista;

-- tbl: eloadok
CREATE TABLE eloadok (
    eloadoid INT PRIMARY KEY,
    nev VARCHAR(100),
    zenekar BOOLEAN
);

-- tbl: dalok
CREATE TABLE dalok (
    dalid INT PRIMARY KEY,
    eloadoid INT,
    cim VARCHAR(100),
    megjelenes INT,
    FOREIGN KEY (eloadoid) REFERENCES eloadok(eloadoid)
);

-- tbl: eves top lista
CREATE TABLE lista (
    ev INT,
    helyezes INT,
    dalid INT,
    FOREIGN KEY (dalid) REFERENCES dalok(dalid)
);

-- 2zenekar
SELECT e.nev
FROM eloadok e
WHERE e.zenekar = TRUE
ORDER BY e.nev;

-- 3love
SELECT e.nev, d.cim, d.megjelenes
FROM eloadok e
JOIN dalok d ON e.eloadoid = d.eloadoid
WHERE d.cim LIKE '% love %'
     OR d.cim LIKE 'love %'
     OR d.cim LIKE '% love'
     OR d.cim = 'love'
ORDER BY d.megjelenes DESC;

-- 4szilveszter
SELECT l.helyezes, e.nev, d.cim
FROM lista l
JOIN dalok d ON l.dalid = d.dalid
JOIN eloadok e ON d.eloadoid = e.eloadoid
WHERE l.ev = 2019
    AND l.helyezes <= 285
ORDER BY l.helyezes;

-- 5mindig
SELECT e.nev, d.cim
FROM lista l
JOIN dalok d ON l.dalid = d.dalid
JOIN eloadok e ON d.eloadoid = e.eloadoid
GROUP BY d.dalid
HAVING COUNT(l.ev) = 21;

-- 6ujak
SELECT l.helyezes, e.nev, d.cim
FROM lista l
JOIN dalok d ON l.dalid = d.dalid
JOIN eloadok e ON d.eloadoid = e.eloadoid
WHERE l.ev = 2019
    AND l.dalid NOT IN (
            SELECT l2.dalid
            FROM lista l2
            WHERE l2.ev = 2018
    )
ORDER BY l.helyezes;

-- 7jelentes
-- random megj.: ez mar mehetne egy riport tablaba is
SELECT l.ev, l.helyezes, e.nev, d.cim, d.megjelenes
FROM lista l
JOIN dalok d ON l.dalid = d.dalid
JOIN eloadok e ON d.eloadoid = e.eloadoid
WHERE l.helyezes <= 10;
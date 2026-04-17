CREATE DATABASE IF NOT EXISTS autopalyak DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE autopalyak;

-- tbl: utak (rövid oszlopnevek, sulis stílus)
CREATE TABLE ut (
    id INT PRIMARY KEY,
    nev VARCHAR(10),
    tipus VARCHAR(20)
);

-- tbl: csomópontok
CREATE TABLE csomopont (
    id INT PRIMARY KEY,
    utid INT,
    nev VARCHAR(100),
    km INT,
    FOREIGN KEY (utid) REFERENCES ut(id)
);

-- Lekérdezések (gyakorlás)
-- 1) M7 csomópontjai km szerint (egyszerű, de jó)
SELECT c.nev, c.km
FROM csomopont c
WHERE c.utid = (
    SELECT u.id
    FROM ut u
    WHERE u.nev = 'M7'
)
ORDER BY c.km;

-- 2) Csomópont db/út (itt most nincs km szűrés, csak darabszám)
-- random megj.: vizsga előtt ezt még 1x átnézni :)
SELECT u.nev AS ut_nev, COUNT(c.id) AS cs_db
FROM ut u
JOIN csomopont c ON u.id = c.utid
GROUP BY u.nev;

-- 3) Extra minta: 0-120 km közötti csomópontok
-- rövidítés: cp = csomópont
SELECT u.nev AS ut, c.nev AS cp, c.km
FROM ut u
JOIN csomopont c ON u.id = c.utid
WHERE c.km BETWEEN 0 AND 120
ORDER BY u.nev, c.km;
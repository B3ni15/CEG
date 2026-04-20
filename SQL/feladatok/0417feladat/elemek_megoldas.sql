CREATE DATABASE IF NOT EXISTS kemiai_elemek DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE kemiai_elemek;

-- tbl: felfedezok
CREATE TABLE felfedezo (
    id INT PRIMARY KEY,
    nev VARCHAR(100)
);

-- tbl: elemek
CREATE TABLE elem (
    rendszam INT PRIMARY KEY,
    vegyjel VARCHAR(5),
    nev VARCHAR(50),
    ev INT,
    felfedezoid INT,
    FOREIGN KEY (felfedezoid) REFERENCES felfedezo(id)
);

-- 2. feladat: Ókorban ismert elemek
SELECT e.nev, e.vegyjel
FROM elem e
WHERE e.ev = -1
ORDER BY e.nev;

-- 3. feladat: Arany és ezüst rendszáma
SELECT e.nev, e.rendszam
FROM elem e
WHERE e.nev IN ('Arany', 'Ezüst');

-- 4. feladat: 1900 után felfedezett elemek száma
SELECT COUNT(e.rendszam) AS db_1900_utan
FROM elem e
WHERE e.ev > 1900;

-- 5. feladat: Felfedezők és az általuk talált elemek száma (több mint 3)
SELECT f.nev, COUNT(e.rendszam) AS elem_db
FROM felfedezo f
JOIN elem e ON f.id = e.felfedezoid
GROUP BY f.id
HAVING COUNT(e.rendszam) > 3
ORDER BY COUNT(e.rendszam) DESC;

-- 6. feladat: Humphry Davy felfedezései
-- rovidites: f = felfedezo, e = elem
SELECT e.nev, e.ev
FROM elem e
JOIN felfedezo f ON e.felfedezoid = f.id
WHERE f.nev = 'Humphry Davy'
ORDER BY e.ev;
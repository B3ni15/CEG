CREATE DATABASE IF NOT EXISTS kepfeldolgozas DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE kepfeldolgozas;

-- tbl: pixelek
CREATE TABLE pixel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sor INT,
    oszlop INT,
    r INT,
    g INT,
    b INT
);

-- 3. feladat: Világos képpontok (ahol minden komponens > 200)
SELECT COUNT(*) AS vilagos_db
FROM pixel p
WHERE p.r > 200 AND p.g > 200 AND p.b > 200;

-- 4. feladat: Legsötétebb pontok (R+G+B összege minimális)
SELECT p.r, p.g, p.b
FROM pixel p
WHERE (p.r + p.g + p.b) = (
    SELECT MIN(p2.r + p2.g + p2.b)
    FROM pixel p2
);

-- 6. feladat: Felhő határai (példa logika SQL-ben)
-- random: referencia szinhez viszonyitva gyors becsles
SELECT MIN(p.sor) AS felso, MAX(p.sor) AS also
FROM pixel p
WHERE ABS(p.r - 180) > 10;
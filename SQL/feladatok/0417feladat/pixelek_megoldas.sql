CREATE DATABASE IF NOT EXISTS kepfeldolgozas DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE kepfeldolgozas;

CREATE TABLE pixel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sor INT,
    oszlop INT,
    r INT,
    g INT,
    b INT
);

-- 3. feladat: Világos képpontok (ahol minden komponens > 200)
SELECT COUNT(*) FROM pixel WHERE r > 200 AND g > 200 AND b > 200;

-- 4. feladat: Legsötétebb pontok (R+G+B összege minimális)
SELECT r, g, b FROM pixel 
WHERE (r + g + b) = (SELECT MIN(r + g + b) FROM pixel);

-- 6. feladat: Felhő határai (példa logika SQL-ben)
SELECT MIN(sor) AS felso, MAX(sor) AS also FROM pixel 
WHERE ABS(r - 180) > 10; -- Feltételezve egy referencia színt
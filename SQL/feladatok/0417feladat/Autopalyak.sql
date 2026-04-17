CREATE DATABASE IF NOT EXISTS autopalyak DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE autopalyak;

CREATE TABLE ut (
    id INT PRIMARY KEY,
    nev VARCHAR(10),
    tipus VARCHAR(20)
);

CREATE TABLE csomopont (
    id INT PRIMARY KEY,
    utid INT,
    nev VARCHAR(100),
    km INT,
    FOREIGN KEY (utid) REFERENCES ut(id)
);

-- Lekérdezések
-- M7-es autópálya csomópontjai km szerint
SELECT nev, km FROM csomopont 
WHERE utid = (SELECT id FROM ut WHERE nev = 'M7') 
ORDER BY km;

-- Adott távolságon belüli pihenők keresése (példa)
SELECT ut.nev, COUNT(csomopont.id) FROM ut 
JOIN csomopont ON ut.id = csomopont.utid 
GROUP BY ut.nev;
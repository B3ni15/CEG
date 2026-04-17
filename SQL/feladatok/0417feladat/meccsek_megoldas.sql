CREATE DATABASE IF NOT EXISTS focimeccs;
USE focimeccs;

CREATE TABLE meccs (
    id INT PRIMARY KEY,
    datum DATE,
    kezdes TIME,
    tipus VARCHAR(20),
    belepo INT
);

CREATE TABLE nezo (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    ferfi BOOLEAN,
    berletes BOOLEAN
);

CREATE TABLE belepes (
    meccsid INT,
    nezoid INT,
    idopont DATETIME,
    FOREIGN KEY (meccsid) REFERENCES meccs(id),
    FOREIGN KEY (nezoid) REFERENCES nezo(id)
);

-- 2bajnoki
SELECT datum FROM meccs WHERE tipus = 'bajnoki' ORDER BY datum;

-- 3utolso
SELECT belepo FROM meccs ORDER BY datum DESC, kezdes DESC LIMIT 1;

-- 4nezoszam
SELECT m.datum, COUNT(b.nezoid) AS nezoszam FROM meccs m 
LEFT JOIN belepes b ON m.id = b.meccsid GROUP BY m.id;

-- 5jegybevetel
SELECT SUM(m.belepo) FROM meccs m JOIN belepes b ON m.id = b.meccsid JOIN nezo n ON b.nezoid = n.id 
WHERE m.datum BETWEEN '2018-09-01' AND '2018-09-30' AND n.berletes = FALSE;

-- 6egyutt
SELECT m.datum FROM meccs m 
JOIN belepes b1 ON m.id = b1.meccsid JOIN nezo n1 ON b1.nezoid = n1.id 
JOIN belepes b2 ON m.id = b2.meccsid JOIN nezo n2 ON b2.nezoid = n2.id 
WHERE n1.nev = 'Kiss Dorina' AND n2.nev = 'Varga Zsolt';

-- 7jelentes
SELECT datum, kezdes, belepo FROM meccs WHERE tipus = 'bajnoki' ORDER BY datum;
CREATE DATABASE IF NOT EXISTS kektura DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE kektura;

-- tbl: turaszakaszok
CREATE TABLE szakasz (
    id INT PRIMARY KEY,
    honnan VARCHAR(100),
    hova VARCHAR(100),
    hossz DOUBLE,
    emelkedes INT,
    lejtes INT
);

-- tbl: belyegzohelyek
CREATE TABLE belyegzohely (
    id INT PRIMARY KEY,
    szakaszid INT,
    nev VARCHAR(100),
    tengerszint_feletti_magassag INT,
    FOREIGN KEY (szakaszid) REFERENCES szakasz(id)
);

-- Lekérdezések
-- Legmagasabban fekvő bélyegzőhelyek
SELECT b.nev, b.tengerszint_feletti_magassag
FROM belyegzohely b
ORDER BY b.tengerszint_feletti_magassag DESC
LIMIT 5;

-- Szakaszok összesített hossza
SELECT SUM(s.hossz) AS osszhossz
FROM szakasz s;

-- 100 méternél nagyobb emelkedésű szakaszok
-- random: ezek a combosabb emelkedos reszek
SELECT s.honnan, s.hova
FROM szakasz s
WHERE s.emelkedes > 100;
CREATE DATABASE IF NOT EXISTS kektura DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE kektura;

CREATE TABLE szakasz (
    id INT PRIMARY KEY,
    honnan VARCHAR(100),
    hova VARCHAR(100),
    hossz DOUBLE,
    emelkedes INT,
    lejtes INT
);

CREATE TABLE belyegzohely (
    id INT PRIMARY KEY,
    szakaszid INT,
    nev VARCHAR(100),
    tengerszint_feletti_magassag INT,
    FOREIGN KEY (szakaszid) REFERENCES szakasz(id)
);

-- Lekérdezések
-- Legmagasabban fekvő bélyegzőhelyek
SELECT nev, tengerszint_feletti_magassag FROM belyegzohely 
ORDER BY tengerszint_feletti_magassag DESC LIMIT 5;

-- Szakaszok összesített hossza
SELECT SUM(hossz) AS osszhossz FROM szakasz;

-- 100 méternél nagyobb emelkedésű szakaszok
SELECT honnan, hova FROM szakasz WHERE emelkedes > 100;
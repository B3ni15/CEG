-- 2026.04.15. SQL dolgozat (gyakorlat)

-- BALLÓ BENEDEK

-- 1. Milyen műfajok vannak? (1p)
SELECT genres.genre_name FROM `genres`;
-- 2. Mikor regisztrált utoljára tag a könyvtárban? (1p)
select max(members.name),register_date from members; 
-- 3. Átlagosan mennyibe kerülnek a könyvek? (1p)
select avg(books.fine) from books;
-- 4. Melyik a legolcsóbb könyv? (2p)
select min(books.fine) from books;
-- 5. Melyik könyvnek mi a műfaja? (2p)
SELECT books.title,genres.genre_name FROM `books` JOIN genres; 
-- 6. Milyen műfajokban írt könyvet Sarah Davis? (3p)
SELECT DISTINCT genres.genre_name from books join authors, genres WHERE authors.name = "Sarah Davis"; 
-- 7. Melyik ember hány könyvet vett ki? (3p)
SELECT members.name, COUNT(*) FROM `loans` JOIN members ON members.id = loans.member_id GROUP BY members.name; 
-- 8. Alice Johnson mekkora összeget fizetett ki bírságban (USD) (4p)?
SELECT name,SUM(books.fine) FROM `members` join books, loans WHERE name = "Alice Johnson" and loans.return_date is not null; 
-- 9. Adj hozzá új írót "Frank Herbert" néven, 11-es id-val. Adj hozzá új könyvet Dune néven, "Sciene fiction" műfajban amit "Frank Herbert" írt, 31-es id-val. (3p)
INSERT INTO `books`(`id`, `title`, `author_id`, `genre_id`, `fine`) VALUES ('31','Dune',(SELECT id from authors WHERE authors.name = "Frank Herbert"),(SELECT id from genres WHERE genres.genre_name = "Science Fiction"),'0')
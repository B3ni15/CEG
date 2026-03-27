-- 2. Készíts lekérdezéseket a következőknek:
-- 2a: Írd ki az összes felhasználó nevét.
select name from users;
-- 2b: Írd ki azokat felhasználókat akik 1989.december 31-e UTÁN születtek.
select name from users where dob > '1989-12-31';
-- 2c: Írd ki az összes termék nevét és árát (ár szerint növekvő sorrendben).
select name, price from items order by price asc;
-- 2d: Írd ki a 80.000 Ft feletti termékeket.
select name from items where price > 80000;
-- 2e: Melyik a legdrágább termék?
select name from items where price = (select max(price) from items);
-- 2f: Átlagosan mennyibe kerül egy termék?
select avg(price) from items;
-- 2g: Összesen mennyit érnek a termékek? (csak egy-egy darab)
select sum(price) from items;
-- 2h: Összesen mennyit érnek a termékek? (minden darab, ami raktáron van)
select sum(i.price * i.quantity) from items i;
-- 2i: Hány felhasználó van?
select count(*) from users;
-- 2j: Hány felhasználó van 70-es telefonszámmal(magyar országszámmal)?
select count(*) from users where phone like '+36 70%';
-- 2k: Írd ki a termékeket és a kategóriáikat.
select items.name, categories.name from items join categories on items.category = categories.id;
-- 2l: Írd ki tranzakciók felhasználóit és a vásárlás teljes összegét.
select users.name, transactions.fullPrice from transactions join users on users.id = transactions.userId;

-- 2m: Írd ki melyik volt az első tranzakció, és miket vettek. 
select transactionInfo.paymentDate, transactions.id as transactionId, items.name as itemName, transactionItems.quantity from transactions
join transactionInfo on transactionInfo.id = transactions.id
join transactionItems on transactionItems.transactionId = transactions.id
join items on items.id = transactionItems.itemId
where transactionInfo.paymentDate = (select min(paymentDate) from transactionInfo);

-- 2n: Írd ki a sikeres tranzakcióknál (isSuccesful értéke 1), ki volt a vásárló.
select distinct users.name from transactionInfo join transactions on transactions.id = transactionInfo.id join users on users.id = transactions.userId where transactionInfo.isSuccesful = 1;

-- 2o: Írd ki hány termék van egy kategóriában.
select categories.name, count(items.id) as termek_db from categories left join items on items.category = categories.id group by categories.id, categories.name;
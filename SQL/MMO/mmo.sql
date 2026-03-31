create database mmo;

CREATE TABLE IF NOT EXISTS players (
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    accountName VARCHAR(50) NOT NULL UNIQUE,
    registrationDate DATE NOT NULL CHECK (registrationDate >= '2000-01-01'),
    email VARCHAR(100) NOT NULL UNIQUE
);

create tables if not exists characters (
    id smallint unsigned primary key auto_increment,
    name varchar(50) not null unique,
    gold smallint unsigned not null,
    xp mediumint unsigned not null,
    player tinyint unsigned,
    foreign key (player) references players(id)
    constraint goldValid check (gold between 0 and 9999)
    constraint xpValid check (xp between 0 and 99999)
);

create tables if not exists items (
    id smallint unsigned primary key auto_increment,
    name varchar(100) not null unique,
    value tinyint unsigned not null,
    description varchar(256) not null,
    constraint valueValid check (value between 1 and 100)
);

create table if not exists enemies (
    id tinyint unsigned primary key auto_increment,
    name varchar(50) not null unique,
    xp smallint unsigned not null,
    constraint xpValid check (xp between 1 and 1000)
);

create table if not exists combat info (
    id smallint unsigned primary key auto_increment,
    character smallint unsigned,
    enemy tinyint unsigned,
    combatDate datetime not null,
    foreign key (character) references characters(id),
    foreign key (enemy) references enemies(id)
);

create table if not exists character_items (
    id smallint unsigned primary key auto_increment,
    character smallint unsigned,
    item smallint unsigned,
    combat mediumint unsigned,
    foreign key (character) references characters(id),
    foreign key (item) references items(id),
    foreign key (combat) references combat_info(id)
);

-- Átlagosan mennyibe kerül egy item?
select avg(value) from items;

-- Mennyibe kerül a legolcsóbb item?
select min(value) from items;

-- Melyik a legolcsóbb item?
select name from items where value = (select min(value) from items);

-- Hány item olcsóbb mint 50 gold?
select count(*) from items where value < 50;

-- Amik ólcsóbbak mint az átlag ár
select name from ite    ms where value < (select avg(value) from items);

-- Hányszor szerezték meg a "Salt - Sea" itemet?
select count(*) from character_items where item = (select id from items where name = 'Salt - Sea');

-- Melyik karakterek szerezték meg a "Salt - Sea" itemet?
select name from characters where id in (select character from character_items where item = (select id from items where name = 'Salt - Sea'));

-- melyik játékosnak hány karaktere van?
select accountName, count(*) as characterCount from players p join characters c on p.id = c.player group by p.id;

-- melyik ellenféllel hányszor küzdöttek meg?
select name, count(*) as combatCount from enemies e join combat_info ci on e.id = ci.enemy group by e.id;

-- melyik karakter hány item-et vett fel?
select name, count(*) as itemCount from characters c join character_items ci on c.id = ci.character group by c.id;

-- melyik item-et hányszor vették fel? 
select name, count(*) as pickupCount from items i join character_items ci on i.id = ci.item group by i.id;

-- Melyik játékos hány item-et fel összesen?
select accountName, count(*) as totalItems from players p join characters c on p.id = c.player join character_items ci on c.id = ci.character group by p.id;

-- 1. Melyik volt az első regisztrált felhasználó?
select accountName from players order by registrationDate limit 1;
-- 2. Melyik karakternek van a legtöbb xp-je?
select name from characters order by xp desc limit 1;
-- 3. Melyik ellenfél milyen item-et dobott?
select e.name as enemyName, i.name as itemName from enemies e join combat_info ci on e.id = ci.enemy join character_items ci2 on ci.id = ci2.combat join items i on ci2.item = i.id;
-- 4. Melyik karakter melyik szörnyet győzte le?
select c.name as characterName, e.name as enemyName from characters c join combat_info ci on c.id = ci.character join enemies e on ci.enemy = e.id;
-- 5. Melyik karakter mekkora összértékű tárgyat szedett össze?
select c.name, sum(i.value) as totalValue from characters c join character_items ci on c.id = ci.character join items i on ci.item = i.id group by c.id;
-- 6. Melyik játékos hányszor harcolt összesen?
select accountName, count(*) as combatCount from players p join characters c on p.id = c.player join combat_info ci on c.id = ci.character group by p.id;
-- 7. A ".com"-ra végződő e-mail című játékosoknak hány karaktere van összesen?
select count(*) from characters where player in (select id from players where email like '%.com');
-- 8. Melyik játékosnak van a legtöbb xp-je összesen (Ha több van akkor többet írja ki)?
select players.accountName, sum(characters.xp) as "összes xp" from players
    join characters on players.id = characters.player
    group by players.accountName
    having sum(characters.xp) = (
        select max(xpSum) 
        from (
            select sum(characters.xp) as xpSum 
            from players
            join characters on players.id = characters.player
            group by players.id
        ) as asd
    );
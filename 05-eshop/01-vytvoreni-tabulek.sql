-- vytvoreni databaze
CREATE DATABASE eshop COLLATE utf8_czech_ci;

-- tabulka produkt
CREATE TABLE produkt (
    id int unsigned primary key auto_increment,
    nazev text,
    cena double,
    dph double,
    popis text,
    skladem double,
    vyrobce_id int unsigned
);

-- vyrobce
CREATE TABLE vyrobce (
    id int unsigned primary key auto_increment,
    nazev text,
    telefon text,
    ic text
);

-- kategorie
CREATE TABLE kategorie(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nazev TEXT,
	parent_id INT UNSIGNED
);

-- kategorie produkt
CREATE Table product_kategorie (
	product_id int UNSIGNED,
	kategorie_id INT UNSIGNED,
	PRIMARY KEY (product_id, kategorie_id)
);

-- uzivatel

CREATE Table uzivatel (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	jmeno TEXT,
	prijmeni TEXT,
	email TEXT,
	telefon TEXT,
	login TEXT,
	heslo TEXT,
	adresa_ulice TEXT,
	adresa_mesto TEXT,
	adresa_psc TEXT
);

-- objednavka

CREATE Table objednavka (
	id int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	uzivatel_id int UNSIGNED,
	cas_objednani DATETIME
);

-- objednavka produkt
CREATE TABLE objednavka__produkt (
	objednavka_id int UNSIGNED,
	produkt_id int UNSIGNED,
	pocet DOUBLE,
	cena DOUBLE,
	dph DOUBLE,
	PRIMARY KEY (objednavka_id, produkt_id)
);
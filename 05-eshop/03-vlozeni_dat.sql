INSERT INTO kategorie(id, nazev, parent_id) VALUES 
	(1, "Potraviny", NULL),
	(2, "Sladkosti", 1),
	(3, "Alkohol", 1),
	(4, "Elektronika", NULL),
	(5, "TV", 4),
	(6, "Mobilni telefony", 4);

INSERT INTO vyrobce (id, nazev) VALUES
	(1, "Lindt"),
	(2, "Absolut"),
	(3, "Samsung"),
	(4, "Apple");

INSERT INTO produkt (id, nazev, cena, dph, skladem, vyrobce_id) VALUES
	(1, "Pralinky", 200, 15, 100, 1),
	(2, "Vodka", 400, 21, 50, 2),
	(3, "Televize", 19000, 21, 7, 3),
	(4, "Iphone", 22000, 21, 10, 4);

INSERT INTO produkt_kategorie (product_id, kategorie_id) VALUES
	(1, 2),
	(2, 3),
	(3, 5),
	(4, 6);

INSERT INTO uzivatel (id, jmeno, email) VALUES
	(1, "Franta", "franta@seznam.cz"),
	(2, "Jana", "jana@seznam.cz"),
	(3, "Pavel", "pavel@seznam.cz"),
	(4, "Martin", "martin@seznam.cz") ;

INSERT INTO objednavka (id, uzivatel_id, cas_objednani) VALUES
    (1, 1, "2021-07-30"),
    (2, 1, "2022-02-01"),
    (3, 2, "2022-03-01"),
    (4, 2, "2022-04-01"),
    (5, 2, "2022-05-01"),
    (6, 3, "2022-01-01");		

INSERT INTO objednavka__produkt (objednavka_id, produkt_id, pocet, cena, dph) VALUES
	    (1, 1, 2, 200, 15),
    (1, 2, 1, 400, 21),
    (2, 1, 3, 200, 15),
    (3, 2, 1, 400, 21),
    (4, 2, 1, 400, 21),
    (5, 2, 1, 400, 21),
    (6, 4, 1, 22000, 21);
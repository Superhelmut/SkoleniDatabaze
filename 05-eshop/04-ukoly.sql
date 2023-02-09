-- vypsání produktu + ceny

SELECT nazev, cena FROM produkt;

-- vypsání produktu s cenou bez dph
SELECT nazev, cena/(1+dph/100) FROM produkt;

-- vypsání hodnot skladu

SELECT nazev, sum(cena*skladem) FROM produkt;

-- zjištění nejražšího produktu

SELECT nazev, cena FROM produkt ORDER BY cena DESC LIMIT 1;

-- vypsání nejlevnější a nejdražší položky
(SELECT nazev, cena FROM produkt ORDER BY cena LIMIT 1)
UNION
(SELECT nazev, cena FROM produkt ORDER BY cena DESC LIMIT 1)
;

-- vypsání kořenových kategorií
SELECT nazev FROM kategorie WHERE parent_id is NULL;

-- vypsani produktu vcetne vyrobce
SELECT produkt.nazev, vyrobce.nazev from produkt JOIN vyrobce on vyrobce_id = vyrobce.id;

-- vypsani objednavek uzivatele jana
SELECT objednavka.cas_objednani, uzivatel.jmeno FROM objednavka JOIN uzivatel on uzivatel_id = uzivatel.id WHERE uzivatel.jmeno = "jana"; 

-- vypsani objednavek uzivatele jana@seznam.cz
SELECT objednavka.cas_objednani, uzivatel.jmeno FROM objednavka JOIN uzivatel on uzivatel_id = uzivatel.id WHERE uzivatel.email = "jana@seznam.cz"; 

--uzivatel, ktery nic nekupil
SELECT objednavka.cas_objednani, uzivatel.jmeno FROM objednavka RIGHT JOIN uzivatel on uzivatel_id = uzivatel.id WHERE cas_objednani is NULL; 

-- produkty, ktere nebyy nikdy objednany
SELECT objednavka__produkt.pocet, produkt.nazev FROM objednavka__produkt RIGHT JOIN produkt on produkt_id = produkt.id WHERE pocet is NULL; 

-- vypsani produktu apple
SELECT vyrobce.nazev, produkt.nazev FROM produkt JOIN vyrobce on vyrobce_id = vyrobce.id WHERE vyrobce.nazev = "Apple";

-- kdy byly objednane pralinky
SELECT objednavka.cas_objednani FROM objednavka
JOIN objednavka__produkt ON objednavka__produkt.objednavka_id = objednavka.id
JOIN produkt ON produkt.id = objednavka__produkt.produkt_id WHERE produkt.nazev = "pralinky";

-- vypsani vyrobce televizoru

SELECT vyrobce.nazev FROM vyrobce
JOIN produkt ON produkt.vyrobce_id = vyrobce.id
JOIN produkt_kategorie ON produkt_kategorie.produkt_id = produkt.id
JOIN kategorie ON kategorie.id = produkt_kategorie.kategorie_id
WHERE kategorie.nazev = "TV";

-- kolik kusu produktu byylo prodano
SELECT objednavka__produkt.pocet, produkt.nazev from objednavka__produkt
JOIN produkt ON produkt_id = produkt.id
JOIN objednavka ON objednavka_id = objednavka.id;  

--kolik uzivatel celkem utratil
SELECT uzivatel.jmeno, sum(objednavka__produkt.cena) FROM objednavka__produkt
RIGHT JOIN objednavka ON objednavka_id = objednavka.id
RIGHT JOIN uzivatel ON uzivatel_id = uzivatel.id
GROUP BY uzivatel.jmeno ;

-- kolik byo objednavek v roce 21 a kolik v roce 22
SELECT year(cas_objednani), COUNT(*) FROM objednavka
GROUP BY year(cas_objednani) ;
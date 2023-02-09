SELECT model.nazev, vyrobce.nazev FROM model JOIN vyrobce ON model.vyrobce_id = vyrobce.id;

-- vypisani vsech vyrobcu i kdyz nemaji u sebe zadny model
-- v tom pripade je potreba pouzit LEFT JOIN, tak abych ve vypisu byly
-- vsechny zaznamy "vlevo" (od klauzule JOIN)
SELECT vyrobce.nazev, model.nazev FROM vyrobce LEFT JOIN model ON model.vyrobce_id = vyrobce.id;


-- to same, ale pomoci RIGHT JOIN, s tim ze chceme vypsat vsechny radky
-- "vpravo" tedy radky z vyrobce
SELECT vyrobce.nazev, model.nazev FROM model RIGHT JOIN vyrobce ON model.vyrobce_id = vyrobce.id;


-- vypsani vyrobcu, kteri nemaji definovany zadny model
SELECT vyrobce.nazev FROM vyrobce LEFT JOIN model ON model.vyrobce_id = vyrobce.id WHERE model.id IS NULL;

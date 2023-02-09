-- zahajeni transakce
START TRANSACTION;

-- zmena ceny inzeratu v databazi autobazar
UPDATE inzerat SET cena = 10000 WHERE id = 3;
-- smazeme inzerat s id 2
DELETE FROM inzerat WHERE id = 2;


SELECT * FROM inzerat;


-- zruseni transakce - vraceni stavu na zacatek
ROLLBACK;

-- potvrzeni transakce - finalni zapsani do databaze
COMMIT;

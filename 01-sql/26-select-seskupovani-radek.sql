SELECT mena_nazev, COUNT(*) as pocet_mena FROM zeme_mena GROUP BY mena_nazev ORDER BY pocet_mena;

SELECT mena_nazev, COUNT(*) as pocet_mena FROM zeme_mena GROUP BY mena_nazev ORDER BY pocet_mena DESC LIMIT 10;

SELECT mena_nazev, count(*) AS pocet FROM zeme_mena GROUP BY mena_nazev HAVING pocet > 1 ORDER BY pocet DESC LIMIT 10;

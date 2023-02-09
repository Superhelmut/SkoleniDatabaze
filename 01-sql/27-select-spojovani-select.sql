-- stat v abecede na zacatku
SELECT stat FROM zeme_mena ORDER BY stat ASC LIMIT 1;

-- stat v abecede na konci
SELECT stat FROM zeme_mena ORDER BY stat DESC LIMIT 1;


-- vytahnout prvni a posledni stat v abecede
(SELECT stat FROM zeme_mena ORDER BY stat ASC LIMIT 1) UNION (SELECT stat FROM zeme_mena ORDER BY stat DESC LIMIT 1);

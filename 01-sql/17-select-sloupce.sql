-- vypsani seznamu men a jejich kodu
SELECT mena_nazev, mena_kod FROM zeme_mena;

-- vypsani zaokrouhlene teploty
SELECT cas, round(teplota, 1) as zaokrouhlena_teplota FROM teploty LIMIT 3; 

-- vypsani nejnizsi teploty
SELECT MIN(teplota) FROM teploty;

SELECT max(teplota) FROM teploty;

SELECT AVG(teplota) FROM teploty;

-- vypsani poctu radek

SELECT COUNT(*) FROM teploty;

-- vypsani seznamu zemi serazeny podle nazvu meny sestupne
-- a pokud maji staty stejnou menu, tak se seradi podle nazvu
-- statu take sestupne

SELECT * FROM zeme_mena ORDER BY mena_nazev DESC, stat DESC;

-- vypsani 3 nejnizsich teplot za celou dobu
SELECT * FROM teploty ORDER BY teplota LIMIT 3;
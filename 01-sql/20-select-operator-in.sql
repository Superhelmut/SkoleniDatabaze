21-select-filtr-operator-in.sql
234561
-- klasicky zapis pomoci spojovani podminek
SELECT stat, mena_nazev FROM zeme_mena WHERE stat = "Itálie" OR stat = "Bulharsko" OR stat = "Chorvatsko";

-- zapis pomoci operatoru IN
SELECT stat, mena_nazev FROM zeme_mena WHERE stat IN ("Itálie", "Bulharsko", "Chorvatsko");


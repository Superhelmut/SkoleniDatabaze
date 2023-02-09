-- vsechny meny, ktere konci slovem libra

SELECT mena_nazev FROM zeme_mena WHERE mena_nazev LIKE "%libra";

-- vsechny meny, ktere zacinaji slovem libra
SELECT mena_nazev FROM zeme_mena WHERE mena_nazev LIKE "libra%";

-- vsechny meny, ktere obsahuji slovo libra
SELECT mena_nazev FROM zeme_mena WHERE mena_nazev LIKE "%libra%";

-- vypsani men, ktere jsou unikatni (skupina je NULL)
SELECT mena_nazev FROM zeme_mena WHERE mena_skupina IS NULL;

-- vypsani men, ktere maji nejakou odvozenou menu (skupina neni NULL)
SELECT mena_nazev FROM zeme_mena WHERE mena_skupina IS NOT NULL;

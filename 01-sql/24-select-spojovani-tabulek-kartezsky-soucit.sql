-- kartezsky soucin - kombinace kazdeho s kazdym
-- kombinace vsech radek z modelu s vsema radkama z vyrobce
SELECT model.nazev, vyrobce.nazev FROM model, vyrobce WHERE vyrobce_id = vyrobce.id;

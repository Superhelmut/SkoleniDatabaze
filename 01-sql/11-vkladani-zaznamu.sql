--vlozeni jednoho radku citelnejsi syntaxi

INSERT INTO model set nazev = "Fabia", vyrobce_id = 1;
INSERT INTO model set nazev = "Superb", vyrobce_id = 1;
INSERT INTO model set nazev = "105", vyrobce_id = 1;

-- vlzeni vice radku najednou mene citelnejsi syntaxi

INSERT INTO model (nazev, vyrobce_id) VALUES 
("120", 1),
("CityGo", 1),
("Enyag", 1);
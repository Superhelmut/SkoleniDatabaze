ALTER TABLE produkt ADD FOREIGN KEY (vyrobce_id) REFERENCES vyrobce(id);

ALTER TABLE kategorie ADD FOREIGN KEY (parent_id) REFERENCES kategorie(id);

ALTER TABLE produkt_kategorie ADD FOREIGN KEY (product_id) REFERENCES produkt(id);
ALTER TABLE produkt_kategorie ADD FOREIGN KEY (kategorie_id) REFERENCES kategorie(id);

ALTER TABLE objednavka ADD FOREIGN KEY (uzivatel_id) REFERENCES uzivatel(id);


ALTER TABLE objednavka__produkt ADD FOREIGN KEY (objednavka_id) REFERENCES objednavka(id);

ALTER TABLE objednavka__produkt ADD FOREIGN KEY (produkt_id) REFERENCES produkt(id);


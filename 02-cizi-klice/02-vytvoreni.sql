-- vratime data do platneho stavu
UPDATE model SET vyrobce_id = 1 WHERE id = 1;

ALTER TABLE model ADD FOREIGN KEY (vyrobce_id) REFERENCES vyrobce(id);

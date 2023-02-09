-- vratime data do platneho stavu
UPDATE model SET vyrobce_id = 1 WHERE id = 1;

-- pridani ciziho klice
ALTER TABLE model ADD FOREIGN KEY (vyrobce_id) REFERENCES vyrobce(id);
-- cizi klic v rezimu mazani navzanych zaznamu
ALTER TABLE model ADD FOREIGN KEY (vyrobce_id) REFERENCES vyrobce(id) ON DELETE CASCADE;

-- zkusebni odstraneni vyrobce Kia
DELETE FROM vyrobce WHERE nazev = "Kia";

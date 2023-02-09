-- zjisteni seznamu a nazvu indexu pomoci SHOW CREATE TABLE
SHOW CREATE TABLE teploty;

-- odstraneni indexu se jmenem cas
ALTER TABLE teploty DROP INDEX cas;

ALTER TABLE IrisMeasures ADD Average FLOAT DEFAULT 0;
ALTER TABLE IrisMeasures ADD Median FLOAT DEFAULT 0;

DELIMITER $
CREATE TRIGGER Average_Median BEFORE INSERT ON IrisMeasures
FOR EACH ROW
BEGIN
	DECLARE Cat FLOAT;
    SET Cat = (SELECT Categoria FROM SpeciesCategory WHERE NEW.Species = Species LIMIT 1);
	SET NEW.Average = (NEW.SepalLengthCm+NEW.SepalWidthCm+NEW.PetalLengthCm+Cat)/4; 
   	SET NEW.Median = (NEW.SepalLengthCm+NEW.SepalWidthCm)/2;
END$
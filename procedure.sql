CREATE PROCEDURE `InsertNewElement`(SL FLOAT,SW FLOAT,PL FLOAT,PW FLOAT,Spci VARCHAR(50))
BEGIN
	DECLARE SpeciesIdentify VARCHAR(50);
    DECLARE CategoriaIdentify INT;
    DECLARE MaxCategory INT;
    
    SET SpeciesIdentify := (SELECT Species FROM IrisMeasures WHERE Species = Spci LIMIT 1);
    SET MaxCategory := (SELECT MAX(Categoria) FROM SpeciesCategory);
    SET CategoriaIdentify := (SELECT Categoria FROM SpeciesCategory WHERE Species = Spci LIMIT 1);
    
    IF (SpeciesIdentify IS NOT NULL) THEN
		INSERT INTO SpeciesCategory
		(Species,Categoria)
		VALUES
			(Spci,CategoriaIdentify);
        INSERT INTO IrisMeasures
		(SepalLengthCm,SepalWidthCm,PetalLengthCm,PetalWidthCm,Species)
		VALUES
			(SL,SW,PL,PW,Spci);
	ELSE
		INSERT INTO SpeciesCategory
		(Species,Categoria)
		VALUES
			(Spci,MaxCategory+10);
		INSERT INTO IrisMeasures
		(SepalLengthCm,SepalWidthCm,PetalLengthCm,PetalWidthCm,Species)
		VALUES
			(SL,SW,PL,PW,Spci);
    END IF;
    
END
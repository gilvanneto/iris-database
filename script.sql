# TABELAS APÓS CRIAÇÃO

SELECT * FROM IrisMeasures;
SELECT * FROM SpeciesCategory;

# FUNCIONAMENTO DA VIEW COM MÉDIA DAS COLUNAS

SELECT * FROM Averages;

# SEM PROCEDURE 

INSERT INTO IrisMeasures
  (SepalLengthCm,SepalWidthCm,PetalLengthCm,PetalWidthCm,Species)
  
VALUES
  (5.0,5.0,5.0,5.0,'Iris-new');
  
SELECT * FROM IrisMeasures;
SELECT * FROM SpeciesCategory;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM IrisMeasures WHERE SepalLengthCm = 5 AND SepalWidthCm = 5 AND PetalLengthCm = 5 AND PetalWidthCm = 5;
SET SQL_SAFE_UPDATES = 1;

# COM PROCEDURE E SEM TRIGGER

call InsertNewElement(5.0,3.0,1.0,0.0,'Iris-virginica');
call InsertNewElement(5.0,3.0,1.0,0.0,'Iris-nova');

SELECT * FROM IrisMeasures;
SELECT * FROM SpeciesCategory;


# APÓS - TRIGGER

call InsertNewElement(5.0,3.0,1.0,0.0,'Iris-nova');

SELECT * FROM IrisMeasures;
SELECT * FROM SpeciesCategory;







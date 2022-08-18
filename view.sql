CREATE VIEW Averages AS
	SELECT
		measures.Species as Species,
		AVG(measures.SepalLengthCm), 
		AVG(measures.SepalWidthCm), 
		AVG(measures.PetalLengthCm), 
		AVG(sc.Categoria)
	FROM IrisMeasures as measures
    LEFT JOIN SpeciesCategory as sc
		on measures.Species = sc.Species
	GROUP BY Species;
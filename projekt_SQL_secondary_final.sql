
-- evropské státy a ich populace, GDP a gini koeficient v letech 2006 - 2018 --  

SELECT 
 	country,
	`year` ,
	GDP,
	gini,
	population
FROM economies
WHERE `year` BETWEEN 2006 AND 2018 
AND  country  IN 
		(SELECT 
 		country
 		FROM countries
		WHERE continent LIKE 'Europe')
ORDER BY country, `year` ;
		
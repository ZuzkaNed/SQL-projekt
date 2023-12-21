-- 3.Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? --


CREATE TABLE t_average_price_each_price_category AS 
	(SELECT 
		YEAR(cp.date_from) AS reference_period,
		cpc.code,
		cpc.name,
		round(avg(cp.value),2) AS average_price,
		cpc.price_value,
		cpc.price_unit		
	FROM czechia_price cp
	JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code
	GROUP BY cpc.name, YEAR(cp.date_from)
	);


 -- meziroční nárust/pokles jednotlivých potravin od roku 2006 do roku 2018

SELECT 
	ap1.name,
	ap1.reference_period,
	ap1.average_price,
	ap1.reference_period  + 1 AS following_year,
	ap2.average_price,
	ap1.price_value,
	ap1.price_unit,
	round((ap2.average_price-ap1.average_price)/ap1.average_price * 100,2) AS annual_growth_percentage
FROM t_average_price_each_price_category ap1
	JOIN t_average_price_each_price_category ap2
	ON ap1.reference_period  + 1  = ap2.reference_period  AND ap1.code = ap2.code;
	

SELECT 
	ap1.name,
	sum(round((ap2.average_price-ap1.average_price)/ap1.average_price * 100,2)) AS growth_percentage_per_product
FROM t_average_price_each_price_category ap1
JOIN t_average_price_each_price_category ap2
	ON ap1.reference_period  + 1  = ap2.reference_period  AND ap1.code = ap2.code
GROUP BY ap1.code
ORDER BY growth_percentage_per_product;



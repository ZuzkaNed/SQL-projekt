 -- 4.Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %) --
 
-- vývoj mezd (přepočtené na plný úvazek) --
 
 CREATE TABLE t_average_payroll_per_year AS 
	(SELECT      
		payroll_year,
		round(avg(value),0) AS average_payroll_per_year
	FROM czechia_payroll
	WHERE value_type_code = 5958 AND calculation_code = 200
	group BY payroll_year
);
 
 -- meziroční nárust/pokles mezd od roku 2000 - 2020 --

CREATE TABLE annual_growth_payroll AS 
	(SELECT 
		ap.payroll_year,
		ap.average_payroll_per_year AS average_payroll_per_year,
		ap.payroll_year + 1 AS following_year,
		ap2.average_payroll_per_year AS average_payroll_per_following_year ,
		round((ap2.average_payroll_per_year - ap.average_payroll_per_year)/ap.average_payroll_per_year * 100 ,2) AS annual_growth_percentage
	FROM t_average_payroll_per_year ap
 	JOIN t_average_payroll_per_year ap2
	ON ap.payroll_year + 1 = ap2.payroll_year 
	GROUP BY ap.payroll_year 
);

-- průmerna cena potravin za jednotlivé roky -- 

CREATE TABLE t_average_price_food_per_year AS 
	(SELECT 
		`year` ,
		round(avg(average_price),2) AS average_price_per_year_food
	FROM t_average_price_of_each_price_category
	GROUP BY `year` )
;

-- nárust/pokles cen potravin (vetky potraviny dohromady) od roku 2006 - 2018--

CREATE TABLE annual_growth_foodprice AS 
	(SELECT 
		tf1.`year` ,
		tf1.average_price_per_year_food,
		tf1.`year` + 1 AS following_year,
		tf2.average_price_per_year_food AS average_price_per_following_year_food,
		round ((tf2.average_price_per_year_food - tf1.average_price_per_year_food)/tf1.average_price_per_year_food * 100 ,2 ) AS annual_growth_food
	FROM t_average_price_food_per_year tf1
	JOIN t_average_price_food_per_year tf2
		ON tf1.`year` +1 = tf2.`year` 
);

-- porovnání meziročního růstu cen potravin a mezd --

SELECT 
	agf.following_year,
	agf.annual_growth_food,
	agp.annual_growth_percentage AS annual_growth_payroll
FROM annual_growth_foodprice agf
JOIN annual_growth_payroll agp
ON agf.following_year = agp.following_year ;






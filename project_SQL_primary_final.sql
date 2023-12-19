
-- porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období --


-- vytvoření dočasní tabulky -- průměrné mzdy za odvětví -- 

CREATE TABLE t_average_payroll_per_industry AS 
	(SELECT 
    	cp.payroll_year AS reference_period,
		cpib.name,
		round(avg(value),0) AS average_payroll_per_year
	FROM czechia_payroll cp
		JOIN czechia_payroll_industry_branch cpib 
		ON cp.industry_branch_code = cpib.code 
	WHERE value_type_code = 5958 AND calculation_code = 200
	GROUP BY  cp.industry_branch_code, cp.payroll_year )
;


-- vytvoření dočasní tabulky -- průměrné ceny za jednotlivé produkty

CREATE TABLE t_average_price_food_category AS 
	(SELECT 
		year(date_from) AS reference_period,
		cpc.name,
		round(avg(value),2) AS average_price,
		cpc.price_value AS price_value,
		cpc.price_unit AS price_unit
	FROM czechia_price cp
	JOIN czechia_price_category cpc
	ON cp.category_code = cpc.code
	GROUP BY cpc.name, reference_period)
;
	
-- data mezd a cen potravin v České republice za porovnatelné období (2006 -2018) --

CREATE TABLE t_zuzana_nedvedova_project_SQL_primary_final AS 
	(SELECT 
		payroll.reference_period,
		payroll.name AS industry_name,
		payroll.average_payroll_per_year,
		food.name AS product_name,
		food.average_price,
		food.price_value,
		food.price_unit,
		round(payroll.average_payroll_per_year/food.average_price,2) AS availability_of_product
	FROM t_average_price_food_category food		
	JOIN t_average_payroll_per_industry payroll
	ON food.reference_period = payroll.reference_period) 
;
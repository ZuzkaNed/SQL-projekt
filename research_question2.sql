-- 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? --

-- první srovnatelné období - 2016 --
-- poslední srovnatelné období - 2018 --


CREATE TABLE t_average_price_milk_bread_2006_2018
	(SELECT 	
  	 	YEAR(cp.date_from) AS reference_period,
		cp.category_code,
		cpc.name,
		round(avg(value),2) AS average_price_in_czk,
		cpc.price_value,
		cpc.price_unit	
	FROM czechia_price cp
	JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code
	WHERE cp.category_code IN (111301,114201) AND YEAR(cp.date_from) IN (2006,2018) 
	GROUP BY reference_period, cp.category_code 
	ORDER BY reference_period)
;


CREATE TABLE average_payroll_2006_2018 AS 
	(SELECT 
		payroll_year,
		round(avg(value),0) AS average_payroll_per_year
	FROM czechia_payroll
	WHERE value_type_code = 5958 AND calculation_code = 200 AND payroll_year IN (2006,2018)
	GROUP BY payroll_year) 
; 

CREATE TABLE availability_of_milk_and_bread AS 
	(SELECT 	
		apmb.reference_period,
		ap.average_payroll_per_year,
		apmb.category_code,
		apmb.name AS prodcut_name,
		apmb.average_price_in_czk,
		apmb.price_value,	
		apmb.price_unit,
		round(ap.average_payroll_per_year / apmb.average_price_in_czk,0) AS availability_of_milk_and_bread
	FROM average_payroll_2006_2018 ap
	JOIN t_average_price_milk_bread_2006_2018 apmb
	ON ap.payroll_year = apmb.reference_period
	ORDER BY apmb.name, apmb.reference_period)
;




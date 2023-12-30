-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? --

-- průměrná mzda (přepočtená na plný úvazek) za každé odvětví od roku 2000 do 2021 --

CREATE TABLE t_average_payroll_industry AS 
	(SELECT 
		payroll_year AS reference_period,
		cp.industry_branch_code,
		ib.name AS industry_name,
		round(avg(value),0) AS average_payroll_in_czk	
	FROM czechia_payroll cp
	JOIN czechia_payroll_industry_branch ib
	ON cp.industry_branch_code = ib.code 
	WHERE value_type_code = 5958 AND calculation_code = 200
	GROUP BY industry_branch_code, payroll_year)
;  


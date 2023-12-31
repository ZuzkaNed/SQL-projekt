# SQL-project for Engeto Data Academy

# Project Structure
 - main data in primary and secondary tables (files: project_SQL_primary_final.sql, project_SQL_secondary_final.sql)
 - data for research questions (files: research_question1.sql, research_question2.sql, research_question3.sql, research_question4.sql, research_question5.sql)

# Assingment
 Main goal of the project was to compare the availability of basic food products based on average incomes in Czech Republic over a period of time. Further, another data of GDP, GINI coefficient and population of another european countries were needed. In addition, there were 5 research questions, that needed to be answered. (see below)

# Data description
 - primary table shows incomes in the industries in Czech Republic through the years - 2006 - 2018 together with food prices in the same period, last column shows what amount of the product people from different indstries could afford during this reference period
 - secondary table shows european countries and their GDP, GINI coefficient and popuplation in the same reference period (2006 - 2018), however the table is not complete as siginificant amount of values (GDP and GINI coefficient) are null values

# Work progress 
 The analysis is focused mainly on the development of prices and incomes in the reference period (data available from 2006 to 2018) in Czech Republic. Requested data were filtered from database accordingly. Furthermore, "The year-over-year growth" formula was used in the analysis to find out growth or decrease of food prices, incomes and GDP in Czech republic. This formila shows the percentage change in an annualized metric over two comparable periods.  
# Research Questions and Answers
## Research Question 1
 - Are average wages increasing in all industries over the years? Or are there industries in Czech Republic where 
average wages are decreasing? 
	- according to the data obtained, in all industries there was a growing trend in incomes. 
## Research Question 2
 - How many liters of milk and kilograms of bread can be bought in the first and last comparable periods based on available data of prices and incomes? 
	- data availble in research_question2.sql file
## Research Question 3
 - Which food category has the lowest percentage year-on-year increase in price? 
	- white wine
## Research Question 4
 - Is there a year in which the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)? 
	- in the reference periods there was no year where year-on-year increase in food prices was significantly higher (greater than 10%)  than wage growth
## Research Question 5
 - Does the level of GDP in Czech Republic affect changes in incomes and food prices in the same or follwoing year?
	- I have assigned the growth in GDP that was greater than 10 000 000 000 as high increase. The highest growth in food prices we can see in 2017 and in payroll in 2007. However there was also a drop in food prices in 2015 and a small growth in incomes in the same year so according to the obtained data we are not able to find out if high GPD affects the food prices and incomes in same or following year. 

# Conclusion 
 


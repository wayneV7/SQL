
-- Date functions


select EOMONTH('02/01/2019') --end of month of February

select DATEADD ( DD , 1, EOMONTH('01/01/2019')) --FIRST of month of February

select DATENAME(MONTH,DATEADD ( DD , 1, EOMONTH('01/01/2019'))) --  NAME OF MONTH

select DATENAME(WEEKDAY,DATEADD ( DD , 1, EOMONTH('01/01/2019'))) --  WEEK DAY NAME

select DATENAME(DAYOFYEAR,DATEADD ( DD , 1, EOMONTH('01/01/2019'))) --  DAY OF YEAR

SELECT DATEPART(MM,('01/01/2019'))    --- MONTH DATE PART

SELECT DATEPART(DD,('01/01/2019'))    --- DAY DATE PART

SELECT DATEPART(YY,('01/01/2019'))    --- YEAR DATE PART

SELECT DATEDIFF(DD ,'01/01/2019',GETDATE())   -- DAYS PASD FROM 01/01/2019




--AGE Calculation  date diference is devided by 365.24 to calculate the yeard passed from start date to end date

SELECT DATEDIFF(DD ,'09/07/1990','09/07/2019') / 365.24

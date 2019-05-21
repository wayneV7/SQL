--Creating Random Number Plates (3 Letters , 3 numbers)

SELECT
		 CHAR(CAST(rand()*25.01 AS INT )+65) + CHAR(CAST(rand()*25.01 AS INT )+65) +
		 CHAR(CAST(rand()*25.01 AS INT )+65) + 
		 CAST (CAST (RAND()*10 AS INT)AS CHAR(1)) + CAST (CAST (RAND()*10 AS INT)AS CHAR(1)) +
	     CAST (CAST (RAND()*10 AS INT)AS CHAR(1)) 
		 AS [Number Plate]






--Understanding HOW

--STEP 1 Understanding CHAR() 

SELECT  CHAR(65) ,CHAR(90)  --CHAR(65) to CHAR(90) Returns a characher from A to Z 






--STEP 2 Understanding RAW() 

SELECT RAND()  --RAND GENERATES FROM 0.000.... TO 0.99999

SELECT RAND()*25.01 + 65  -- This will return from 65.00000 to 90.0099  

SELECT CHAR(RAND()*25.01 + 65)  -- This will return from A to Z

SELECT CHAR(CAST(RAND()*25.01 AS int) + 65)  -- Convert sum to an INTEGER for less calculations





--TESTING IF IT RETURNS A to Z  (try catch was not made to have a shorter script)

DECLARE @Letter CHAR(1) = ''

WHILE  @Letter <> 'Z'           --CHANGE LETTER 
BEGIN
	   SET @Letter = CHAR(CAST(RAND()*25.01 AS INT) + 65)
END

SELECT @Letter



--step 3 Generate 0 - 1

select RAND()   --RAND GENERATES FROM 0.000.... TO 0.99999

select RAND()*10   --RAND GENERATES FROM 0.000.... TO 9.99999

select CAST(RAND()*10 AS INT)  --RAND GENERATES FROM 0 TO 9



--TESTING IF IT RETURNS 0 to 9 (try catch was not made to have a shorter script)

DECLARE @NUMBER INT = 0      
WHILE  @NUMBER <> 10        --CHANGE NUMBER
BEGIN
	   SET @NUMBER = (SELECT CAST(RAND()*10 AS INT))
END
SELECT @NUMBER


----- Having the following creating random letter and number we just need to make a select statement

SELECT CHAR(CAST(RAND()*25.01 AS INT) + 65)  
SELECT CAST(RAND()*10 AS INT)


---

SELECT
		 CHAR(CAST(RAND()*25.01 AS INT )+65) + CHAR(CAST(RAND()*25.01 AS INT )+65) +
		 CHAR(CAST(RAND()*25.01 AS INT )+65) + 
		 CAST (CAST (RAND()*10 AS INT)AS CHAR(1)) + CAST (CAST (RAND()*10 AS INT)AS CHAR(1)) +
	     CAST (CAST (RAND()*10 AS INT)AS CHAR(1)) 
		 AS [Number Plate]


---THE END
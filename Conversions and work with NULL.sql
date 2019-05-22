--Conversion

--Convert ,Cast and parse Retunrs error message when error is occured 
SELECT CONVERT(INT,'HELLO') AS Error ;  
SELECT cast('HELLO' AS int) AS Error ; 
SELECT Parse('HELLO'AS datetime2 USING 'eu-US') AS Error ; 

--PARSE converts strings to date,time and number types and sets sets culture 
SELECT Parse('12/02/19'as datetime2 USING 'eu-US') AS NoError ; -- YEAR 2012
SELECT Parse('12/02/19'as datetime2 USING 'es-ES') AS NoError ; ---YEAR 2019
SELECT Parse('2012/02/19'as datetime2 USING 'es-ES') AS NoError ; ---YEAR 2019
SELECT Parse('1'AS INT ) AS NoError ; -- TO INT


--TRY_CONVERT ,TRY_PARSE Retunrs NULL when error is occured 
SELECT TRY_CONVERT(INT,'HELLO') AS Error ;
SELECT TRY_Parse('HELLO'AS datetime2 USING 'eu-US') AS NoError ; 


--IIF Accepts three parameters, true or false/unknown returns values

SELECT IIF ( 1 = 1, 'It is correct','It is not correct')
SELECT IIF ( 1= 2, 'It is correct','It is not correct')



--CHOOSE Returns a value of an item at a specified index in a lost

SELECT CHOOSE(4,'a','b','c','d')
SELECT CHOOSE(4,1,2,3,4)






--ISNUMERIC - test weather an input expression is a valid numeric type

select ISNUMERIC(10) --RETURNS 1
select ISNUMERIC('HELLO') --RETURNS 0



--ISNULL - Replaces NULL with specified value

select ISNULL(10,'ISNULL') --RETURNS 10

DECLARE @NULL VARCHAR(10)  = NULL;
select ISNULL(@NULL,'ISNULL'); --RETURNS ISNULL



--COALESCE used to return Non-NULL Values according to next in line

DECLARE @NULL1 VARCHAR(10) = NULL
DECLARE @NULL2 VARCHAR(10) = 'HELLO'
DECLARE @NULL3 VARCHAR(10) = 'GOODBYE'
select COALESCE(@NULL1,@NULL2,@NULL3) --RETURNS HELLO

--Having all NULL
DECLARE @NULL4 VARCHAR(10) = NULL
DECLARE @NULL5 VARCHAR(10) = NULL
select COALESCE(@NULL4,@NULL5) --RETURNS NULL


--NULLIF Returns Null if Value match or first value

select NULLIF(GETDATE(),GETDATE()) --NULL

select  NULLIF(CAST(GETDATE() AS DATE),'12/12/03') -- Today`s Date





















SELECT CAST('ABC' AS VARCHAR(20)) AS NoError 
,  CAST( @@ERROR AS VARCHAR(20) ) AS [@@ERROR]
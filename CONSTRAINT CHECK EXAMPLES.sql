--CONSTRAINT CHECK EXAMPLE

--Can enter Letters only

CREATE TABLE #TABLE
(  ID INT IDENTITY(1,1),
   LetterOnly varchar(10),
  CHECK (LetterOnly NOT LIKE '%[^A-Z]%')
)


--Accepts only inserts with 3letters and 3numbers

create table #test
( NumberPlate varchar(5))

ALTER TABLE #test ADD CONSTRAINT
constraint_name CHECK (NumberPlate LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

insert into #test
values('AAA333')


--QUERYING

--WRONG
SELECT * FROM #test
WHERE NumberPlate  = 3333 


SELECT * FROM #test
WHERE NumberPlate  = CAST(33333 AS varchar(5))


--WRONG
SELECT * FROM #test
WHERE CAST(NumberPlate AS INT) = 3333

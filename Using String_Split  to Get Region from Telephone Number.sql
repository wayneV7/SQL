--Getting telephone Region


----Create sample table with telephones
CREATE TABLE #telephoneNumbers( telephone VARCHAR(20))

INSERT INTO #telephoneNumbers 
VALUES ('123-97970009'),('123-I7558'),('123-9706878'),('123-9846758'),
       ('343-97970009'),('343-I7558'),('343-9706878'),('343-9846758')




--------Returns Region
SELECT telephone ,  split.value AS Region
FROM #telephoneNumbers
cross apply
(SELECT top 1 value FROM string_split(telephone,'-')) AS split


--UNDERSTANDING HOW



--STEP 1  SELECT the value FROM the function string split having 123-14124 AS the telephone split on -

SELECT VALUE FROM string_split('123-14124','-')



--STEP 2  SELECT only the first value to get the region

SELECT top 1 value FROM string_split('123-14124','-')







--STEP 3                                   

(SELECT top 1 VALUE FROM string_split('123-14124','-')) AS split   -- step 1 put SELECT statement in ()


-----



SELECT telephone                              --Add the left query SELECT statement 
FROM #telephoneNumbers                 
CROSS apply      

(SELECT top 1 value FROM string_split(telephone,'-'))AS split  --- change input string


-------



SELECT telephone , split.value                        --Add the right query value 
FROM #telephoneNumbers                 
CROSS apply      
(SELECT TOP 1 VALUE FROM string_split(telephone,'-'))AS split
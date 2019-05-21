--Woriking with Nulls

declare @null int = null   --When agregate count has a Null value it returns it to 0
select count(@null)

declare @null int = null  --- INT value + NULL Value returns NULL
select sum(1 + @null)

declare @null int = null    -- ISNULL() function lets you return an alternative value when an expression is NULL:
select isnull(@null,0)


Declare @null  int = null    -- The COALESCE() function returns the first non-null value in a list.
select coalesce(@null, 5)



Declare @null  int = null      --In order to check whether a value is NULL or not, use IS NULL or IS NOT NULL operator
if @null is null select 'IT IS NULL' 
if @null is not null select 'it is not null'


--NOT IN , IN

select 1 where 3 in(3,6)
--It returns 1  as it is true 

select 1 where 3 in(3,6,null)
--It  returns 1 AS IT IS TURE ( LOGIC WHERE 3 = 3 OR 3 = 6 OR 3 = NULL) THERFORE 3=3 TRUE

select 1 where NULL in(3,6,null)
--It RETURNS NOTHING AS NULL IS AN UNKNOWN VALUE.  

select 1  where 1 not in(1,3,6,null)
-- it does not return any result as there is a 1 ( logic 1<>1 AND 1<>3) it has to be not equal in all values

select 1  where null not in(1,3,6)
-- as null is an unknown value it will return nothing


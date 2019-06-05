
 --Question 10 IN VIDEO


 --CREATE TABLE
create TABLE ClientLogedinData
 ( ClientId int , loggedIn date)
 go

 insert into ClientLogedinData
 Values 
(1,'01/02/2001'),(1,'01/01/2002'),(1,'01/01/2003'),(1,'01/01/2004'),(1,'01/01/2005'),(1,'01/01/2006'),(1,'01/01/2007'),(1,'01/01/2008'),(2,'01/01/2001') ,(2,'01/01/2002') ,(2,'01/01/2003') ,(2,'01/01/2004') ,(2,'01/01/2005') ,(2,'01/01/2006') ,(2,'01/01/2008'),(3,'01/01/2001'),(3,'01/01/2002'),(3,'01/01/2003'),(3,'01/01/2008'),(4,'01/01/2001'),(4,'01/01/2008'),(5,'01/01/2008');
  GO



--Having the folloWing data

select * from ClientLogedinData;

--return distinct latest date a client logged in and delete the rest

--Remove all duplicates of the ClientLogedinData table based on the clientID column
--Return only the Newest login
  --
--THE CTE WILL RETURN THE LATEST LOGIN OF EACH CLIENTID and all that have more than 1 logedin (HAVING count(*) > 1 )
Begin transaction;
with Cte ( clientID , LatestLogin)
as(
SELECT ClientId , MAX(loggedIn)   --THE LATEST LOGIN OF EACH CLIENTID
FROM ClientLogedinData
GROUP BY ClientId
HAVING count(*) > 1           -- WHICH have more than 1 logedin (SO THAT WE ONLY DELETE DUPLICATES IN FOLOWING DELETE STATEMENT)
)                             --HAVING  COUNT FOR EACH CLIENT to not return clients that have more than 1 entry)

DELETE CD                               ---DELETE ROWS FROM TABLE  CLIENTID
FROM ClientLogedinData AS CD
INNER JOIN Cte on cd.ClientId = cte.clientID   --JOINING WITH CTE TO BRING THE 
AND CD.loggedIn < Cte.LatestLogin

SELECT * FROM ClientLogedinData
GO

ROLLBACK














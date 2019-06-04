
--CREATE A STORED PROCEDURE

CREATE PROC Test_sp  --Create sp
as
begin
select * from cities.city
end

exec Test_sp  --Execute sp

drop proc Test_sp -- Delete sp

---------------------------------------------------------------------------------------------------

---SP WITH 1 PARAMETER

CREATE PROC Test_sp ( @Cityid INT) -- 1 Parameter 
AS
BEGIN 


SELECT * FROM Cities.City
WHERE CityNumber = @Cityid

END

exec Test_sp 5  --Execute sp

drop proc Test_sp -- Delete sp

--------------------------------------------------------------------------------------

---SP WITH  multiple PARAMETER INSERT

alter PROC Test_id_name_surname 
( @clientID varchar(8) , @clientName varchar(100),@clientSurname varchar(100))
as

begin 
	
     insert into Clients.Client(ClientID,ClientName,ClientSurname)
	 values(@clientID,@clientName,@clientSurname)

end


exec Test_id_name_surname '424496Y' , wayne,dregor

SELECT * FROM Clients.Client

DROP PROC Test_id_name_surname
-------------------------------------------------------------------


CREATE PROC Test_DELETE_ClientNumber(@NUMBER INT)
as
BEGIN

DELETE FROM Clients.Client
WHERE ClientNumber = @NUMBER

END

SELECT * FROM Clients.Client

EXEC Test_DELETE_ClientNumber 10
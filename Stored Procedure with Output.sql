--Stored Procedure with output

CREATE Proc OutputProcedure ( @SUM INT OUTPUT)
AS
BEGIN 

 SELECT @SUM = 1 + 1

END

DECLARE @OUTPUT INT
EXEC OutputProcedure @OUTPUT OUTPUT
PRINT @OUTPUT


---------------------------------------------------------------------------------------



ALTER Proc OutputProcedure ( @COUNT INT OUTPUT)
AS
BEGIN 
 SELECT @COUNT = COUNT(*) FROM Cities.City
END

DECLARE @COUNTIT INT
EXEC OutputProcedure @COUNT =  @COUNTIT OUTPUT
PRINT @COUNTIT
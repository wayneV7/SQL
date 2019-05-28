
--When i.e identity(1,1) during an insert an error occurs , data is not inserted but the increment still happens  


CREATE TABLE #TABLE
(  ID INT IDENTITY(1,1),
   LetterOnly varchar(10),
  CHECK (LetterOnly NOT LIKE '%[^A-Z]%')
)

--identity  1 , 2 , error , 4  (the number will be skipped when an error occurs
INSERT INTO #TABLE VALUES ('AAA'),('BBB'),('CCC') 
  DBCC CHECKIDENT ('#TABLE', NORESEED)                   -- current identity value '3', current column value '3'																						          -- reports the current identity value in the specified table, 
														  --and doesn't correct the identity value if it's incorrect.
INSERT INTO #TABLE VALUES ('DD1'),('EE1'),('FF1')  
	DBCC CHECKIDENT ('#TABLE', NORESEED)                 --current identity value '4', current column value '3'    -- here is when the seed is skipped
SELECT * FROM #TABLE
INSERT INTO #TABLE VALUES ('GGG'),('HHH'),('III')     
SELECT * FROM #TABLE                                       --Notice ID 4 is not there as it was created when the error occured and skipped







INSERT INTO #TABLE VALUES ('JJ2'),('KK2'),('LL2')   --MAKING ANOTHER ERROR
declare @int int;  
select  @int = max(ID)from #TABLE                           --THIS WILL SELECT THE LAST IDENTITY CREATED FROM ID AND SET IT TO RESEED 
DBCC CHECKIDENT ('#TABLE', RESEED,@int)
INSERT INTO #TABLE VALUES ('MMM'),('NNN'),('OOO') 
SELECT * FROM #TABLE 





DROP TABLE  #TABLE      





--examplethat helps when even in the begining it starts with an error and has a null

		CREATE TABLE #Client
		( 
			ClientNumber   int  Identity(1,1) not null  Primary Key,
			ClientID       Varchar(20) NULL UNIQUE,    --cannot be duplicate
			ClientName     Varchar(50) NOT NULL ,
			ClientSurname  Varchar(50) NOT NULL  ,
			CHECK (ClientName NOT like  '%[^A-Z]%'),   --accepts letters only
			CHECK (ClientName NOT like  '%[^A-Z]%')
		)
		




BEGIN TRY
   BEGIN TRAN
				insert into #client(clientID,ClientName,ClientSurname)
				values('4746653M','JeB','fGLeBLNI')
   COMMIT
END TRY
BEGIN CATCH
  ROLLBACK
				declare @number int 
				select @number  = Clientnumber from #client
				declare @max int 
				select @max = max(Clientnumber) from #client

                if    @number is null
				DBCC CHECKIDENT('#Client', RESEED, 0)
				else 
				DBCC CHECKIDENT('#Client', RESEED, @max)
			
END CATCH
		
select * from #client
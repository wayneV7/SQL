
-- check the ownwers of the databases with the following script
 SELECT d.name, sl.name
    FROM sys.databases as d JOIN sys.syslogins AS sl 
        ON d.owner_sid = sl.[sid] 



--change the owner of the database
USE <databasename>
GO
sp_changedbowner 'userName'



--check current user
SELECT SUSER_NAME(), USER_NAME() ; 










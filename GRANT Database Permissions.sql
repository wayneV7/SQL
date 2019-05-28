--GRANT Database Permissions : Grants permissions on a database in SQL Server.
-- (Execute as to be done and do not forget object chaining)

https://docs.microsoft.com/en-us/sql/t-sql/statements/grant-database-permissions-transact-sql?view=sql-server-2017


--Syntax

GRANT <permission> [ ,...n ]
    TO <database_principal> [ ,...n ] [ WITH GRANT OPTION ]
    [ AS <database_principal> ]

<permission>::=
permission | ALL [ PRIVILEGES ]

<database_principal> ::=
    Database_user
  | Database_role
  | Application_role	
  | Database_user_mapped_to_Windows_User
  | Database_user_mapped_to_Windows_Group
  | Database_user_mapped_to_certificate
  | Database_user_mapped_to_asymmetric_key
  | Database_user_with_no_login

 --Object owners can grant permissions on the objects they own.
 -- Principals that have CONTROL permission on a securable can grant permission on that securable.

--Grantees of CONTROL SERVER permission, such as members of the sysadmin fixed server role,
-- can grant any permission on any securable in the server.



 --ALL : This option does not grant all possible permissions.
 -- Granting ALL is equivalent to granting the following permissions: 
 --BACKUP DATABASE, BACKUP LOG, CREATE DATABASE, CREATE DEFAULT,
 -- CREATE FUNCTION, CREATE PROCEDURE, CREATE RULE, CREATE TABLE, and CREATE VIEW


 --Examples


USE DatabaseName;
GRANT CREATE TABLE TO MelanieK;
-- Granting permission to create tables


USE DatabaseName;
GRANT CREATE VIEW TO CarmineEs WITH GRANT OPTION;
--Granting CREATE VIEW with GRANT OPTION 
-- permission on the DatabaseName database to user CarmineEs
--WITH GRANT OPTION Indicates that the principal will also be
-- given the ability to grant the specified permission to other principals.


USE DatabaseName;
GRANT CONTROL ON DATABASE:DatabaseName TO Sarah;
GO
--Granting CONTROL permission to a database user



--You can add a database user to a database role using the following query:

EXEC sp_addrolemember N'db_datareader', N'userName'
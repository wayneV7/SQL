Create database test
go

use test
GO

create TABLE tblRoles
(
	RoleId INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	Rolename varchar(20) not null
)
GO
CREATE TABLE tblUsers
(
	UserId int NOT NULL IDENTITY(10000,1) PRIMARY KEY CLUSTERED,
	UserName VARCHAR(20) Unique not null,
	RoleId INT NOT NULL foreign  KEY references tblRoles(RoleId),
	IsActive bit not null default(1)
)
GO



INSERT INTO tblRoles (RoleName)
VALUES ('Pirate'), ('Viking'), ('Samurai')

GO

INSERT INTO tblUsers (UserName , RoleId , IsActive)
VALUES 
('A',1,1),('B',2,1),('C',2,1),('D',2,0),('E',3,0)
GO

SELECT R.RoleId , COUNT(*) as countAllColumns
FROM tblRoles AS R
LEFT JOIN
(SELECT  UserId , RoleId FROM tblUsers  WHERE IsActive = 1)AS U ON U.RoleId = R.RoleId
GROUP BY R.RoleId
GO

SELECT R.RoleId , COUNT(U.UserId) as countUsers
FROM tblRoles AS R
LEFT JOIN
(SELECT  UserId , RoleId FROM tblUsers  WHERE IsActive = 1)AS U ON U.RoleId = R.RoleId
GROUP BY R.RoleId 

GO

use ProjectData

drop database test
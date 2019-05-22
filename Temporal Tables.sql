--CREATING TEMPORAL TABLES

/*A system-versioned temporal table is a type of user table
   designed to keep a full history of data changes and allow easy point in time analysis.

  Every temporal table has two explicitly defined columns, each with a datetime2 data type.
  These columns are referred to as period columns. 
  These period columns are used exclusively by the system to record period of validity for each row whenever a row is modified.


  In addition to these period columns, a temporal table also contains a reference to another table with a mirrored schema.
   The system uses this table to automatically store the previous version of the row each time a row in the temporal table gets updated ordeleted.
    This additional table is referred to as the history table,
	 while the main table that stores current (actual) row versions is referred to as the current table or simply as the temporal table.
	 
 During temporal table creation users can specify existing history table (must be schema compliant) or let system create default history table

*/


--EXAMPLE:

CREATE TABLE dbo.Employee   
(    
    [EmployeeID] int IDENTITY NOT NULL PRIMARY KEY CLUSTERED      
  , [AnnualSalary] decimal (10,2) NOT NULL 
   
  , [ValidFrom] datetime2 (2) GENERATED ALWAYS AS ROW START  --Period start column: The system records the start time for the row in this column,                                                              typically denoted as the SysStartTime column.

  , [ValidTo] datetime2 (2) GENERATED ALWAYS AS ROW END      --Period end column: The system records the end time for the row in this column,                                                                typically denoted at the SysEndTime column.
  , PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)  
 )    
 WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.EmployeeHistory)); 




 --Querying Temporal tables




 INSERT INTO dbo.Employee (AnnualSalary)
 VALUES(25000),(25000),(25000),(25000),(25000),(25000),(25000),(25000),(25000),(25000),(25000),(25000)

UPDATE Employee
set AnnualSalary = 30000      --valid from 2019-05-22 10:57:32.46
where EmployeeID = 1


 SELECT * FROM Employee          --Temporal (current) and History tables can be queried as you would query other tables

 SELECT * FROM EmployeeHistory
 where ValidFrom < getdate()


 SELECT * FROM Employee          --Returns the union of rows that belong to the current and the history table.
  FOR SYSTEM_TIME   all  




 SELECT * FROM Employee                           --Returns a table with a rows containing the values that were actual (current) at the specified 
 FOR SYSTEM_TIME  AS OF '2019-05-22 10:59:43.92 '      --point in time in the past.    
  

SELECT * FROM Employee                               
 FOR SYSTEM_TIME  AS OF '2019-05-22 00:00:00.00 '  --NOTE no data is returnig as time is also evaluated

 
SELECT * FROM Employee                               
 FOR SYSTEM_TIME  AS OF '2019-05-22'                --time  00:00:00.00 





 SELECT * FROM Employee                                                    -- includes rows that became active on the upper boundary defined by	
 FOR SYSTEM_TIME  between '2019-05-22 10:50:43.91 '  and  '2019-05-22 10:57:32.46' --the <end_date_time> endpoint.	
																			
	




  SELECT * FROM Employee                                                    
 FOR SYSTEM_TIME  CONTAINED IN ('2019-05-22 10:50:43.91 ', '2019-05-22 10:57:32.46')
  
  SELECT * FROM Employee                                                    --  Contained in <VALUE FROM> and <VALUE TO>
 FOR SYSTEM_TIME  CONTAINED IN ('2019-05-22 10:57:32.46' , '2019-05-23')     --Returns a table with the values for all row versions that were                                                                               --opened and closed within the specified time range 
																			--Rows that became active exactly on the lower boundary or ceased!!											--being active exactly on the upper boundary are included.!!




 --returns a table with the values for all row versions that are active within the specified time range,
 -- regardless of whether they started being active before the <start_date_time> 
 -- or ceased being active after the <end_date_time>
 --being active exactly on the upper boundary are not included.!!
 SELECT * FROM Employee                                                    	
 FOR SYSTEM_TIME  from '2019-05-22 10:50:43.91'  to  '2019-05-22 10:57:32.46'
     
	




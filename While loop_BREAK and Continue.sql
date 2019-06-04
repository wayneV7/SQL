--To exit the current iteration of a loop, you use the BREAK statement.
--All the statements between the BREAK and END keywords are skipped.
DECLARE @number int = 0
while @number < 10
begin
       
	   set @number = @number + 1
	   if @number = 3 
	   break
	   print @number
end



--The CONTINUE statement stops the current iteration of the loop and starts the new one.

DECLARE @number int = 0
while @number < 10
begin
       
	   set @number = @number + 1
	   if @number = 3 
	   continue
	   print @number
end
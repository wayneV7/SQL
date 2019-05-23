--PLAYING WITH STRINGS



select replace('this is a dog','dog','sausage')   --REPLACE


select STUFF('this is a message', 11,7 , 'sausage') --stuff


select charindex('u' , 'sausages')          --charindex


select DATALENGTH('sausage')          --Datalenght


select SUBSTRING('where did he leave the susage',24,7)  --substring


select reverse('My name is wayne')          --REVERSE


select 'AAA' + LTRIM ('  fff  fff  ') + 'AAA'     --LTRIM
select 'AAA' + RTRIM ('  fff  fff  ') + 'AAA'     --RTRIM
select 'AAA' + TRIM  ('  fff  fff  ') + 'AAA'     --TRIM
select REPLACE  ('  fff  fff  ',' ' , '')


--Selecting surname

SELECT top 1 reverse(value) from string_split(reverse('Wayne Vassallo'),' ') 

SELECT ltrim((substring('Wayne Vassallo',(CHARINDEX(' ','Wayne Vassallo') ) ,100)))






--The only type of jokes I can afford to do
select  stuff ('hello this is oliver and i`m gonna tell you a story',               -- between what you want to stuff it?
		charindex('oliver' ,'hello this is oliver and i`m gonna tell you a story'), -- where does the stuff you want to remove starts
		DATALENGTH(substring('ghtieldnsjsausagejdjdjd',10,7)),'sausage ')           --where is the stuff you wantto enter  and how long  
                              as [knock knock..Who is there?]                       ---what you want to stuff 











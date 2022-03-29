''' 1) USING CURSOR '''


declare 
cursor cur is select *  from teacher;
begin 
	for a in cur loop
		dbms_output.put_line(a.f_name);
	end loop;
end;

-------------------------------------------------------------------------------------------

'''2)  FUNCTION TO GET AVERAGE SALARY OF TEACHER'''

create or replace Function display
return  number is 
	avg_sal integer;
begin 
	select avg(salary) into avg_sal from teacher;
	return avg_sal;
end;

	
BEGIN
	
	dbms_output.put_line('AVERAGE SALARY OF A TEACHER :' || display());
end;

----------------------------------------------------------------------------------------------
''' 3)function example '''

CREATE or REPLACE FUNCTION totalTecaher
RETURN number is 
		total_number integer;
Begin
		select count(*)  into total_number from teacher;
		
		RETURN total_number;
end;

begin
	dbms_output.put_line('TOATL NUMBER OF TEACHERS ARE '|| totalTecaher());
end;

-----------------------------------------------------------------------------------------------------

''' 4)PROCEDURE to update columns of teacher table  '''

CREATE or replace PROCEDURE update_teacher( tno  teacher.t_no%type,tname teacher.f_name%type)
as 
BEGIN
	update teacher set f_name = tname where t_no = tno;
	dbms_output.put_line('SUCESSFULLY UPDATED ');
end;


	
declare 
	tno number(10);
	fname varchar2(10);
BEGIN
	dbms_output.put_line('Enter the teacher no  to be updated');
	tno:=&tno;
	dbms_output.put_line('Enter the name of teacher to be updated');
	fname:='&fname';
	update_teacher(tno,fname);
end;
'''      '''

------------------------------------------------------------------------------------------------------------

'''5 ) FUNCTION  to update columns of teacher table  '''

CREATE or replace FUNCTION update_teacher_fun( tno  teacher.t_no%type,tname teacher.f_name%type)
return varchar is 

BEGIN
	update teacher set f_name = tname where t_no = tno;
	return 'updated sucessfully';
end;

	
declare 
	tno number(10);
	fname varchar2(10);
BEGIN
	dbms_output.put_line('Enter the teacher  to be updated');
	tno:=&tno;
	dbms_output.put_line('Enter the name of teacher to be updated');
	fname:='&fname';
	dbms_output.put_line(update_teacher_fun(tno,fname));
end;
/

'''      '''
-----------------------------------------------------------------------------------------------------------------



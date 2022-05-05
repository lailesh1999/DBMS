Write program to read abd display marks of student

DECLARE
 name varchar2(20);
 regno number(10);
 marks1 number(10);
 marks2 number(10);
 marks3 number(10);
 average number(10);
begin
 name :='&name';
 regno :=&regno;
 marks1 :=&marks1;
 marks2 :=&marks2;
 marks3 :=&marks3;
 average := FLOOR((marks1 + marks2 + marks3)/3);
 if(average < 40)then
  dbms_output.put_line('RESULT :FAIL');
 else
  dbms_output.put_line('RESULT :PASS');
  	if(average < 60) then
   		dbms_output.put_line('SECOND CLASS');
  	elsif(average < 70)then
   		dbms_output.put_line('FIRST CLASS');
  	else
   		dbms_output.put_line('FIRST CLASS WITH DISTINCTION');
  	end if;
 end if;
end;



2)Display result based regno from DATABASE


declare 
	pname student.name%type;
	pregno student.regno%type;
	psub1 student.sub1%type;
	psub2 student.sub2%type;
	psub3 student.sub3%type;
	
	average number(10);
BEGIN
	pregno :=&regno;
	select name,sub1,sub2,sub3 into pname,psub1,psub2,psub3 from student where regno = pregno;
	average := floor((psub1 + psub2 + psub3)/3);
	if(psub1 < 40 or psub2 < 40 or psub2 < 40)THEN
		dbms_output.put_line('result:FAIL');
	ELSE
		dbms_output.put_line('result:PASS'||average);
		if(average < 60)THEN
			dbms_output.put_line('SECOND  CLASS'|| average);
		elsif(average < 70)THEN
			dbms_output.put_line('first class'|| average);
		ELSE
			dbms_output.put_line('first class with  DISTINCTion '||average);
		end if;
	end if;
	EXCEPTION
		WHEN no_data_found THEN
			dbms_output.put_line('DATA NOT FOUND');
			
end;

3) String palindrome or not 

declare
 temp VARCHAR2(20);
 str varchar2(20);
 i integer;
 strlen INTEGER;
 ch varchar2(20);
 vcount VARCHAR2(20);
 rev varchar2(20);
BEGIN
 str :='&str';
 temp := str;
 i := 1;
 strlen :=LENGTH(str);
 str:=lower(str);
 vcount :=0;
 while( i <= strlen)
 LOOP
  ch := SUBSTR(str,i,1);
  rev := ch||rev;
  if(ch = 'a' or ch = 'e' or ch = 'i' or ch = 'o' or ch = 'u' or ch = 's')THEN
   vcount := vcount + 1;
  end if;
  i := i + 1;
 end loop;
 dbms_output.put_line('vovwel'||vcount);
 dbms_output.put_line('REVERSE'||rev);
 if(rev = temp)THEN
  dbms_output.put_line('string is palindrome');
 ELSE
  dbms_output.put_line('not palindrome');
 end IF;
end;

4)FACTORIAL OF A NUMBER

CREATE or replace FUNCTION fact(N in integer)
RETURN integer 
AS
i integer;
f integer;
BEGIN
i :=N;
f :=1;
while(i >0)loop

f := f * i;
i := i - 1;

end loop;
RETURN f;
end;		

BEGIN
	dbms_output.put_line('fact of numner  '||fact(5));
end;


5) procedure to upadet specific record from DATABASE


create or REPLACE PROCEDURE product(pro_id in INTEGER)
IS
price number(10);

BEGIN
	select sell_price into price from prod_master where prodid = pro_id;
	
	if(price < 500) THEN
		
			UPDATE prod_master set sell_price =  sell_price + 500 where prodid = pro_id;
	end if;
	dbms_output.put_line('UPADTED SUCESSFULLY');
		EXCEPTION
		when no_data_found THEN
		dbms_output.put_line('NO DATA UPDATED');	
end;



declare 
id number(10);
begin
id:=&id;
product(id);
end;

6)retrive stock value of specific product using FUNCTION

create or replace FUNCTION fun1(pname in VARCHAR2)
return INTEGER
as 
qty number(10);
cost number(10);
stock_values number(10);
BEGIN

select cost_price,qnt_inhand into cost,qty from prod_master where pdesc = pname;
stock_values := cost * qty;
dbms_output.put_line('COST VALUE OF '||pname||'is'||stock_values);
RETURN stock_values;
EXCEPTION
when no_data_found THEN
dbms_output.put_line('NO DATA ');

end;
	
DECLARE
pn VARCHAR2(20);
BEGIN
pn :='&pn';
dbms_output.put_line(fun1(pn));

end;


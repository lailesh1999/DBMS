Query 1: Display the name of the teacher who is oldest among all teachers

SELECT F_NAME FROM TEACHER WHERE BIRTHDATE =(SELECT MAX(BIRTHDATE) FROM TEACHER);

OR

SELECT F_NAME FROM TEACHER WHERE BIRTHDATE IN(SELECT MAX(BIRTHDATE) FROM TEACHER);

Display teacher numbers and names of those teachers who are earning less than ‘Santhosh’.

SELECT  t_no TEACHER_NO,F_NAME ,L_NAME FROM TEACHER WHERE SALARY < (SELECT SALARY FROM TEACHER WHERE F_NAME = 'santhosh');
 
 OR
SELECT  t_no TEACHER_NO,F_NAME ,L_NAME FROM TEACHER WHERE SALARY < (SELECT SALARY FROM TEACHER WHERE F_NAME like 'santhosh');
 
 
Display the list of all teachers who are earning equal to any teacher who have joined before
‘31-dec-94’

Select * from teacher where salary = (select salary from teacher where joiningdate < '1994-12-31');
 OR
 Select * from teacher where salary in (select salary from teacher where joiningdate < '1994-12-31');
 
Display the list of all those teachers whose salary is greater than any other teacher with job
title ‘Prof’.

Select * from teacher where salary > (Select salary from teacher where title = 'Prof');

OR

Select * from teacher where salary > any (Select salary from teacher where title like 'Prof');

Display the list of all those teachers whose salary is greater than all the teachers with job
title as ‘Prof’.

Display the list of all teachers whose job title and salary is same as that of the employee
whose first name is ‘Santhosh’

select * from teacher where title = (select title from teacher where f_name like 'santhosh')and(select salary from teacher where f_name like'santhosh') ;

Display the records in the format given below for all class teachers:
Santhosh is a class teacher


select CONCAT(f_name,'is a class teacher')NAME from teacher where title= 'class_teacher';


Display names of all the teachers who are class teachers.

select f_name FNAME,l_name LNAME from teacher where title = (select title from teachee where title = 'class teacher');






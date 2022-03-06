create table teacher (t_no integer(10),f_name varchar(20),l_name varchar(20),salary integer(10),supervisor integer(10),joiningdate date,birthdate date,title varchar(20));

insert into teacher values(101,'santhosh','r',20000,null,'1999-01-15','2020-02-02','class_teacher');
insert into teacher values(102,'sam','m',9000,2,'1999-01-15','1996-02-02','class_teacher');
insert into teacher values(103,'karthik','kulal',5000,1,'2020-03-4','1996-08-17','class_teacher');

insert into teacher values(104,'royal','m',25000,null,'2020-12-15','1999-08-15','manager');

insert into teacher values(105,'lanston','v',20800,null,'2020-01-15','1980-02-02','class_teacher');
insert into teacher values(106,'samuel','dsouza',9500,1,'2016-01-15','1990-02-02','class_teacher');
insert into teacher values(107,'samuel','dsouza',9500,1,'2016-01-15','1990-02-02','class_teacher');

insert into teacher values(108,'glen','dsouza',35000,1,'1990-01-15','1990-02-02','class_teacher');
insert into teacher values(109,'gladson','dsouza',35000,1,'1993-01-15','1990-02-02','class_teacher');


display all teachers name whose salary < 1000;

select f_name,l_name,salary from  teacher where salary < 10000;

display all teacher whoe date of birthdate <'1-jan-1995';

select * from teacher where birthdate < '1995-1-01';

display all teachers whose f_name begins with 's';
select * from teacher where f_name like 's%';

display all the teacher  where length of f_name is <  5 letter;

select * from teacher where LENGTH(f_name) < 5;

display all the teacher whose datebirth is between '1-jan-1995' and 'i-jan-2000';

select * from teacher where datebirth  BETWEEN '1995-1-01' and '2000-1-01';

display all teacher  where f_name begins with 's' and ends with'h';

select * from teacher where f_name like 's%h';

display all the  teacher whose jpining date between '1-jan-2020' and '1-jan-2021'


select * from teacher where joiningdate BETWEEN '2020-1-01' and '2021-1-01'

select * from teacher where supervisor is  null;

select * from teacher where supervisor is not null;

update teacher set f_name = 'roy', l_name = 'j' ,joiningdate = '2016-3-19' ,supervisor = NUll where t_no = 107;

select * from teacher order by salary;

select min(salary) MININUM,max(salary) MAXIMUN from teacher;

select upper(f_name) NAME from teacher;

select avg(salary) AVERAGE_SALARY from teacher;

select sum(salary)  TOTAL_SALARY from teacher;
select * from teacher order by  birthdate asc;
select * from teacher order by  birthdate desc;

//add colums to table;
ALTER table teacher ADD phone_no INTEGER(10);

ALTER TABLE TEACHER DROP PHONE_NO;

// TO CHNAGE TABLE NAME
ALTER TABLE TEACHER RENAME EMPLOYEE;
ALTER TABLE EMPLOYEE RENAME TEACHER;

//CHANGE COLUMN NAME 
ALTER TABLE TEACHER RENAME COLUMN PHONE_NO TO MOBILE_NO;


//TO CHNAGE TYPE AND SIZE OF COLUMN;
ALTER TABLE TEACHER MODIFY PHONE_NO VARCHAR(10);

SELECT DISTINCT(TITLE) TITLE FROM TEACHER;

alter table teacher add primary key(t_no);














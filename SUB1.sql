create table employee (FNAME varchar(30),SSN INTEGER(10),SALARY INTEGER(10),SUPERSSN INTEGER(10),PRIMARY KEY(SSN),FOREIGN KEY(SUPERSSN) REFERENCES EMPLOYEE(SSN));
create table employee (FNAME varchar(30),SSN INTEGER(10) PRIMARY KEY,SALARY INTEGER(10),SUPERSSN INTEGER(10) REFERENCES EMPLOYEE(SSN));

INSERT INTO EMPLOYEE VALUES('Smith',1789,30000,3555);
INSERT INTO EMPLOYEE VALUES('Franklin',3555,40000,8555);
INSERT INTO EMPLOYEE VALUES('James',8555,55000,null);
INSERT INTO EMPLOYEE VALUES('John',9321,20000,3555);

CREATE TABLE DEPARTMENT (DNAME VARCHAR(25),DNUMBER INTEGER(10),MGRSSN INTEGER(10),PRIMARY KEY(DNUMBER), FOREIGN KEY(MGRSSN) REFERENCES  EMPLOYEE(SSN));


INSERT INTO DEPARTMENT VALUES('Research',5,3555);
INSERT INTO DEPARTMENT VALUES('Administration',4,3555);
INSERT INTO DEPARTMENT VALUES('Headquarter',1,8555);

CREATE table PROJECT(PNAME VARCHAR(30),PNUMBER INTEGER,PLOCATION VARCHAR(30),DNUM INTEGER,PRIMARY KEY(PNUMBER),FOREIGN KEY(DNUM) REFERENCES DEPARTMENT(DNUMBER));

INSERT INTO PROJECT VALUES('Computerization',10,'Delhi',4);
INSERT INTO PROJECT VALUES('Reoragnization',12,'Banglore',1);
INSERT INTO PROJECT VALUES('Newbenefits',11,'Bombay',5);

CREATE TABLE WORKS_ON (ESSN INTEGER,PNO INTEGER,HOURS INTEGER,PRIMARY KEY(ESSN,PNO),FOREIGN KEY(PNO) REFERENCES PROJECT(PNUMBER),FOREIGN KEY(ESSN) REFERENCES EMPLOYEE(SSN));
INSERT INTO WORKS_ON VALUES(8555,11,5);
INSERT INTO WORKS_ON VALUES(3555,12,3);
INSERT INTO WORKS_ON VALUES(1789,11,7);
INSERT INTO WORKS_ON VALUES(3555,10,4);



Display all employee names who are working on the project ‘Newbenefits’.

SELECT fname,ssn from employee ,project ,works_on  where project.pnumber = works_on.pno and works_on.essn = employee.ssn and  pname ='Newbenefits';


Display the manager’s name of employee ‘John’.

SELECT fname from employee where ssn in (Select mgrssn from employee,project , works_on,department where employee.ssn = works_on.essn and works_on.pno = project.pnumber and project.dnum = department.dnumber and  fname = 'Franklin');


Display the employee names who were not assigned any project.

select fname,ssn from employee where ssn not in (select essn from works_on );



Display the manager’s name who is managing ‘Research’ Dept.

select fname from employee where ssn in (select mgrssn from department where dname = 'Research');

Display all the project names in which ‘Smith’ is working.

select pname from project where pnumber in (SELECT pno from works_on where essn in (select ssn from employee where fname = 'smith'));

select pname from employee,project, works_on where project.pnumber = works_on.pno and works_on.essn=employee.ssn and  fname = 'smith';

Display the manager’s name of employee ‘Franklin’.

select fname from employee where ssn in (SELECT mgrssn from  department where dnumber in (select dnum from project where  pnumber in (select pno from works_on where essn in (select ssn from employee where fname = 'Franklin'))));

Display the total salary of the employees working in ‘Research’ department

SELECT sum(salary) SALARY  from employee where ssn in (select essn from works_on where pno in (select pnumber from project where dnum in(select dnumber from department where dname = 'Research')));   

Display the total hours spent on project ‘Newbenefits’

select sum(hours) HOURS from works_on where pno  in (select pnumber from project where pname = 'Newbenefits');



Show the resulting salaries of every employee working on the ‘Newbenefits’ project
is given 10% increment

select ssn,fname, (salary + salary * 0.1) SALARY from employee where ssn in (select essn from works_on where pno in (SELECT pnumber from project where pname='Newbenefits'));
Retrieve all employees whose name length is 5 characters.

select fname from employee where LENGTH(fname)=5;

(m)Retrieve all employees whose first character is ‘J’.
select fname from employee where fname like 'j%';

Find the sum of salaries of all employees of the project ‘Newbenefits’, the maximum
salary, the minimum salary and the average salary.

select avg(salary) AVERAGE, sum(salary) TOTAL,max(salary)MAXIMUM,min(salary)MINIMUM from employee where ssn in (select essn from works_on where pno in (select pnumber from project where pname='Newbenefits'))

Retrieve the names of employees who work on more than one project

 select fname,essn,count(*) from employee , works_on  where employee.ssn = works_on.essn group by essn,fname having  COUNT(*) > 1; 


Retrieve the project name and the number of employees who work on that project.

select pnumber, pname ,count(*) from project, works_on where works_on.pno = project.pnumber group by pnumber,pname;

List all project numbers for projects that involve an employee whose last name is
‘Smith’, either as a worker or as a manager of the department that controls the
project.
select pno from employee , works_on where employee.ssn = works_on.essn  and fname = 'smith' UNION select pnumber from project,department,employee where project.dnum = department.dnumber and department.mgrssn = employee.ssn and fname = 'smith';



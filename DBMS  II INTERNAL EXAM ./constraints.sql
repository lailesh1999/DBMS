create table bank_customer (CID integer Primary key NOT NULL,
							Cname varchar2(30) NOT NULL check(Cname = UPPER(Cname)),
							DOB DATE NOT NULL,
							City varchar2(20) NOT NULL check(City=Upper(City)));

CREATE table loans (LoanID INTEGER PRIMARY Key NOT NULL,
					CID integer REFERENCES bank_customer(CID) ON DELETE CASCADE,
					LDate DATE,
					LAmount Number(10,2),
					LCloseDate DATE ,
					Status CHAR(1) CHECK(Status IN ('A','C','N')));


insert into bank_customer values(101,'SAM','15-jan-1999','MANGLORE');
insert into bank_customer values(102,'AAA','15-jan-1960','COORG');
insert into bank_customer values(103,'CAA','14-jan-1999','MYSORE');
insert into bank_customer values(104,'SAMSON','15-aug-1947','BENGALURU');
insert into bank_customer values(105,'CHRISTO','1-jan-2000','KASRAGOD');
insert into bank_customer values(106,'HHH','1-jan-2000','MANGLORE');
insert into bank_customer values(107,'HHL','1-jan-2000','XXX');


insert into loans values(1,101,'1-oct-2002',100000,'1-jan-2012','A');
insert into loans values(2,102,'1-oct-2017',65000,'1-jan-2022','C');
insert into loans values(3,103,'1-oct-2001',85000,'1-jan-2012','N');
insert into loans values(4,104,'1-oct-2002',1050000,'1-jan-2012','C');
insert into loans values(5,105,'1-oct-2016',100000,'1-jan-2022','A');


//using ALTER METHOD TO ADD CONSTRAINTS

//To ADD CONSTRAINTS 

BANK_CUSTOMERS

Alter TABLE bank_customer ADD CONSTRAINT Cname check(Cname = UPPER(Cname));
Alter TABLE bank_customer ADD CONSTRAINT City check(City = UPPER(City));

//loans 
										
ALTER TABLE loans ADD CONSTRAINT LCloseDate CHECK(LCloseDate >LDate);




// TO drop CONSTRAINTS

Alter TABLE loans DROP CONSTRAINT  LCloseDate;

Alter TABLE bank_customer DROP CONSTRAINT  Cname;
Alter TABLE bank_customer DROP CONSTRAINT  City;


a)  select CID,CNAME,City from bank_customer where City = 'MANGLORE';

b) select CID,CNAME,City from bank_customer where City = 'MANGLORE' order by City ,CNAME desc;

c) select CID,CNAME,City from bank_customer where City IN ('MANGLORE','MYSORE','BENGALURU') order by City;

d) select CNAME,City,DOB from bank_customer where DOB > '1-jan-1990' and  CNAME like 'A%' or CNAME like 'C%';
or
d)select CNAME,City,DOB from bank_customer where  CNAME like 'A%' or CNAME like 'C%' and DOB > '1-jan-1990';

e) select CID,CNAME,City from bank_customer where Cname like '%L' and City NOT IN ('MYSORE','MANGLORE','BENGALURU','COORG') order by City;

f) select CID,LoanID,LDate,LAmount from loans where LAmount BETWEEN 50000 and 100000 and LDate < '31-mar-2016' order by LAmount desc;
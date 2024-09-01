#Aggregate Functions

---------------------------------------
1. Avg :- To Compute the Average Value 
Display The Average  gross of Employee
---------------------------------------
drop table if exists DEPT030;
create table Employee(
   Emp_name varchar(10) primary key,
   Emp_Roll varchar(10) not null ,
   sal int ,
    grade  varchar(10),
    gross varchar(10)
    );

insert into Employee values(
'SHGIVAKUMAR', '20231CSE' , 25000, 'A+' , 25);
    insert into Employee values('VIKAS', '20231ISE' , 15000, 'B+' , 15);

-----------------------------------------
2. min :- to Find the Minimum Value
Display the minimum  value from table
-----------------------------------------

drop table if exists DEPT030;
create table Employee(
   Emp_name varchar(10) primary key,
   Emp_Roll varchar(10) not null ,
   sal int ,
    grade  varchar(10),
    gross varchar(10)
    );

insert into Employee values(
'SHGIVAKUMAR', '20231CSE' , 25000, 'A+' , 25);
    insert into Employee values('VIKAS', '20231ISE' , 15000, 'B+' , 15);

select min(gross)
from Employee where grade ='B+' or grade = 'C+';

------------------------------------------
 3. Max :- to Find the Maximum Value
Display the Maximum  value from table
------------------------------------------
drop table if exists DEPT030;
create table Employee(
   Emp_name varchar(10) primary key,
   Emp_Roll varchar(10) not null ,
   sal int ,
    grade  varchar(10),
    gross varchar(10)
    );

insert into Employee values(
'SHGIVAKUMAR', '20231CSE' , 25000, 'A+' , 25);
    insert into Employee values('VIKAS', '20231ISE' , 15000, 'B+' , 15);

select max(gross)
from Employee where grade ='B+' or grade = 'C+';
---------------------------------
4. Max :- to Find the Maximum Value
Display the Maximum  value from table
------------------------------------------
drop table if exists DEPT030;
create table Employee(
   Emp_name varchar(10) primary key,
   Emp_Roll varchar(10) not null ,
   sal int ,
    grade  varchar(10),
    gross varchar(10)
    );

insert into Employee values(
'SHGIVAKUMAR', '20231CSE' , 25000, 'A+' , 25);
    insert into Employee values('VIKAS', '20231ISE' , 15000, 'B+' , 15);

select max(gross)
from Employee where grade ='B+' or grade = 'C+';

---------------------------------------------
5. Max :- to Find the Maximum Value
Display the Maximum  value from table
------------------------------------------
drop table if exists DEPT030;
create table Employee(
   Emp_name varchar(10) primary key,
   Emp_Roll varchar(10) not null ,
   sal int ,
    grade  varchar(10),
    gross varchar(10)
    );

insert into Employee values(
'SHGIVAKUMAR', '20231CSE' , 25000, 'A+' , 25);
    insert into Employee values('VIKAS', '20231ISE' , 15000, 'B+' , 15);

select count(*)
from Employee where grade ='B+' or grade = 'C+';

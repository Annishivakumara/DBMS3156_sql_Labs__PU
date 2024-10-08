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


COMPLETE CODE OF THE ABOVE AGRGATION 
drop table if exists  Employee;
create table Employee(
   Emp_name varchar(10) primary key,
   Emp_Roll varchar(10) not null ,
   sal int ,
    grade  varchar(10),
    gross varchar(10)
    );

    insert into Employee values('SHIVAKUMAR', '20231CSE' , 25000, 'A+' , 25);
    insert into Employee values('VIKAS', '20231ISE' , 15000, 'B+' , 15);
    insert into Employee values('CHETHAN', '20231ECE' , 10000, 'C+' , 10);
    insert into Employee values('SHREYAS', '20231MECH' , 5000, 'D+' , 5);


select distinct *
from Employee where grade ='B+' or grade = 'C+' or grade = 'D+' or gross= 25
--order by gross desc
group by Emp_Roll and Emp_name;
--new table adding to existing table
alter table Employee
 add  City varchar(20);
update Employee set City = 'BENGALURU'  where  gross=25 or gross=15 or gross=10 or gross = 5;
-- renameing the gross  to the year salary
alter table Employee
 rename column sal to Year_salary;

drop database if exists Bank;
create database Bank ;
use Bank;
show tables;
--create tabel's  Based on given Schema
  create table Branch(Branch_name varchar(20) primary key, Branch_city varchar(20), Assets float);
  create table Account(AccNo int primary key , Branch_name varchar(20) ,balance decimal(10,2), foreign key(Branch_name) references Branch(Branch_name) on delete cascade);
  
  create table Customer(customer_name varchar(20) primary key , customer_street varchar(20), customer_city varchar(20));
  create table Depositor(customer_name varchar(20) , AccNo int , foreign key(customer_name) references Customer(customer_name), foreign key(AccNo) references Account(AccNo)on delete cascade);
  
  create table Loan(loan_num int primary key , Branch_name varchar(20), ammount float, foreign key(Branch_name) references Branch(Branch_name) on delete cascade);
  create table Borrower(customer_name varchar(20), loan_num int , foreign key(customer_name) references Customer(customer_name), foreign key(loan_num) references Loan(loan_num)on delete cascade);
  

  insert into Branch values('pj_extension', 'Davangere', 2001);
  insert into Branch values('Ram nagar', 'mandya', 3001);
  insert into Branch values('Sadri', 'gadaga', 4001);
  insert into Branch values('AVK exten', 'Bengaluru', 5001);
  
  insert into Account values(123,'pj_extension', 200000);
  insert into Account values(456,'Ram nagar', 500000);
  insert into Account values(789,'Sadri', 200000);
  insert into Account values(012,'AVK exten', 100000);
  
  
  insert into Customer values('Shivakumar', 'Rj_street', 'Changiri');
  insert into Customer values('Pradeep', 'Satya_street', 'Rajanuru');
  insert into Customer values('Shashi', 'Kamal_street', 'Hampi');
  insert into Customer values('Sharath', 'Presi_street', 'Rajanukunte');
  
  insert into Depositor values('Shivakumar',123);
  insert into Depositor  values('Pradeep', 456);
  insert into Depositor values('Shashi', 789);
  insert into Depositor values('Sharath', 012);
  
  insert into Loan values(01, 'pj_extension',50000);
  insert into Loan values(02, 'Ram nagar',60000);
  insert into Loan values(03, 'Sadri',70000);
  insert into Loan values(04, 'AVK exten',80000);
  
  insert into Borrower values('Shivakumar', 01);
  insert into Borrower values('Pradeep', 02);
  insert into Borrower values('Shashi', 03);
  insert into Borrower values('Sharath', 04);
  
  select *
    from Branch;

--please Add Comment When  your going to run on into the compiler
-- 1. Find the names of all branches in the Loans Relation 
  select Branch_name
  from Loan;
  
-- 2. Find the names of all branches in the Loans Relation and remove dublicates
  select  distinct Branch_name 
  from Loan;
  
 --3. Find the Loan Number of those loans with amount between 50000 to 60000
 SELECT  loan_num
 from Loan where ammount between 50000 and 60000;
 
 --4. find the cartesion product of the Borrower_loan 
 select *
 from Borrower;

 --5. Find the name and Loan Num of the customer having a Loan at the prfeered Branch
   select distinct customer_name , Borrower.loan_num
   from Borrower , Loan
   where Borrower.loan_num =Loan.loan_num and Branch_name ="pj_extension";

 --6. find the city of a customer with Account number  123?
   SELECT customer_city
   FROM Customer
   WHERE customer_name = (
   SELECT customer_name
   FROM Depositor
   WHERE AccNo = 123
   );
 --7. Find the sum of  total account balance of any branch. 
SELECT  Branch_name , avg(balance) 
from Account where Branch_name = "pj_extension";
 --8. Find the number of branches that currently DON'T have loans
SELECT COUNT(B.Branch_name)
FROM Branch B
LEFT JOIN Loan L ON B.Branch_name = L.Branch_name
WHERE L.Branch_name IS NULL;

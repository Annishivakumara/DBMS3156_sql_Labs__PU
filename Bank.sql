  drop database if exists Bank;
  create database Bank;
  use Bank;
  
  
  create table Branch(Branch_name varchar(20) primary key, Branch_city varchar(20), Assets float);
  create table Account(AccNo int primary key , Branch_name varchar(20) , foreign key(Branch_name) references Branch(Branch_name) on delete cascade, balance float);
  
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
  from  Bank ;

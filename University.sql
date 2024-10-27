drop database exists University;
create database University;
use University;
use shop;
--Student Table
create table Student(
S_id int primary key, Sname varchar(20) , Major varchar(20),
 Addres varchar(20), level varchar(20), age int , DOB Date 
);
---faculty
create table faculty (
F_id int primary key,
Fname varchar(20) ,
Deport  varchar(10));

--Course
create table Course (
Cname varchar(10) primary key,
Meets varchar(20), 
Room varchar(20),
F_id int, 
foreign key(F_id) references faculty(F_id));


create table Enrolled(
S_id int , Cname varchar(10),
foreign key (S_id) references Student(S_id),
foreign key (Cname)  references Course(Cname)
);
 
insert into Student values
(2023, 'SHIVU', 'DBMS' , 'Bengaluru', '2nd', 19, '2004-05-17'),
(2024, 'Shreyas', 'DSA' , 'Bengaluru', '2nd', 20, '2003-05-17'),
(2025, 'pradeep', 'MATH' , 'Bengaluru', '2nd', 21, '2002-05-15'),
(2026, 'Preetham', 'FDA' , 'Bengaluru', '2nd', 23, '2000-05-15');


insert into faculty values
(101,'Deepthi', 'DBMS'),
(102,'Prince', 'DSA'),
(103,'Pradeep', 'MATH'),
(104,'Shwetha', 'FDA');

insert into Course values
( 'DBMS','LFL05','UF01', 101),
( 'DSA','LFL06','UF02', 102),
( 'MATH','LFL07','UF03', 103),
( 'FDA','LFL08','UF04', 104);

insert into Enrolled values
( 2023,'DBMS'),
( 2024,'DSA'),
( 2025,'MATH'),
( 2026,'FDA');

 
 
select *
from University;

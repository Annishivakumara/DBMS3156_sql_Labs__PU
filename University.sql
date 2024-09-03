Drop database if exists Student;
--creating database 
create database Student;
use Student;

create table Student (
 Sid int primary key, Sname varchar(20), Major varchar(20) , level varchar(20),  DOB date );
  
create table faculty(
 Fid int  primary key, Fname varchar(20) , Deport int);
 
 create table Course(
 Cname varchar(20) primary key , Meets varchar(20) , Room varchar(20) Fid int , foreign key(Fid) references faculty(Fid) , on delete cascade);
 
 create table Enrolled(
 Sid int , foreign key(Sid) references Student(Sid), Cname varchar(20) ,  foreign key(Cname) references key(Cname) , on delete casecade);
 
 
insert into Student values(
0619, 'Shivu', 'CSE2001', 'Senior' , 2005-10-17);
0620, 'Shashi' , 'CSE2002', 'Junior' , 2006-11-20),
0621, 'Rakshu' , 'CSE2003', 'Senior' , 2005-01-03),
0622, 'Manasa' , 'Math2005', 'Senior' , 2004-12-03);

insert into  faculty values(
101, 'Prince' , 'DSA'),
111, 'Deepthi' , 'DBMS'),
222, 'Shwetha' , 'FDA'),
333, 'Pradeep' , 'MATH');

insert into Course values(
 'DBMS','LFL05','UF01', 101),
'DSA','LFL06','UF02', 102),
 'MATH','LFL07','UF03', 103),
 'FDA','LFL08','UF04', 104),
);

insert into Enrolled values(
   2023,'DBMS'),
 2024,'DSA'),
 2025,'MATH'),
 2026,'FDA');
);


select *
from University;

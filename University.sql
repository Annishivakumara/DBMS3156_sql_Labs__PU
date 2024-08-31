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
 
 

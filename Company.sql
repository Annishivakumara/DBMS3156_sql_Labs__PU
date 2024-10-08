--1. Retirive the Bdate and Address of the Employee Whose name is "John"
select Bdate , Address
    -> from employee where Fname="JOHN";
+------------+--------------------------+
| Bdate      | Address                  |
+------------+--------------------------+
| 1965-01-09 | 731 Fondren, Houston, TX |
+------------+--------------------------+

--2. Select all Employee SSn
 select all Ssn
    -> from employee;
+-----------+
| Ssn       |
+-----------+
| 123456789 |
| 333445555 |
| 453453453 |
| 666884444 |
| 888665555 |
| 987654321 |
| 987987987 |
| 999887777 |
+-----------+
--3.Retrive the combination of employee ssn and deportment dname in the database
 select Ssn, Fname,Dname
    -> from employee , department where Dnumber=Dno;
+-----------+----------+----------------+
| Ssn       | Fname    | Dname          |
+-----------+----------+----------------+
| 123456789 | John     | Research       |
| 333445555 | Franklin | Research       |
| 453453453 | Joyce    | Research       |
| 666884444 | Ramesh   | Research       |
| 888665555 | James    | Headquarters   |
| 987654321 | Jennifer | Administration |
| 987987987 | Ahmad    | Administration |
| 999887777 | Alicia   | Administration |
+-----------+----------+----------------+
--4. Retrive the name and address of Employee who work  for the Research deportment 
select  Fname , Address
from Employee  as E , Department as D where   D.Dnumber=E.Dno and Dname="Research";

--5.
SELECT Pnumber, Lname, Address, Bdate Mgr_ssn
from Department  as D, Employee as E , Project  as P where
D.Dnumber=P.Dnum and E.Ssn=D.Mgr_ssn and Plocation="Stafford";

--6. Retrive All Employee's Whose Address is in Houston Taxes
SELECT  ALL  *
from Employee  where Address ="Houston,TX";

--7. Retrive All Employee in Department No 5 whose salary is Betwen 30.000 and 40.000
SELECT *
from Employee WHERE Dno=5 and Salary BETWEEN 30000 and 40000;
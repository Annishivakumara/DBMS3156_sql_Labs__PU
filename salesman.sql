DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS SALESMAN;

CREATE TABLE SALESMAN (
    Salesman_id INT PRIMARY KEY,
    Name VARCHAR(20),
    City VARCHAR(20),
    Commission FLOAT
);
CREATE TABLE CUSTOMER (
    Customer_id INT PRIMARY KEY,
    Cust_Name VARCHAR(20),
    City VARCHAR(20),
    Grade VARCHAR(20),
    Salesman_id INT,
    FOREIGN KEY (Salesman_id) REFERENCES SALESMAN(Salesman_id) ON DELETE CASCADE
);
CREATE TABLE ORDERS (
    Ord_no INT PRIMARY KEY,
    Purchase_Amt INT,
    Ord_Date DATE,
    Customer_id INT,
    Salesman_id INT,
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Salesman_id) REFERENCES SALESMAN(Salesman_id) ON DELETE CASCADE
);
INSERT INTO SALESMAN (Salesman_id, Name, City, Commission) VALUES
(2024001, 'Ravishankar', 'Bengaluru', 25.00),
(2024002, 'Rathnakar', 'Bengaluru', 35.00),
(2024003, 'Vajramuni', 'Kalburgi', 18.00),
(2024004, 'Bharat', 'Davangere', 15.00),
(2024005, 'Preetham', 'Kodagu', 29.00);

INSERT INTO CUSTOMER (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES
(9481, 'Vishwas', 'Bengaluru', 'A', 2024001),
(9353, 'Vikas', 'Bengaluru', 'B', 2024002),
(6363, 'Vikram', 'Chikkamagaluru', 'A', 2024003),
(7090, 'Vivek', 'Shimoga', 'C', 2024004),
(9036, 'Vikranth', 'Vijayanagara', 'C', 2024005);

INSERT INTO ORDERS (Ord_no, Purchase_Amt, Ord_Date, Customer_id, Salesman_id) VALUES
(01, 20000, '2024-05-16', 9353, 2024002),
(02, 50000, '2024-08-20', 9481, 2024001),
(03, 80000, '2024-08-21', 7090, 2024004),
(04, 80000, '2024-08-21', 7090, 2024004),
(05, 180000, '2024-09-17', 9036, 2024005);




--Queries
--Q1: Q:Count the customers with grades above Bangalore average.
select grade,count(distinct C_id)from customer group by grade having grade>(select avg(grade) from customer where C_city="Bangalore");

--Q2: find the name and number of all salesman who had more than one customer
select salesman_id , S_name from salesman_s s where 1<(select count(*)from customer where salesman_id=s.salesman_id);

--Q3: 
select s.salesman_id,S_name,C_name, commission from salesman_s s,customer c where s.S_city=c.C_city union select salesman_id,S_name,'No match',commission from salesman_s where not S_city=any (select C_city from customer) order by 2 desc;

--Q4: 
create view ElitsSalesman as select b.ord_date, a.salesman_id,a.S_name from salesman_s a, orders b where a.salesman_id=b.salesman_id and b.purchase_amt =(select max(purchase_amt) from orders c where c.ord_date=b.ord_date);

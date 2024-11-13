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

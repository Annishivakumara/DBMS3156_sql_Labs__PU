r password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 5.5.16 MySQL Community Server (GPL)

Copyright (c) 2000, 2011, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database library;
Query OK, 1 row affected (0.01 sec)

mysql> use library;
Database changed
mysql> create table Book(book_id int  primary key , title varchar(20) , publiher_name varchar(20) , pub_year date, );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table Book(book_id int primary key , title varchar(20) , publisher_name varchar(20) , pub_year date );
Query OK, 0 rows affected (0.05 sec)

mysql> create table Book_aouther(book_id int, foreign key(book_id)  references Book(book_id) on delete cascade, author_name varchar(20) ) ;
Query OK, 0 rows affected (0.03 sec)

mysql> create table publisher(name  varchar(20) , address varchar(20), phone  int  );
Query OK, 0 rows affected (0.03 sec)

mysql> create table library_branch(branch_id  int primary key , branch_name varchar(20)  address varchar(20) );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'address varchar(20) )' at line 1
mysql>  create table library_branch(branch_id  int primary key , branch_name varchar(20) , address varchar(20) );
Query OK, 0 rows affected (0.04 sec)

mysql> create table Book_copies(book_id int, foreign key(book_id) references Book(book_id) on delete cascade,  branch_id int, foreign key(library_branch) references(library_branch) on delete cascade , no_of_copies int );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(library_branch) on delete cascade , no_of_copies int )' at line 1
mysql> create table Book_copies(book_id int, foreign key(book_id) references Book(book_id) on delete cascade,  branch_id int, foreign key(library_branch) references library_branch(branch_id) on delete cascade , no_of_copies int );
ERROR 1072 (42000): Key column 'library_branch' doesn't exist in table
mysql> create table Book_copies(book_id int, foreign key(book_id) references Book(book_id) on delete cascade,  branch_id int, foreign key(branch_id) references library_branch(branch_id) on delete cascade , no_of_copies int );
Query OK, 0 rows affected (0.00 sec)

mysql> create table book_lending(book_id int , foreign key(book_id) references Book(book_id) on delete cascade ,  branch_id  int, foreign key(branch_id) references library_branch(branch_id)  on delete cascade,  card_no int  , date_out date , due_date );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table book_lending(book_id int , foreign key(book_id) references Book(book_id) on delete cascade ,  branch_id  int, foreign key(branch_id) references library_branch(branch_id)  on delete cascade,  card_no int  , date_out date , due_date  date );
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> insert into Book values(01, "As you like it" "Scholastic" 20010101);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '20010101)' at line 1
mysql> insert into Book values(01, "As you like it" "Scholastic" '2001-01-01');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into Book values(01, "As you like it", "Scholastic" ,'2001-01-01');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Book values(02, "Akbar and Birbal", "Scholastic" ,'2001-01-02');
Query OK, 1 row affected (0.03 sec)

mysql> insert into Book values(03, "Rani laxmibai", "Scholastic" ,'2001-02-03');
Query OK, 1 row affected (0.03 sec)

mysql> insert into Book values(04, "Super zero", "Penguin books" ,'2001-02-04');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Book values(05, "Victory song", "Penguin books" ,'2003-02-05');
Query OK, 1 row affected (0.03 sec)

mysql> delete table Book_aouther;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table Book_aouther' at line 1
mysql> drop table Book_aouther;
Query OK, 0 rows affected (0.03 sec)

mysql> create table Book_aouther(book_id int, foreign key(book_id)  references Book(book_id) on delete cascade, author_name varchar(20), praimary key (book_id , author_name ) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (book_id , author_name )' at line 1
mysql> create table Book_aouther(book_id int, foreign key(book_id)  references Book(book_id) on delete cascade, author_name varchar(20), praimary key (book_id , author_name )) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key (book_id , author_name ))' at line 1
mysql> create table Book_aouther(book_id int, foreign key(book_id)  references Book(book_id) on delete cascade, author_name varchar(20), primary ke
y (book_id , author_name ));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into Book_aouther values(01, "Anurima Chanda" , );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> insert into Book_aouther values(01, "Anurima Chanda");
Query OK, 1 row affected (0.03 sec)

mysql> insert into Book_aouther values(02, "Amita sarni");
Query OK, 1 row affected (0.03 sec)

mysql> insert into Book_aouther values(03, "Deepa Agarwal");
Query OK, 1 row affected (0.02 sec)

mysql> insert into Book_aouther values(04, "Jit chaudhari");
Query OK, 1 row affected (0.00 sec)

mysql> insert into Book_aouther values(05, "Chitra Banarjee");
Query OK, 1 row affected (0.02 sec)

mysql> insert into publisher values("Vinayaka" , "Bengaluru" , 50501);
Query OK, 1 row affected (0.04 sec)

mysql> insert into publisher values("Shashi" , "Mangalore" , 87227);
Query OK, 1 row affected (0.03 sec)

mysql> insert into publisher values("Broudh" , "Mandya" , 90199);
Query OK, 1 row affected (0.03 sec)

mysql> insert into publisher values("Chiraga" , "Davangere" , 01921);
Query OK, 1 row affected (0.03 sec)

mysql> insert into publisher values("Shiva" , "Hospete" , 01321);
Query OK, 1 row affected (0.03 sec)

mysql> insert into Book_copies values(01, 101, 1000);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`library`.`book_copies`, CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `library_branch` (`branch_id`) ON DELETE CASCADE)
mysql> insert into library_branch values(101, "Academic library" "rajanukunte" );
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into library_branch values(101, "Academic library" ,"rajanukunte" );
Query OK, 1 row affected (0.04 sec)

mysql> insert into library_branch values(102, "Public library", library" ,"yalahanka" );
    "> insert into library_branch values(102, "Public library","yalahanka" );
    "> ;
    "> >;
    "> INSERT INTO library_branch VALUES (102, 'Public library', 'library', 'yalahanka');
    "> ";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '" ,"yalahanka" );
insert into library_branch values(102, "Public library","yalah' at line 1
mysql> INSERT INTO library_branch VALUES (102, 'Public library', 'library', 'yalahanka');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO library_branch VALUES (102, 'Public library', 'yalahanka');
Query OK, 1 row affected (0.03 sec)

mysql> insert into library_branch values(103, "Special library" ,"Hebbal" );
Query OK, 1 row affected (0.00 sec)

mysql> insert into library_branch values(104, " State library" ,"maleshavarm" );
Query OK, 1 row affected (0.02 sec)

mysql> insert into library_branch values(105, " School library" ,"rvk" );
Query OK, 1 row affected (0.03 sec)

mysql> insert into  Book_copies  values(01 , 101 , 1000);
Query OK, 1 row affected (0.04 sec)

mysql> insert into  Book_copies  values(02 , 102 , 2000);
Query OK, 1 row affected (0.03 sec)

mysql> insert into  Book_copies  values(03 , 103 , 3000);
Query OK, 1 row affected (0.02 sec)

mysql> insert into  Book_copies  values(04 , 104 , 4000);
Query OK, 1 row affected (0.03 sec)

mysql> insert into  Book_copies  values(05 , 105 , 5000);
Query OK, 1 row affected (0.03 sec)

mysql> insert into  book_lending values(01, 101, 51, '2005-08-17', '2005-09-18');
Query OK, 1 row affected (0.00 sec)

mysql> insert into  book_lending values(02, 102, 52, '2004-09-30', '2004-10-20');
Query OK, 1 row affected (0.03 sec)

mysql> insert into  book_lending values(03, 103, 53, '2007-02-02', '2008-01-01');
Query OK, 1 row affected (0.03 sec)

mysql> insert into  book_lending values(04, 104, 54, '2010-05-06', '2009-04-05');
Query OK, 1 row affected (0.03 sec)

mysql> insert into  book_lending values(05, 105, 55, '2010-05-07', '2011-06-06');
Query OK, 1 row affected (0.03 sec)

mysql> select * from ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select * from Book;
+---------+------------------+----------------+------------+
| book_id | title            | publisher_name | pub_year   |
+---------+------------------+----------------+------------+
|       1 | As you like it   | Scholastic     | 2001-01-01 |
|       2 | Akbar and Birbal | Scholastic     | 2001-01-02 |
|       3 | Rani laxmibai    | Scholastic     | 2001-02-03 |
|       4 | Super zero       | Penguin books  | 2001-02-04 |
|       5 | Victory song     | Penguin books  | 2003-02-05 |
+---------+------------------+----------------+------------+
5 rows in set (0.04 sec)

mysql> select * from book_author;
ERROR 1146 (42S02): Table 'library.book_author' doesn't exist
mysql> select * from Book_aouther;
+---------+-----------------+
| book_id | author_name     |
+---------+-----------------+
|       1 | Anurima Chanda  |
|       2 | Amita sarni     |
|       3 | Deepa Agarwal   |
|       4 | Jit chaudhari   |
|       5 | Chitra Banarjee |
+---------+-----------------+
5 rows in set (0.00 sec)

mysql> select * from publisher;
+----------+-----------+-------+
| name     | address   | phone |
+----------+-----------+-------+
| Vinayaka | Bengaluru | 50501 |
| Shashi   | Mangalore | 87227 |
| Broudh   | Mandya    | 90199 |
| Chiraga  | Davangere |  1921 |
| Shiva    | Hospete   |  1321 |
+----------+-----------+-------+
5 rows in set (0.01 sec)

mysql> select * from  library_branch;
+-----------+------------------+-------------+
| branch_id | branch_name      | address     |
+-----------+------------------+-------------+
|       101 | Academic library | rajanukunte |
|       102 | Public library   | yalahanka   |
|       103 | Special library  | Hebbal      |
|       104 |  State library   | maleshavarm |
|       105 |  School library  | rvk         |
+-----------+------------------+-------------+
5 rows in set (0.00 sec)

mysql> select * from Book_copies;
+---------+-----------+--------------+
| book_id | branch_id | no_of_copies |
+---------+-----------+--------------+
|       1 |       101 |         1000 |
|       2 |       102 |         2000 |
|       3 |       103 |         3000 |
|       4 |       104 |         4000 |
|       5 |       105 |         5000 |
+---------+-----------+--------------+
5 rows in set (0.00 sec)

mysql> select * from  book_lending;
+---------+-----------+---------+------------+------------+
| book_id | branch_id | card_no | date_out   | due_date   |
+---------+-----------+---------+------------+------------+
|       1 |       101 |      51 | 2005-08-17 | 2005-09-18 |
|       2 |       102 |      52 | 2004-09-30 | 2004-10-20 |
|       3 |       103 |      53 | 2007-02-02 | 2008-01-01 |
|       4 |       104 |      54 | 2010-05-06 | 2009-04-05 |
|       5 |       105 |      55 | 2010-05-07 | 2011-06-06 |
+---------+-----------+---------+------------+------------+
5 rows in set (0.00 sec)

mysql> select B.book_id , B.title , B.publiher_name, A.author_name , c.no_of_copies , L.branch_id
    -> from Book B , Book_aouther A , Book_copies c , library_branch L ;
ERROR 1054 (42S22): Unknown column 'B.publiher_name' in 'field list'
mysql> select B.book_id , B.title , B.publisher_name, A.author_name , c.no_of_copies , L.branch_id
    -> from Book B , Book_aouther A , Book_copies c , library_branch L ;
+---------+------------------+----------------+-----------------+--------------+-----------+
| book_id | title            | publisher_name | author_name     | no_of_copies | branch_id |
+---------+------------------+----------------+-----------------+--------------+-----------+
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         1000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         1000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         1000 |       101 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         1000 |       101 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         1000 |       101 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         1000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         1000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         1000 |       101 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         1000 |       101 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         1000 |       101 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         1000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         1000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         1000 |       101 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         1000 |       101 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         1000 |       101 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         1000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         1000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         1000 |       101 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         1000 |       101 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         1000 |       101 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         1000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         1000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         1000 |       101 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         1000 |       101 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         1000 |       101 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         2000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         2000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         2000 |       101 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         2000 |       101 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         2000 |       101 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         2000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         2000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         2000 |       101 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         2000 |       101 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         2000 |       101 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         2000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         2000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         2000 |       101 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         2000 |       101 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         2000 |       101 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         2000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         2000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         2000 |       101 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         2000 |       101 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         2000 |       101 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         2000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         2000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         2000 |       101 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         2000 |       101 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         2000 |       101 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         3000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         3000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         3000 |       101 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         3000 |       101 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         3000 |       101 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         3000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         3000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         3000 |       101 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         3000 |       101 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         3000 |       101 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         3000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         3000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         3000 |       101 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         3000 |       101 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         3000 |       101 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         3000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         3000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         3000 |       101 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         3000 |       101 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         3000 |       101 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         3000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         3000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         3000 |       101 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         3000 |       101 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         3000 |       101 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         4000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         4000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         4000 |       101 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         4000 |       101 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         4000 |       101 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         4000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         4000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         4000 |       101 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         4000 |       101 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         4000 |       101 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         4000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         4000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         4000 |       101 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         4000 |       101 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         4000 |       101 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         4000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         4000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         4000 |       101 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         4000 |       101 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         4000 |       101 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         4000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         4000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         4000 |       101 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         4000 |       101 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         4000 |       101 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         5000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         5000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         5000 |       101 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         5000 |       101 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         5000 |       101 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         5000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         5000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         5000 |       101 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         5000 |       101 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         5000 |       101 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         5000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         5000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         5000 |       101 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         5000 |       101 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         5000 |       101 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         5000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         5000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         5000 |       101 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         5000 |       101 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         5000 |       101 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         5000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         5000 |       101 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         5000 |       101 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         5000 |       101 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         5000 |       101 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         1000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         1000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         1000 |       102 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         1000 |       102 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         1000 |       102 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         1000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         1000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         1000 |       102 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         1000 |       102 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         1000 |       102 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         1000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         1000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         1000 |       102 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         1000 |       102 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         1000 |       102 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         1000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         1000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         1000 |       102 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         1000 |       102 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         1000 |       102 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         1000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         1000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         1000 |       102 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         1000 |       102 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         1000 |       102 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         2000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         2000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         2000 |       102 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         2000 |       102 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         2000 |       102 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         2000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         2000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         2000 |       102 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         2000 |       102 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         2000 |       102 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         2000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         2000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         2000 |       102 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         2000 |       102 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         2000 |       102 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         2000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         2000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         2000 |       102 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         2000 |       102 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         2000 |       102 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         2000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         2000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         2000 |       102 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         2000 |       102 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         2000 |       102 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         3000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         3000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         3000 |       102 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         3000 |       102 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         3000 |       102 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         3000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         3000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         3000 |       102 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         3000 |       102 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         3000 |       102 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         3000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         3000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         3000 |       102 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         3000 |       102 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         3000 |       102 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         3000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         3000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         3000 |       102 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         3000 |       102 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         3000 |       102 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         3000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         3000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         3000 |       102 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         3000 |       102 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         3000 |       102 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         4000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         4000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         4000 |       102 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         4000 |       102 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         4000 |       102 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         4000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         4000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         4000 |       102 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         4000 |       102 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         4000 |       102 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         4000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         4000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         4000 |       102 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         4000 |       102 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         4000 |       102 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         4000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         4000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         4000 |       102 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         4000 |       102 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         4000 |       102 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         4000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         4000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         4000 |       102 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         4000 |       102 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         4000 |       102 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         5000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         5000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         5000 |       102 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         5000 |       102 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         5000 |       102 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         5000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         5000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         5000 |       102 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         5000 |       102 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         5000 |       102 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         5000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         5000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         5000 |       102 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         5000 |       102 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         5000 |       102 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         5000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         5000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         5000 |       102 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         5000 |       102 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         5000 |       102 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         5000 |       102 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         5000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         5000 |       102 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         5000 |       102 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         5000 |       102 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         1000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         1000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         1000 |       103 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         1000 |       103 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         1000 |       103 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         1000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         1000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         1000 |       103 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         1000 |       103 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         1000 |       103 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         1000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         1000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         1000 |       103 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         1000 |       103 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         1000 |       103 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         1000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         1000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         1000 |       103 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         1000 |       103 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         1000 |       103 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         1000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         1000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         1000 |       103 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         1000 |       103 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         1000 |       103 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         2000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         2000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         2000 |       103 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         2000 |       103 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         2000 |       103 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         2000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         2000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         2000 |       103 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         2000 |       103 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         2000 |       103 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         2000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         2000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         2000 |       103 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         2000 |       103 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         2000 |       103 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         2000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         2000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         2000 |       103 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         2000 |       103 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         2000 |       103 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         2000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         2000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         2000 |       103 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         2000 |       103 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         2000 |       103 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         3000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         3000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         3000 |       103 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         3000 |       103 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         3000 |       103 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         3000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         3000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         3000 |       103 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         3000 |       103 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         3000 |       103 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         3000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         3000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         3000 |       103 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         3000 |       103 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         3000 |       103 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         3000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         3000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         3000 |       103 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         3000 |       103 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         3000 |       103 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         3000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         3000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         3000 |       103 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         3000 |       103 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         3000 |       103 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         4000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         4000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         4000 |       103 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         4000 |       103 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         4000 |       103 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         4000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         4000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         4000 |       103 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         4000 |       103 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         4000 |       103 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         4000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         4000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         4000 |       103 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         4000 |       103 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         4000 |       103 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         4000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         4000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         4000 |       103 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         4000 |       103 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         4000 |       103 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         4000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         4000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         4000 |       103 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         4000 |       103 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         4000 |       103 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         5000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         5000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         5000 |       103 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         5000 |       103 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         5000 |       103 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         5000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         5000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         5000 |       103 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         5000 |       103 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         5000 |       103 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         5000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         5000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         5000 |       103 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         5000 |       103 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         5000 |       103 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         5000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         5000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         5000 |       103 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         5000 |       103 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         5000 |       103 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         5000 |       103 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         5000 |       103 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         5000 |       103 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         5000 |       103 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         5000 |       103 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         1000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         1000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         1000 |       104 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         1000 |       104 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         1000 |       104 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         1000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         1000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         1000 |       104 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         1000 |       104 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         1000 |       104 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         1000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         1000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         1000 |       104 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         1000 |       104 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         1000 |       104 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         1000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         1000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         1000 |       104 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         1000 |       104 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         1000 |       104 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         1000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         1000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         1000 |       104 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         1000 |       104 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         1000 |       104 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         2000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         2000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         2000 |       104 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         2000 |       104 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         2000 |       104 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         2000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         2000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         2000 |       104 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         2000 |       104 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         2000 |       104 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         2000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         2000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         2000 |       104 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         2000 |       104 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         2000 |       104 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         2000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         2000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         2000 |       104 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         2000 |       104 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         2000 |       104 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         2000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         2000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         2000 |       104 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         2000 |       104 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         2000 |       104 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         3000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         3000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         3000 |       104 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         3000 |       104 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         3000 |       104 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         3000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         3000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         3000 |       104 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         3000 |       104 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         3000 |       104 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         3000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         3000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         3000 |       104 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         3000 |       104 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         3000 |       104 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         3000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         3000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         3000 |       104 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         3000 |       104 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         3000 |       104 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         3000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         3000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         3000 |       104 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         3000 |       104 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         3000 |       104 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         4000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         4000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         4000 |       104 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         4000 |       104 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         4000 |       104 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         4000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         4000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         4000 |       104 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         4000 |       104 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         4000 |       104 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         4000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         4000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         4000 |       104 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         4000 |       104 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         4000 |       104 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         4000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         4000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         4000 |       104 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         4000 |       104 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         4000 |       104 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         4000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         4000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         4000 |       104 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         4000 |       104 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         4000 |       104 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         5000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         5000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         5000 |       104 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         5000 |       104 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         5000 |       104 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         5000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         5000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         5000 |       104 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         5000 |       104 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         5000 |       104 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         5000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         5000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         5000 |       104 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         5000 |       104 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         5000 |       104 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         5000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         5000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         5000 |       104 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         5000 |       104 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         5000 |       104 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         5000 |       104 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         5000 |       104 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         5000 |       104 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         5000 |       104 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         5000 |       104 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         1000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         1000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         1000 |       105 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         1000 |       105 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         1000 |       105 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         1000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         1000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         1000 |       105 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         1000 |       105 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         1000 |       105 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         1000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         1000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         1000 |       105 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         1000 |       105 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         1000 |       105 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         1000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         1000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         1000 |       105 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         1000 |       105 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         1000 |       105 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         1000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         1000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         1000 |       105 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         1000 |       105 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         1000 |       105 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         2000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         2000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         2000 |       105 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         2000 |       105 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         2000 |       105 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         2000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         2000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         2000 |       105 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         2000 |       105 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         2000 |       105 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         2000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         2000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         2000 |       105 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         2000 |       105 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         2000 |       105 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         2000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         2000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         2000 |       105 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         2000 |       105 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         2000 |       105 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         2000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         2000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         2000 |       105 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         2000 |       105 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         2000 |       105 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         3000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         3000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         3000 |       105 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         3000 |       105 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         3000 |       105 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         3000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         3000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         3000 |       105 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         3000 |       105 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         3000 |       105 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         3000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         3000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         3000 |       105 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         3000 |       105 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         3000 |       105 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         3000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         3000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         3000 |       105 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         3000 |       105 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         3000 |       105 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         3000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         3000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         3000 |       105 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         3000 |       105 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         3000 |       105 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         4000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         4000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         4000 |       105 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         4000 |       105 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         4000 |       105 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         4000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         4000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         4000 |       105 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         4000 |       105 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         4000 |       105 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         4000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         4000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         4000 |       105 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         4000 |       105 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         4000 |       105 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         4000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         4000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         4000 |       105 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         4000 |       105 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         4000 |       105 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         4000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         4000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         4000 |       105 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         4000 |       105 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         4000 |       105 |
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         5000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Anurima Chanda  |         5000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Anurima Chanda  |         5000 |       105 |
|       4 | Super zero       | Penguin books  | Anurima Chanda  |         5000 |       105 |
|       5 | Victory song     | Penguin books  | Anurima Chanda  |         5000 |       105 |
|       1 | As you like it   | Scholastic     | Amita sarni     |         5000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         5000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Amita sarni     |         5000 |       105 |
|       4 | Super zero       | Penguin books  | Amita sarni     |         5000 |       105 |
|       5 | Victory song     | Penguin books  | Amita sarni     |         5000 |       105 |
|       1 | As you like it   | Scholastic     | Deepa Agarwal   |         5000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Deepa Agarwal   |         5000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         5000 |       105 |
|       4 | Super zero       | Penguin books  | Deepa Agarwal   |         5000 |       105 |
|       5 | Victory song     | Penguin books  | Deepa Agarwal   |         5000 |       105 |
|       1 | As you like it   | Scholastic     | Jit chaudhari   |         5000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Jit chaudhari   |         5000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Jit chaudhari   |         5000 |       105 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         5000 |       105 |
|       5 | Victory song     | Penguin books  | Jit chaudhari   |         5000 |       105 |
|       1 | As you like it   | Scholastic     | Chitra Banarjee |         5000 |       105 |
|       2 | Akbar and Birbal | Scholastic     | Chitra Banarjee |         5000 |       105 |
|       3 | Rani laxmibai    | Scholastic     | Chitra Banarjee |         5000 |       105 |
|       4 | Super zero       | Penguin books  | Chitra Banarjee |         5000 |       105 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         5000 |       105 |
+---------+------------------+----------------+-----------------+--------------+-----------+
625 rows in set (0.00 sec)

mysql> lect B.book_id , B.title , B.publisher_name, A.author_name , c.no_of_copies , L.branch_id
    ->  from Book B , Book_aouther A , Book_copies c , library_branch L  ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'lect B.book_id , B.title , B.publisher_name, A.author_name , c.no_of_copies , L.' at line 1
mysql> lect B.book_id , B.title , B.publisher_name, A.author_name , c.no_of_copies , L.branch_id   from Book B , Book_aouther A , Book_copies c , library_branch L
    -> where  B.book_id =A.book_id and  B.book_id = c.book_id  and L.branch_id =c.Branch_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'lect B.book_id , B.title , B.publisher_name, A.author_name , c.no_of_copies , L.' at line 1
mysql> select B.book_id , B.title , B.publisher_name, A.author_name , c.no_of_copies , L.branch_id  from Book B , Book_aouther A , Book_copies c , library_branch L   where  B.book_id =A.book_id and  B.book_id = c.book_id  and L.branch_id =c.Branch_id;
+---------+------------------+----------------+-----------------+--------------+-----------+
| book_id | title            | publisher_name | author_name     | no_of_copies | branch_id |
+---------+------------------+----------------+-----------------+--------------+-----------+
|       1 | As you like it   | Scholastic     | Anurima Chanda  |         1000 |       101 |
|       2 | Akbar and Birbal | Scholastic     | Amita sarni     |         2000 |       102 |
|       3 | Rani laxmibai    | Scholastic     | Deepa Agarwal   |         3000 |       103 |
|       4 | Super zero       | Penguin books  | Jit chaudhari   |         4000 |       104 |
|       5 | Victory song     | Penguin books  | Chitra Banarjee |         5000 |       105 |
+---------+------------------+----------------+-----------------+--------------+-----------+
5 rows in set (0.03 sec)

mysql> select B.book_id , B.title , B.publisher_name, A.author_name , c.no_of_copies , L.branch_id  from Book B , Book_aouther A , Book_copies c , library_branch L   where  B.book_id =A.book_id and  B.book_id = c.book_id  and L.branch_id =c.Branch_id;

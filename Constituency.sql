create database parliment;

use parliment;

create table constiuency(
        conti_id int  primary key ,
         consti_name varchar(20) ,
          consti_state varchar(20) , 
           no_of_voters int );

create table party(
     pid int primary key,
     p_name varchar(20),
    p_symbol varchar(20)
);

create table candidate(
    cand_id int primary key,
    phone_no int  ,
    age int ,
    cand_name  varchar(20),
    state varchar(20),
    pid int references party(pid)
);

create table contest(
    const_id int references constiuency(conti_id),
    cand_id int references candidate(cand_id) 
    primary key (const_id,cand_id));
    create table contest(const_id  int references constiuency(conti_id),
    cand_id int references candidate(cand_id) , primary key (const_id,cand_id)
   );

create table voter (
     vid int primary key , v_name  varchar(20), v_age int , v_address varchar(20),
    canti_id int references constiuency (conti_id), cand_id int   references candidate(cand_id)
);


insert into constiuency values ( 111, 'Rajajinagar' , 'karanataka', 4);
insert into constiuency values ( 222, 'ramnagara' , 'kerala', 1);
insert into constiuency values(333, 'chittur' , 'andrapradesh',1);
insert into constiuency values (444, 'yalahank' ,'bengaluru' , 2);
insert into constiuency values(555, 'hebal', 'mysuru',2);

insert into party values (876, 'bjp' , 'louts');
insert into party values (877, 'congress' , 'hand');
insert into party values (878, 'jds' , 'women');
insert into party values (890, 'kvk' , 'elephant');
insert into party values (900, 'avks' , 'circle');

insert into candidate values (121 , 90199, 25 , 'shiva' ,'karanatka', 876);
insert into candidate values (131 , 87227, 30 , 'vikas' ,'kerala', 877);
insert into candidate values (141 , 99803, 20 , 'vishal' ,'delhi', 878);
insert into candidate values (151 , 56345, 18 , 'mallika' ,'mumbai', 890);
insert into candidate values (161 , 98786, 24 , 'chethan' ,'bombay', 900);

insert into contest values (111,121);
insert into contest values (222,131);
insert into contest values (333,141);
insert into contest values (444,151);
insert into contest values (555,161);

insert into voter values ( 100, 'thomas', 33 , 'kerala' , 111, 121);
insert into voter values ( 101, 'adison', 45 , 'bomby' , 222, 131);
insert into voter values ( 102, 'marco', 50 , 'vijayanagar' , 333, 141);
insert into voter values ( 103, 'boss', 60 , 'gadaga' , 444, 151);
insert into voter values ( 104, 'rama', 25 , 'kampli' , 555, 161);


select * from constiuency;
+----------+-------------+--------------+--------------+
| conti_id | consti_name | consti_state | no_of_voters |
+----------+-------------+--------------+--------------+
|      111 | Rajajinagar | karanataka   |            4 |
|      222 | ramnagara   | kerala       |            1 |
|      333 | chittur     | andrapradesh |            1 |
|      444 | yalahank    | bengaluru    |            2 |
|      555 | hebal       | mysuru       |            2 |
+----------+-------------+--------------+--------------+

mysql>  select * from party ;
+-----+----------+----------+
| pid | p_name   | p_symbol |
+-----+----------+----------+
| 876 | bjp      | louts    |
| 877 | congress | hand     |
| 878 | jds      | women    |
| 890 | kvk      | elephant |
| 900 | avks     | circle   |
+-----+----------+----------+

select * from contest;
+----------+---------+
| const_id | cand_id |
+----------+---------+
|      111 |     121 |
|      222 |     131 |
|      333 |     141 |
|      444 |     151 |
|      555 |     161 |
+----------+---------+

mysql> select * from candidate;
+---------+----------+------+-----------+-----------+------+
| cand_id | phone_no | age  | cand_name | state     | pid  |
+---------+----------+------+-----------+-----------+------+
|     121 |    90199 |   25 | shiva     | karanatka |  876 |
|     131 |    87227 |   30 | vikas     | kerala    |  877 |
|     141 |    99803 |   20 | vishal    | delhi     |  878 |
|     151 |    56345 |   18 | mallika   | mumbai    |  890 |
|     161 |    98786 |   24 | chethan   | bombay    |  900 |
+---------+----------+------+-----------+-----------+------+

select * from voter;
+-----+--------+-------+-------------+----------+---------+
| vid | v_name | v_age | v_address   | canti_id | cand_id |
+-----+--------+-------+-------------+----------+---------+
| 100 | thomas |    33 | kerala      |      111 |     121 |
| 101 | adison |    45 | bomby       |      222 |     131 |
| 102 | marco  |    50 | vijayanagar |      333 |     141 |
| 103 | boss   |    60 | gadaga      |      444 |     151 |
| 104 | rama   |    25 | kampli      |      555 |     161 |
+-----+--------+-------+-------------+----------+---------+

#MYSQL BUILTIN FUNCTIONS
show databases;
use sql_intro;

create table emp_details ( Name varchar (25), Age int, sex char(1), doj date, city varchar(15), salary float);
describe emp_details;

insert into emp_details
values ("A",20, "M","2025-12-1","AP",80);
select *from emp_details;
select distinct city from emp_details;
select count(name) from emp_details;
select count(name) as count_name from emp_details;
select sum(salary) from emp_details;
select avg(salary) from emp_details;
select name,age,city from emp_details;
select sex from emp_details where sex="M";
insert into emp_details
values ("A",20, "M","2025-12-1","AP",80),("E",24, "F","2025-12-31","AP",88),("D",24, "F","2025-12-5","KL",84),("B",20, "M","2025-11-1","KA",82),("C",20, "F","2025-12-2","TN",85);
select*from  emp_details;
select * from emp_details where city="KL" or city="TN";
select *from emp_details where doj between '2025-12-1' and '2025-12-5';
select * from emp_details where age<=20  and sex="M";
select sex, sum(salary) as total_salary from emp_details group by sex;
select * from emp_details order by salary desc;
select(20+30) as addition;
select length('India') as total_len;

#STRING FUNCTIONS
select upper("india") as u_C;
select lcase("IND") as L_C;
select character_length("manoj") as M_count;
select char_length("manoj") as M_count;
select concat("i" "am" "manoj") as merged;
select reverse('India');
select replace("MK","MK","manoj");
select length(rtrim("   MK   "));
select position("m" in "manoj")as name;
select ascii("a");
select ascii("4");

show databases;
use sql_intro;
create table employees ( Emp_id int primary key, Emp_name varchar(25), Age int, Gender char(1),  Doj date, Dept varchar(20), city varchar(15), Salary float);
describe employees;
insert into employees values(101,"A",35,"M","2005-10-1","sales","Ap",7000),
(103,"A",35,"M","2005-11-1","exe","tn",7000),
(102,"A",35,"F","2005-12-1","mng","Ap",7000);

select * from employees;
select distinct dept from employees;
select avg(age) from employees;

#Average age in each department
select dept, avg(age) from employees group by dept;
select dept,sum(salary) from employees group by dept;
select count(emp_id), city from employees group by city having count(emp_id)>100;
select year(doj) as year, count(emp_id) from employees group by year(doj);

create table sells (pro_id int, sale_price float, quantity int, state varchar(15));
insert  into sells values 
(121,320.0,3,"AP"),
(122,330.0,4,"TN"),
(123,331.0,5,"TS");
select*from sells;
select pro_id, sum(sale_price * quantity) as revenue from sells group_id group by pro_id;

create table c_product (p_id int ,c_p float);
insert into c_product values
(123,250.0),
(121,340.0);

#Lesson 4 - JOINS IN SQL
create database sql_joins;
show databases;
use sql_joins;

create table cricket( cricket_id int auto_increment, name varchar(10), primary key (cricket_id));
create table football(football_id int auto_increment, name varchar(10), primary key (football_id));
insert into cricket (name) values ('stuart'),('Michael'),('Johnson'),('hayden'),('fleming');
select * from cricket;
insert into football (name) values ('stuart'),('langer'),('Johnson'),('hayden'),('astle');
select * from football;
select * from cricket as c inner join football as f on c.name =f.name;
select c.cricket_id ,c.name ,f.football_id,f.name from cricket as c inner join football as f on c.name=f.name;
select * from cricket as c left join football as f on c.name =f.name where football_id is null;
select * from cricket as c right join football as f on c.name =f.name where cricket_id is null;
select * from cricket as c left join football as f on c.name =f.name;
select * from cricket as c right join football as f on c.name =f.name;

#lesson 5 - SUBQUERIES IN SQL
show databases;
use sql_intro;
show tables;
select * from employees;
select emp_name,dept,salary from employees where salary < (select avg(salary) from employees);
create table products ( prod_id int, item varchar(30),sell_price float, product_type varchar(30));
insert into products
values( 101,"jew" , 1800, "lux"),
(102, "Thsirt",100, "Non-lux"),
(103,"lap",1300,"lux"),
(104,"table",400,"non-lux");

select * from products;
create table orders ( order_id int, product_sold varchar(30), selling_price float);

insert into orders 
select prod_id , item, sell_price
from products where prod_id in 
(select prod_id from products where sell_price>1000); 

select * from orders;

#Lesson 6 - Triggers in SQL
create database triggers;
use triggers;
show tables;

# before insert trigger
create table customers
(cust_id int, age int, namee varchar(30));

delimiter //
create trigger age_verify
before insert on customers
for each row
if new.age < 0 then set new.age = 0;
end if; //

insert into customers
values(101,27,"james"),
(102,-40,"Amy"),
(103,32,"ben"),
(104, -39, "angela");

select * from customers;

#after insert trigger
create table customers1(
id int auto_increment primary key,
name varchar(40) not null,
email varchar(30),birthdate date);

create table message
id int auto_increment,
messageId int,
message varchar(300) not null,
primary key (id, messageId)); 

delimiter //
create trigger
check_null_dob
after insert
on customers1
for each row
begin
if new.birthdate is null then 
insert into message (messageId, message)
values (new.id, concat('hi',new.name,', please update your DOB,'));
end if;
end//
delimiter ;

insert into customers1 ( name , email,birthdate)
values("n","nancy@abc.com" ,  NULL ),
("A","aam@xyz.com", 1998-9-03);

select*from message;

#Interview Questions
select datediff( now(),"2021-10-21") as datedif








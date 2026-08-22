create database BankingDB333;
use BankingDB333;
create table Customers(
CustomerID int primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
age int not null,
creationdate date not null,
phone_number varchar(20) unique,
Gender varchar(20)
);
use bankingDB333;
create table Account(
AccountID int primary key,
IFSC_Code Varchar(50) not null,
Account_type Varchar(50) not null,
balance float,
customer_id int
);
create table Transactions(
Transaction_id int primary key,
Transaction_mode varchar(20) not null,
Amount float,
Transaction_date date not null,
Type Varchar(20)
);
create table Loans(
loan_id int primary key,
loan_type varchar(20),
Amount float,
loan_status varchar(20) 
);
create table Branch(
Branch_id int primary key,
Branch_name varchar(50) not null,
Branch_manager varchar(50) not null
);
Alter table Branch add column customer_id int;
Describe Branch;
describe Customers;
alter table Customers drop column Gender;
alter table Customers add column dateofbirth date not null;
alter table Customers add column location varchar(50) first;
alter table Customers modify column location varchar(50) after CustomerID;
alter table Customers modify column location varchar(100);
alter table Transactions add column customerid int;
describe Transactions;
#
create table transaction(
transactionid int primary key,
type varchar(50));
alter table transaction add column customerid int;              #Rename a table
rename table loans to loan;
show tables;
alter table loan rename column loan_type to loantype;            #Rename a column
alter table loan add column start_date date;
alter table loan add constraint chk_date check(start_date>"2026-08-17");
desc loan;
#Data Manipulation Language
#Insert
insert into loan(loan_id,start_date) values(101,"2026-08-22");
insert into loan(loan_id,start_date) values(102,"2026-08-23");
insert into loan(loan_id,start_date) values(103,"2026-08-28");
insert into loan(loan_id,start_date) values(104,"2026-08-30");
select * from loan;
desc customers;
insert into customers values(1,"dadar","Aryan","Chaurasia",21,"2026-08-18","1234567890","2005-03-12");
select * from customers; 
insert into customers values
(3,"sion","Mayur","desai",21,"2026-08-25","123357487","2005-01-01"),
(4,"Goregaon","Vaibhav","Sakre",20,"2026-08-25","7376232378","2005-02-10") ;
select * from customers;

alter table customers modify column location varchar(50) default "Mumbai";          #use of default

insert into customers values (5,default,"Aryan","Chaurasia",21,"2026-08-19","05944403484","2005-03-12"),
(2,"Dadar","Aniket","Mahajan",22,"2026-08-19","05944403989","2004-11-12");
show tables;
desc loan;
alter table loan add column customer_id int;
alter table loan add constraint fk_customers foreign key(customer_id) references customers(CustomerID);    #use of foreign key

update customers set phone_number ="9489498248" where CustomerID=1;   #use of update 

#delete
start transaction;
delete from customers where CustomerID= 2;
select * from customers;
rollback;     #it will return one step back  

#Null handling
select * from loan where customer_id is null;
select * from loan where customer_id is not null;
select *from customers;
select firstname,CustomerID,creationdate from customers where firstname like "A%";     #a% means start with A
select firstname,CustomerID,creationdate from customers where firstname like "%A%";    #%a# means start and ends with A
SELECT firstname ,age,phone_number from customers where firstname like "_R%";         # _ it skip the character
SELECT firstname ,age,phone_number from customers where phone_number like "_48%";
SELECT firstname ,age,phone_number from customers where phone_number like "__8%";
insert into account values(100,"sbi2334","saving","74484","747434");
insert into account values(101,"sbi23373","current","74488","74787");
insert into account values(102,"sbi2345","saving","744898","747848");
select AccountID,Balance,customer_id from account where balance>74000;
select * from account where Account_type ="saving" and balance >=74000;

select * from account order by balance desc;      # for finding highest 
select * from account order by balance desc limit 1;












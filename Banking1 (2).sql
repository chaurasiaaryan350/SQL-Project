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
insert into account values(103,"sbi2334","current","744834","747887");
insert into account values(104,"sbi23464","saving","744833","747866");
select AccountID,Balance,customer_id from account where balance>74000;
select * from account where Account_type ="saving" and balance >=74000;

select * from account order by balance desc;      # in descending order
select * from account order by balance desc limit 1;   #for finding highest
select * from branch;
insert into branch values ("1","sion","abc","002");
insert into branch values ("2","dadar","aryan","004");
insert into branch values ("3","goregaon","vaibhav","006");
insert into branch values ("4","bandra","shivam","007");
insert into branch values ("5","borivali","mayu","008");
select * from loan;
update loan set loantype ="home" where loan_id=104;
update loan set Amount ="40000" where loan_id=104;
update loan set loan_status ="completed" where loan_id=104;
update loan set customer_id = "5" where loan_id=104;
insert into transactions values("555","online","10000","2026-07-08","credit","561");
insert into transactions values("556","offline","8000","2026-07-08","credit","564");
insert into transactions values("557","online","9000","2026-07-10","debit","565");
insert into transactions values("558","offline","5000","2026-07-08","credit","568");
insert into transactions values("559","offline","15000","2026-09-08","debit","567");
use bankingdb333;
select * from loan order by Amount desc limit 1;    #highest amount
select * from loan order by Amount desc limit 1 offset 1;     #here offset is used for skiping the data
select * from customers;
select * from customers order by firstname;
select * from customers order by dateofbirth;

#loan offer
select * from account;
select * from account where balance between 70000 and 100000;
#top up loan
select* from loan;
select * from loan where Amount between 40000 and 60000;
 #In clause
 select * from account;
 #checking the membership
 select * from account where Account_type in ("saving","current");
 select * from account where Account_type in ("current");
 #highest amount account type wise
 select Account_type,max(balance) as Maximum_Balance from account group by Account_type;
 select Account_type,max(balance) as Maximum_Balance from account group by Account_type order by Maximum_Balance desc;  #for descending order
 #having
 select Account_type,max(balance) as Maximum_Balance from account group by Account_type 
 having Maximum_Balance>50000;
 
 select loantype, count(customer_id) as number_of_customers from loan group by loantype order by number_of_customers desc limit 1;
 
 select distinct(Account_type) from account;          #use of distinct
 
 select upper(firstname), lower(lastname), concat(firstname," ",lastname) as fullname from customers;
select * from account order by balance desc limit 1;
select * from transactions order by Amount desc limit 1;

#inbuilt functions in Mysql
#String function
select upper("dsda");
select upper(firstname) from customers limit 1;
select trim(upper("dsda"));
select left(firstname,2) from customers;
select right(firstname,3) from customers;
select concat(upper(left(firstname,1)),lower(firstname))
from customers;
select replace("dsda 333","333","321") as replaced_string;
select substr("dsda333",2,4);
update customers
set firstname=upper(firstname);
set sql_safe_updates=0;
select* from customers;

#Mathematical/Arithmetic
select 4+6, 5-6, 2*4, 6/2, 6%4;  #%>>mod
select * from account;
select Account_type,0.05*balance as interest from account where Account_type="saving";
select round(539.355,2), truncate(539.355,1);
select round(539.355,1);
select ceiling(539.353);   #it goes upto top value 
select floor(539.343);     #it goes upto lower value
select abs(-3), abs(3);    #absolute does not include signs
select power(2,4);

#Date
select now();
select current_date();
select sysdate();
select dayname(now()),day(now()),monthname(now());
select hour(now()),minute(now());

#Top N Analysis
Select *,rank() over (order by balance desc) as top_balance from account;
select *,dense_rank() over (order by balance desc) as top_balance from account;   #dense_rank is used for not skiping any rank
select *,dense_rank() over (partition by Account_type order by balance desc)  as ranking
from account; 

select *, percent_rank() over (order by balance ) from account;
select *, row_number() over (order by balance desc) as rows_num from account;
# Running total
select *,sum(balance) over (order by balance desc) as balance_num from account;  
use bankingdb333;
select balance,lead(balance) over (order by balance) as leading_balance from account;      #lead

select balance,lag(balance) over (order by balance) as lagging_balance from account;      #lag
 select *from customers;
 select c.firstname,a.balance from customers c join account a on c.CustomerID =a.customer_id;    #join
 update account set customer_id =3 where AccountID =103;

 select * from customers join loan  on customers.CustomerID =loan.customer_id where customers.CustomerID=3; 
select firstname,phone_number from customers join account on customers.CustomerID=account.customer_id where account.balance>5000;

select Account_type,count(CustomerID) from customers join account group by Account_type;
 select firstname,AccountID from customers left join account on customers.CustomerID =account.customer_id;     #left join

select firstname,AccountID from customers right join account on customers.CustomerID =account.customer_id;     #right join

select * from transactions;
select firstname,Amount from customers c left join transactions t on c.CustomerID=t.customerid;

select c.CustomerID,firstname,balance,Amount from customers c join account a on c.CustomerID=a.customer_id join transactions t on 
c.CustomerID=t.customerid;               #for joining 3 table

create view customer_details as                             #view
select firstname,phone_number from customers join account on customers.CustomerID=account.customer_id where account.balance>5000;

select * from customer_details;
#full outer join
select firstname,AccountID from customers left join account on customers.CustomerID =account.customer_id 
union 
select firstname,AccountID from customers right join account on customers.CustomerID =account.customer_id; 

#conditional statement
select balance,if(balance>744000,"minimum balance maintained","minimum balance not maintained") as minimum_balance from account;
select * from account;
select ifnull(phone_number,"not available") from customers;

#here case is use as a ifs
select AccountID,balance,
case
when balance<80000 then "minimum balance not maintain"
when balance<200000 then "eligible for 1% Discount"
when balance<800000 then "eligible for 2% Discount"
else "eligible for 3% Discount"
end as Interest_category
from account;
select * from account;
#subqueries
select balance from account order by balance desc limit 2;
select * from customers where CustomerID =(select customer_id from account where balance=744834);

select * from account where balance >(select avg(balance) from account);
select * from loan where Amount >(select min(Amount) from loan);
select * from account;
select CustomerID,firstname,lastname from customers where CustomerID in (select customer_id from account where balance>(select avg(balance) from account));
update account set customer_id =5 where customer_id=747848;
set sql_safe_updates=0;
select * from customers where CustomerID = (select customer_id from account where balance=(select max(balance) from account)); 














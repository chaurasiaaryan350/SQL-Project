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
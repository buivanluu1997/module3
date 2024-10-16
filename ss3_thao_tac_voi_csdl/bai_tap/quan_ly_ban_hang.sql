create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer (
id int auto_increment primary key,
name varchar(25),
age int 
);

create table `order` (
id int auto_increment primary key,
star_date date,
total_price int, 
customer_id int,
foreign key (customer_id) references customer(id)
)
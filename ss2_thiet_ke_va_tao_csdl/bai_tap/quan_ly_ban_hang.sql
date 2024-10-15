create database sales_management;

use sales_management;

create table customer (
customer_id varchar(30) primary key,
name varchar(50) not null,
age int
);

create table `order` (
order_id varchar(30) primary key,
order_date date,
total_price double,
customer_id varchar(30),
foreign key (customer_id) references customer (customer_id)
);

create table product (
product_id varchar(30) primary key,
name varchar(50),
price double
);

create table order_detail (
order_id varchar(30),
product_id varchar(30),
order_quantity int,
primary key(order_id, product_id),
foreign key (order_id) references `order` (order_id),
foreign key (product_id) references product (product_id)
);
 
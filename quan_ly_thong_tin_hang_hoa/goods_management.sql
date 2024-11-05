create database goods_management;
use goods_management;

create table categories(
id int auto_increment primary key,
name varchar(45)
);

create table products(
id int auto_increment primary key,
product_code varchar(45),
name varchar(45),
unit varchar(45),
price double,
harvest_day	date,
category_id int,
foreign key (category_id) references categories(id)
);

insert into categories (name) values ('Quả'),('Rau'),('Củ'),('Hoa');

insert into products(product_code,name,unit,price,harvest_day,category_id) values ('NHH-0001','Cà chua','kg',20000,'2023-10-23',1),
('NHH-0002','Rau muống','Bó',10000,'2023-10-23',2),('NHH-0003','Tỏi','kg',20000,'2023-10-23',3);

select p.id, p.product_code, p.name, p.unit, p.price, c.name as category_name, c.id as category_id, p.harvest_day
from products p
join categories c on p.category_id = c.id;

select c.id, c.name from categories c;

select p.id, p.product_code, p.name, p.unit, p.price, c.name as category_name, c.id as category_id, p.harvest_day
from products p
join categories c on p.category_id = c.id
where p.name like '%rau%';


create database if not exists quan_ly_ban_hang;
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
);

create table product (
id int auto_increment primary key,
name varchar(25),
price int 
);

create table order_detail (
order_id int,
product_id int,
quantity int,
primary key (order_id, product_id),
foreign key (order_id) references `order` (id),
foreign key (product_id) references product (id)
);

insert into customer (name, age) values ('Minh Quan', 10), ('Ngoc Oanh', 20), ('Hong Ha', 50);

insert into `order` (customer_id, star_date) values (1, '2006/3/21'), (2, '2006/3/23'), (1, '2006/3/16');

insert into product (name, price) values ('May Giat', 3), ('Tu Lanh', 5), ('Dieu Hoa', 7), ('Quat', 1), ('Bep Dien', 2);

insert into order_detail values (1,1,3), (1,3,7), (1,4,2), (2,1,1), (3,1,8), (2,5,4), (2,3,3);

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select od.id, od.star_date, od.total_price
from `order` od;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.name as customer_name, p.name as product_name
from customer c
inner join `order` o on c.id = o.customer_id
inner join order_detail od on o.id = od.order_id
inner join product p on od.product_id = p.id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.name, o.star_date, o.id as order_id
from customer c
left join `order` o on c.id = o.customer_id
where o.id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)

select o.id, o.star_date, sum(quantity * price) as total_price
from `order` o
inner join order_detail od on o.id = od.order_id
inner join product p on od.product_id = p.id
group by o.id;











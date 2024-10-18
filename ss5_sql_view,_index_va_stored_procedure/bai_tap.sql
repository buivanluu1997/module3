create database if not exists bai_tap_bai_5;
use bai_tap_bai_5;

create table products (
id int auto_increment primary key,
code varchar(45),
name varchar(45),
price double,
amount int,
`description` text,
`status` tinyint
);

insert into products(code, name, price, amount, `description`, `status`) values
('I014', 'IPhone 14 Promax', 1200, 10, 'Màu tím, 512Gb', 1),
('S010', 'SamSung Note 10', 800, 5, 'Màu trắng 1024Gb', 1),
('I015', 'IPhone 15 Promax', 1700, 10, 'Màu vàng sa mạc, 1024Gb', 1),
('X007', 'Xiaomi Redmi 7', 600, 4, 'Màu đen', 0),
('O005', 'Oppo A5', 500, 10, 'Màu xanh', 1);

select * from products;
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- trước khi tạo chỉ mục
explain select * from products where code = 'X007';
-- sau khi tạo chỉ mục
create unique index idx_code on products(code);
explain select * from products where code = 'X007';
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- trước khi tạo chỉ mục
explain select * from products where name = 'IPhone 15 Promax' and price = 1700;
-- sau khi tạo chỉ mục
create index idx_name_price on products(name, price);
explain select * from products where name = 'IPhone 15 Promax' and price = 1700;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as 
select code, name, price, `status`
from products;
-- Tiến hành sửa đổi view
create or replace view products_view as
select code, name, price, `description`, `status`
from products;

select * from products_view;
-- Tiến hành xoá view
drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter $$
create procedure get_all_products ()
begin 
select * from products;
end $$
delimiter ;
call get_all_products();

-- Tạo store procedure thêm một sản phẩm mới
delimiter $$
create procedure add_product (
in in_code varchar(45),
in in_name varchar(45),
in in_price double,
in in_amount int,
in in_description text,
in in_status tinyint(1))
begin
insert into products(code, name, price, amount, `description`, `status`)
values(in_code, in_name, in_price, in_amount, in_description, in_status);
end $$
delimiter ;

call add_product('I016', 'IPhone 16', 2000, 15, 'Màu trắng 512Gb', 1); 
select * from products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter $$
create procedure edit_product(
in in_id int,
in in_price double)
begin 
update products set price = in_price where id = in_id;
end $$
delimiter ;

call edit_product(3, 1400);
select * from products;

-- Tạo store procedure xoá sản phẩm theo id
delimiter $$
create procedure delete_product_id(
in in_id int)
begin 
delete from products where id = in_id;
end $$
delimiter ;

call delete_product_id(7);





create database if not exists book_management;

use book_management;

create table if not exists books (
id int auto_increment, 
name varchar(50),
page_size int,
author varchar(50),
primary key(id)
);

select * from book_management.books;

insert into books (name, page_size, author)
values ('Toán', 45, 'Nguyễn Thái Học'), ('Văn', 34, 'Trần Minh Hoàng'), 
('Sử', 56, 'Dương Trung Quốc'), ('Địa', 76, 'Lê Văn Hiến'), ('Hoá', 32, 'Hà Văn Minh');

update books set page_size = 50 where id = 3;
delete from books where id = 5;

alter table books add column(address varchar(200));


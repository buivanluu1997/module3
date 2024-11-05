create database quan_ly_hoc_sinh;
use quan_ly_hoc_sinh;

create table class(
id int auto_increment primary key,
name varchar(45) not null
);

create table student(
id int auto_increment primary key,
name varchar(45) not null, 
age int not null,
class_id int,
foreign key (class_id) references class(id)
);

insert into class(name) values ('12A1'), ('12A2'), ('12A3');

insert into student(name, age, class_id) values ('Hoang Ngoc Huy', 17 , 1), ('Nguyen Trong Hoag', 17 , 2), ('Tran Tuan Phuc', 17 , 3);

 select s.id, s.name, s.age, c.name as class_name
 from student s 
 join class c on s.class_id = c.id;
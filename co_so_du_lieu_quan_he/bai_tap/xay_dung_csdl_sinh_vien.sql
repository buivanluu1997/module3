create database if not exists student_management;

use student_management;

create table if not exists student(
id int auto_increment, 
name varchar(50),
age int,
country varchar(50),
primary key (id)
);
select * from student_management.student;

insert into student(name, age, country) values ('Lưu', 27, 'Huế');
insert into student(name, age, country) values ('Hưng', 26, 'Quảng Nam');
insert into student(name, age, country) values ('Phương', 26, 'Quảng Nam');
insert into student(name, age, country) values ('Minh', 30, 'Đà Nẵng');

update student set age = 35 where id = 3;

delete from student where id = 1;
delete from student where id = 5;
delete from student where id = 6;
delete from student where id = 7;
delete from student where id = 8;
delete from student where id = 9;
delete from student where id = 10;
delete from student where id = 11;
delete from student where id = 12;


create table if not exists class(
id int,
name varchar(30),
primary key (id)
);

select * from class;

insert into class (id, name) 
values (1, '12A1'), (2, '12A2');

delete from class where id = 1;

insert into class (id, name) values (3, '12A3');

update class set name = '12A5' where id = 3;



create table if not exists teacher(
id int primary key auto_increment,
name varchar(50),
age int,
country varchar(50)
);

select * from student_management.teacher;

insert into teacher (name, age, country) 
values ('Hoang', 45, 'Ha Noi'), ('Huy', 50, 'Ho Chi Minh'), ('Nam', 55, 'Quang Binh');

update teacher set name = 'Hung' where id = 2;

delete from teacher where id = 3;












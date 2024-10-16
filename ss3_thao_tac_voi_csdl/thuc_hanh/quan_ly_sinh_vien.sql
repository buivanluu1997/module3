create database if not exists quan_li_sinh_vien;
use quan_li_sinh_vien;

create table class (
id int auto_increment primary key,
name varchar(30) not null,
star_date date,
status boolean
);

create table student(
id int auto_increment primary key,
name varchar(30) not null,
address varchar(30) not null,
phone_number varchar(10),
status boolean,
class_id int,
foreign key (class_id) references class (id)
);

create table `subject` (
id int auto_increment primary key,
name varchar(30) not null,
credit int,
status boolean
);

create table mark (
id int auto_increment primary key,
sub_id int,
student_id int,
mark int, 
exam_times int,
unique (sub_id, student_id),
foreign key (sub_id) references `subject` (id),
foreign key (student_id) references student (id)
);

select * from class;
insert into class (name, star_date, status) values ('A1', '2008-12-20', 1), ('A2', '2008-12-22', 1), ('B3', current_date, 0);

select * from student;
insert into student (name, address, phone_number, status, class_id) values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (name, address, status, class_id) values ('Hoa', 'Hai Phong', 1, 1);
insert into student (name, address, phone_number, status, class_id) values ('Manh', 'Ho Chi Minh', '0123123123', 0, 2);

insert into `subject` (name, credit, status) values ('CF', 5, 1), ('C', 6, 1), ('HDJ', 5, 1), ('RDBMS', 10, 1);

insert into mark (sub_id, student_id, mark, exam_times) values (1,1,8,1), (1,2,10,2), (2,1,12,1);

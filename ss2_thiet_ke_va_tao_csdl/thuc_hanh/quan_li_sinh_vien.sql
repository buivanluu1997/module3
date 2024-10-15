create database student_management;

use student_management;

create table class(
id int auto_increment primary key,
name varchar(60) not null,
star_date datetime not null,
status bit
);

create table student (
id int auto_increment primary key,
name varchar(30) not null,
address varchar(50),
phone varchar(30),
status bit,
class_id int not null,
foreign key (class_id) REFERENCES Class (id)
);

create table `subject`(
id int auto_increment primary key,
name varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
status bit default 1
);

create table mark(
id int auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
unique (sub_id, student_id),
foreign key(sub_id) references `subject`(id),
foreign key(student_id) references student(id)
);

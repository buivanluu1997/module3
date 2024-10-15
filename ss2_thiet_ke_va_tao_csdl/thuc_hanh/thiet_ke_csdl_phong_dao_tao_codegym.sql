create database if not exists center_codegym;

use center_codegym;

create table jame(
username varchar(50) primary key,
`password` varchar(50)
);

create table class(
id int auto_increment primary key,
name varchar(50) unique
);

create table room(
id int auto_increment primary key,
name varchar(50),
class_id int,
foreign key (class_id) references class(id)
);

create table student(
id int auto_increment primary key,
name varchar(50),
birthday date, 
gender boolean,
email varchar(50),
point decimal(5,2),
jame_username varchar(50),
class_id int 
);

alter table student add foreign key (jame_username) references jame(username);
alter table student add foreign key (class_id) references class(id);

create table instructor(
id int auto_increment primary key,
name varchar(50),
birthday date,
salary double
);

-- quan hệ n - n thêm bảng thứ 3

create table instructor_class(
instructor_id int,
class_id int,
star_time date,
primary key(instructor_id, class_id),
foreign key (instructor_id) references instructor(id),
foreign key (class_id) references class(id)
);

insert into jame (username, `password`) values ('cunn','123'), ('chunglh','123'), ('hoanhh','123'),('dungd','123'),('huynhtd','123'),
('haimn','123'),('namtv','123'),('hieuvm','123'),('kynx','123'),('vulm','123');

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');

insert into room (name, class_id) values ('ken', 1), ('Jam', 1),('Ada', 2),('Jimmy', 2);

insert into student(name, birthday, gender, email, point, jame_username, class_id)
values ('Nguyen Ngoc Cu', '1981-12-12', 1, 'cunn@gmail.com', 8, 'cunn', 1),
('Le Hai Chung', '1981-12-12', 1, 'chunglh@gmail.com', 5, 'chunglh', 1),
('Hoang Huu Hoang', '1990-12-12', 1, 'hoangh@gmail.com', 6, 'hoanhh', 2),
('Dau Dung', '1987-12-12', 1, 'dungd@gmail.com', 8, 'dungd', 1),
('Ta Dinh Huynh', '1981-12-12', 1, 'huynhtd@gmail.com', 9, 'huynhtd', 2),
('Nguyen Minh Hai', '1987-12-12', 1, 'haim@gmail.com', 9, 'haimn', 1),
('Tran Van Nam', '1989-12-12', 1, 'namtv@gmail.com', 4, 'namtv', 2),
('Vo Minh Hieu', '1981-12-12', 1, 'hieuvm@gmail.com', 3, 'hieuvm', 1),
('Le Xuan Ky', '1981-12-12', 1, 'kylx@gmail.com', 7, 'kynx', 2),
('Le Minh Vu', '1981-12-12', 1, 'vu@gmail.com', 7, 'vulm', 1),
('Nguyen Van A', '1981-12-12', 1, 'anv@gmail.com', 8, null, null ),
('Tran Van B', '1981-12-12', 1, 'bvt@gmail.com', 5, null, null );

insert into instructor(name, birthday, salary) 
values ('Tran Van Chanh', '1985-3-2', 100), ('Tran Minh Chien', '1985-3-2', 200), ('Vu Thanh Tien', '1985-3-2', 300), ('Tran Van Nam', '1989-12-12', 200);

insert into instructor_class(instructor_id, class_id) values (1, 1), (1,2),(1,3),(2,1),(2,2),(2,3);



  
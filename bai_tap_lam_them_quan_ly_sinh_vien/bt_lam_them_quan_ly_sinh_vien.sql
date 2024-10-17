create database bt_lam_them_quan_ly_sinh_vien;

use bt_lam_them_quan_ly_sinh_vien;

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

-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select s.*, c.name as class_name
from student s
inner join class c on s.class_id = c.id;

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào, kể cả chưa học lớp nào.
select s.*, c.name as class_name
from student s
left join class c on s.class_id = c.id;

-- 3. Lấy thông tin của các học viên tên 'nguyen minh hai'.
select * from student where name = 'Nguyen Minh Hai';

-- 4. Lấy ra học viên có họ là “nguyen”
select * from student where name like 'nguyen %';

-- 5. Lấy thông tin của các học viên tên 'hai' hoặc 'huynh’.
select * from student where name like '% Hai' or name like '% Huynh';

-- 6. Lấy ra các học viên có điểm lớn hơn 5 .
select * from student where point > 5;

-- 7. lấy ra thông tin các học viên có điểm 4,6,8
select * from student where point in (4,6,8);

-- 8. Thông kế số lượng học sinh theo từng loại điểm.
select point, count(id) as student_count
from student 
group by point;

-- 9 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select point, count(id) as student_count from student where point > 5 group by point;

-- 10. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select point, count(id) as student_count from student where point > 5 group by point having count(id) >=2;

-- 11. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp  học viên theo point giảm dần
select s.*, c.name as class_name
from student s
left join class c on s.class_id = c.id
where c.name = 'c1121g1'
order by point desc;

-- BÀI 4: CÁC HÀM THÔNG DỤNG TRONG SQL
-- 1.Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
select c.name, count(s.id) student_count
from class c
left join student s on c.id = s.class_id
group by c.name;

-- 2. Tính điểm lớn nhất của mỗi các lớp
select c.name, max(s.point) as max_point
from class c
left join student s on c.id = s.class_id
group by c.name;

-- 3. Tình điểm trung bình  của từng lớp
select c.name, avg(s.point) as average_point
from class c
left join student s on c.id = s.class_id
group by c.name;

-- 4. Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.
select instructor.name, instructor.birthday from instructor
union
select student.name, student.birthday from student;

-- 5. Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select * from student order by point desc limit 3;

-- 6. Lấy ra các học viên có điểm số là cao nhất của trung tâm.
select * from student
where point = (select max(point) from student);

-- 7. lấy ra tất cả các giảng viên chưa từng tham gia giảng dạy
select i.*
from instructor i 
left join instructor_class ic on i.id = ic.instructor_id
where ic.instructor_id is null;





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

-- THỰC HÀNH
-- Hiển thị danh sách tất cả các học viên
select * from student;

-- Hiển thị danh sách các học viên đang theo học.
select * from student
where status = true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select * from `subject`
where credit < 10;

-- Hiển thị danh sách học viên lớp A1
select student.*, class.name as class_name
from student
inner join class on student.class_id = class.id
where class.name = 'A1';

-- Hiển thị điểm môn CF của các học viên.
select student.*, mark.mark, `subject`.name as sub_name
from student
inner join mark on student.id = mark.student_id 
inner join `subject` on mark.sub_id = `subject`.id
where `subject`.name = 'CF';

-- BÀI TẬP 
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student.name like 'h%'; 

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(star_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 5-6
select * from `subject` where credit between 5 and 6;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set class_id = 2 where id = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
-- nếu trùng sắp theo tên tăng dần.
select s.name as student_name, sub.name as sub_name, m.mark
from student s
inner join mark m on s.id = m.student_id
inner join `subject` sub on m.sub_id = sub.id
order by m.mark desc, s.name asc; 

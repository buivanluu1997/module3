create database if not exists test_quan_ly_ban_hang;
use test_quan_ly_ban_hang;

create table khach_hang(
khach_hang_id int auto_increment primary key,
ten_khach_hang varchar(45) not null,
tuoi_khach_hang int);

create table don_hang(
don_hang_id int auto_increment primary key,
ngay_mua_hang date,
tong_tien double,
khach_hang_id int,
foreign key(khach_hang_id) references khach_hang(khach_hang_id)
);

create table san_pham(
san_pham_id int auto_increment primary key,
ten_san_pham varchar(45) not null,
gia_san_pham double not null	
);

create table chi_tiet_don_hang(
don_hang_id int,
san_pham_id int,
so_luong int not null,
primary key(don_hang_id,san_pham_id),
foreign key(don_hang_id) references don_hang(don_hang_id),
foreign key(san_pham_id) references san_pham(san_pham_id)
);

insert into khach_hang(ten_khach_hang,tuoi_khach_hang) values ('Minh Quan', 10),('Ngoc Oanh', 20),('Hong Ha', 50);
insert into don_hang(ngay_mua_hang,tong_tien,khach_hang_id) values('2006-03-21',null,1),('2006-03-23',null,2),('2006-03-16',null,1);
insert into san_pham(ten_san_pham,gia_san_pham) values ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);
insert into chi_tiet_don_hang(don_hang_id,san_pham_id,so_luong) values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8);

select kh.*, dh.ngay_mua_hang
from khach_hang kh
join don_hang dh on kh.khach_hang_id = dh.khach_hang_id;
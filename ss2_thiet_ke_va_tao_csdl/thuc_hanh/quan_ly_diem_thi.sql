create database if not exists quan_ly_diem_thi;

use quan_ly_diem_thi;

create table hoc_sinh(
ma_hocsinh varchar(20) primary key,
ten_hocsinh varchar(50),
ngay_sinh date,
lop varchar(20),
gioi_tinh varchar(20)
);

create table mon_hoc(
ma_monhoc varchar(20) primary key,
ten_monhoc varchar(50),
ma_giaovien varchar(20)
);

create table bang_diem(
ma_hocsinh varchar(20),
ma_monhoc varchar(50),
diemthi int,
ngay_kiemtra date,
primary key ( ma_hocsinh, ma_monhoc),
foreign key (ma_hocsinh) references hoc_sinh(ma_hocsinh),
foreign key (ma_monhoc) references mon_hoc(ma_monhoc)
);

create table giao_vien(
ma_giaovien varchar(20) primary key,
ten_giaovien varchar(20),
sdt varchar(10)
);

alter table mon_hoc add foreign key (ma_giaovien) references giao_vien(ma_giaovien);

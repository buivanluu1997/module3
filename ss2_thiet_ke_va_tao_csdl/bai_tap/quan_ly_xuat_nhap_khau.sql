create database quan_ly_xuat_nhap_khau;

use quan_ly_xuat_nhap_khau;

create table nha_cung_cap(
ma_ncc varchar(30) primary key,
ten_ncc varchar(50),
dia_chi varchar(60)
);

create table so_dien_thoai(
id int auto_increment primary key,
sdt varchar(15),
ma_ncc varchar(30),
foreign key (ma_ncc) references nha_cung_cap ( ma_ncc)
);

create table don_dat_hang(
so_dat_hang int primary key,
ngay_dat_hang date,
ma_ncc varchar(30),
foreign key(ma_ncc) references nha_cung_cap (ma_ncc)
);

create table vat_tu(
ma_vat_tu varchar(30) primary key,
ten_vat_tu varchar(30)
);

create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);

-- quan he n-n (don dat hang va vat tu)
create table chi_tiet_don_dat_hang (
so_dat_hang int,
ma_vat_tu varchar(30),
primary key ( so_dat_hang, ma_vat_tu),
foreign key(so_dat_hang) references don_dat_hang(so_dat_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

-- quan he n-n (phieu xuat va vat tu)
create table chi_tiet_phieu_xuat(
so_phieu_xuat int,
ma_vat_tu varchar(30),
don_gia_xuat double,
so_luong_xuat int,
primary key(so_phieu_xuat, ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat (so_phieu_xuat),
foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);

-- quan he n-n (phieu nhap va vat tu)
create table chi_tiet_phieu_nhap(
ma_vat_tu varchar(30),
so_phieu_nhap int,
don_gia_nhap double,
so_luong_nhap int,
primary key(ma_vat_tu, so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu (ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap (so_phieu_nhap)
);


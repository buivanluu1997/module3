create database if not exists quan_ly_xuat_nhap_khau;
use quan_ly_xuat_nhap_khau;

create table so_dien_thoai (
ma_sdt int auto_increment primary key,
so_dien_thoai varchar(15)
);
create table nha_cc (
ma_ncc int auto_increment primary key,
ten_ncc varchar(45),
dia_chi varchar(45),
ma_sdt int,
foreign key (ma_sdt) references so_dien_thoai (ma_sdt)
);
create table don_dat_hang (
so_don_hang int auto_increment primary key,
ngay_dat_hang date,
ma_ncc int,
foreign key(ma_ncc) references nha_cc (ma_ncc)
);
create table vat_tu (
ma_vat_tu int auto_increment primary key,
ten_vat_tu varchar(45)
);
create table chi_tiet_don_dat_hang (
so_don_hang int,
ma_vat_tu int,
so_luong int,
primary key (so_don_hang,ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table phieu_xuat (
so_phieu_xuat int auto_increment primary key,
ngay_xuat date
);
create table chi_tiet_phieu_xuat (
don_gia_xuat double,
so_luong_xuat int,
so_phieu_xuat int,
ma_vat_tu int,
primary key (so_phieu_xuat,ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table phieu_nhap (
so_phieu_nhap int auto_increment primary key,
ngay_nhap date
);
create table chi_tiet_phieu_nhap (
don_gia_nhap double,
so_luong_nhap int,
ma_vat_tu int,
so_phieu_nhap int,
primary key(ma_vat_tu, so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu (ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap (so_phieu_nhap)
);





create database demo_user;

use demo_user;

create table users (
id int auto_increment primary key,
name varchar(150) not null,
email varchar(150) not null,
country varchar(150) not null
);

insert into users(name, email, country) values ('Minh','minh234@gmail.com','Viet Nam'), ('Kante','kante11@gmail.com','Indonesia');

create database quan_li_user;

use quan_li_user;

create table users (
id int auto_increment primary key,
name varchar(150) not null,
email varchar(150) not null,
country varchar(150) not null
);

insert into users(name, email, country) values ('Minh','minh234@gmail.com','Viet Nam'), ('Kante','kante11@gmail.com','Indonesia');

delimiter //
create procedure get_all_users()
begin
select users.* from users;
end //
delimiter ;


delimiter //
create procedure insert_user(in user_name varchar(50), in user_email varchar(50), in user_country varchar(50))
begin
insert into users(name, email, country) values (user_name, user_email, user_country);
end //
delimiter ;


delimiter //
create procedure get_user_by_id(in user_id int)
begin 
select users.name, users.email, users.country
from users
where users.id = user_id;
end //
delimiter ;


delimiter //
create procedure delete_user(in user_id int)
begin
delete from users where users.id = user_id;
end //
delimiter ;

delimiter //
create procedure update_user(in user_id int, in user_name varchar(50), in user_email varchar(50), in user_country varchar(50))
begin
update users set name=user_name, email=user_email, country=user_country where id=user_id;
end //
delimiter ;



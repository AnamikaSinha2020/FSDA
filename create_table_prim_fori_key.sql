create database key_prim
use key_prim

create table ineuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(60),
number_of_enro int,
primary key(course_id));

insert into ineuron values(01 , 'FSDA','active',100);
insert into ineuron values(02 , 'FSDs','not-actrive',100);
select * from ineuron

create table student_ineuron(
student_id int,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references ineuron(course_id))

insert into student_ineuron values(101 , 'fsda','test@gmail.com','active',05)

insert into student_ineuron values(101 , 'fsda','test@gmail.com','active',01)
insert into student_ineuron values(101 , 'fsda','test@gmail.com','active',01)

select * from student_ineuron

create table payment(
course_name varchar(60),
course_id int,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id))


insert into payment value('fsda',01,'not-active','7th-aug')


create table class(
course_id int,
class_name varchar(60),
class_topic varchar(60),
class_duration int,
primary key(course_id),
foreign key(course_id) references ineuron(course_id))


create table test(
id int not null , 
name varchar(60),
email_id varchar(60),
mobile_no varchar(9),
address varchar(50))

alter table test add primary key(id)

alter table test drop primary key

alter table test add constraint test_prim primary key(id , email_id)

create table parent(
id int not null,
primary key(id))

create table child(
id int,
parent_id int,
foreign key(parent_id ) references parent(id))

insert into parent values(1)
insert into child values(1,1)
insert into child values(1,2)
select * from parent
delete from parent where id=1
delete from child where id=1

drop table child

create table child(
id int,
parent_id int,
foreign key(parent_id ) references parent(id) on update cascade)


create table child1(
id int,
parent_id int,
foreign key(parent_id ) references parent(id) on update cascade on delete cascade)


select * from parent
insert into parent values(2)
insert into child values(1,1),(1,2),(3,2),(2,2)

select * from child
update parent set id =3 where id=2
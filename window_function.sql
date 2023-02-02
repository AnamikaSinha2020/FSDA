create database window_function
use window_function

create table ineuron_students(
student_id int ,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int ,
student_mail_id varchar(50));

insert into ineuron_students values
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com');


select * from ineuron_students;
select student_batch, sum(students_marks) from ineuron_students group by student_batch;
select student_batch, min(students_marks) from ineuron_students group by student_batch;
select student_batch, max(students_marks) from ineuron_students group by student_batch;
select count(student_batch) from ineuron_students;
select count(*) from ineuron_students;
select count(distinct student_batch) from ineuron_students;
select student_batch, count(*) from ineuron_students group by student_batch;

select * from ineuron_students where student_batch ='fsda' order by students_marks desc limit 0,1;


select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 1,1;

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 2,2;

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 2,3;
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 3, 1;
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 4 , 1;
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 5 , 1;
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 6 , 1;

select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 3, 3;
select * from ineuron_students where student_batch = 'fsda' order by students_marks desc limit 3;

select * from ineuron_students where students_marks =(
select min(students_marks) from 
(select students_marks from ineuron_students 
where student_batch ="fsda"
order by students_marks desc
limit 3 ) as top);

select students_marks from ineuron_students 
where student_batch ="fsda" order by students_marks desc limit 3;

select * from ineuron_students;


select * from
(select student_id,student_batch,student_stream,students_marks,
row_number() over(partition by student_batch order by students_marks desc) as `row_number`
 from ineuron_students) as test where `row_number`=1;
 
 select student_id,student_batch,student_stream,students_marks,
 row_number() over(partition by student_batch order by students_marks desc) as `row_number`,
rank() over(partition by student_batch order by students_marks desc) as `row_rank`
 from ineuron_students;
 
  
 select student_id,student_batch,student_stream,students_marks,
 row_number() over(partition by student_batch order by students_marks desc) as `row_number`,
rank() over(partition by student_batch order by students_marks desc) as `row_rank`
 from ineuron_students;
 
 
 select student_id,student_batch,student_stream,students_marks,
 row_number() over( order by students_marks desc) as `row_number`,
rank() over(order by students_marks desc) as `row_rank`,
dense_rank() over( order by students_marks desc) as `dense_rank`
 from ineuron_students;
 
 
 -- second heighest rank in each batch
 select * from (select student_id,student_batch,student_stream,students_marks,
 row_number() over(partition by student_batch  order by students_marks desc) as `row_number`,
rank() over(partition by student_batch order by students_marks desc) as `row_rank`,
dense_rank() over(partition by student_batch  order by students_marks desc) as `dense_rank`
 from ineuron_students) as test where `dense_rank`=3;
 
  select * from (select student_id,student_batch,student_stream,students_marks,
 row_number() over(partition by student_batch  order by students_marks desc) as `row_number`,
rank() over(partition by student_batch order by students_marks desc) as `row_rank`,
dense_rank() over(partition by student_batch  order by students_marks desc) as `dense_rank`
 from ineuron_students) as test where `dense_rank`in(3,1,2);

















#create a database and use it
create database sales;
use sales;

#create table
CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1;
select count(*) from sales1;
# showcase data in a specified format
select order_date_new , DATE_FORMAT(order_date_new, "%W %M %e %Y") from sales1;


#Add a new column to the table

alter table sales1 
add column order_date_new date after order_date;

#updating values to the new added column

update sales1 
set order_date_new = str_to_date(order_date, '%c/%e/%Y');

alter table sales1 
add column ship_date_new date after ship_date;

update sales1 
set ship_date_new = str_to_date(ship_date,'%c/%e/%Y');

select * FROM sales1 s WHERE ship_date_new ='2011-01-05';
select now()
select CURTIME() 
select CURDATE() 

select CURDATE(), date_sub(CURDATE() , interval 1 week)
select * from sales1 where ship_date_new < DATE_SUB(curdate(), interval 5 year) 

alter table sales1 
add column flag date after order_id

update sales1 
set flag= now()

alter table sales1 
modify column year datetime;

alter table sales1 
modify column year_new int;
alter table sales1 
modify column day_new int;
alter table sales1 
modify column month_new int;
alter table sales1 
add column discount_flag varchar(20) after discount ;


update sales1 set year_new=year(order_date_new)
update sales1 set month_new = month(order_date_new)
update sales1 set day_new=day(order_date_new)
select * from sales1 limit 5
select year_new, avg(sales) from sales1 group by year_new 
select year_new, sum(sales) from sales1 group by year_new 
select year_new, min(sales) from sales1 group by year_new 
select year_new, max(sales) from sales1 group by year_new 

select year_new, sum(quantity) from sales1 s group by year_new;
select (sales*discount+shipping_cost) as CTC from sales1

#applying if conditio on a COLUMN 
select order_id ,discount , if(discount > 0, 'yes','no') as discount_flag from sales1

#count of item with statement and without discount
update sales1 
set discount_flag

select discount_flag,count(*) from sales1 s group by discount_flag

update sales1 
set discount_flag = if(discount > 0, 'yes','no')
select discount_flag, count(*) from sales1 group by discount_flag 









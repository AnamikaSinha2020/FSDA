use sales
select * from sales1

create function add_to_col(a INT)
returns int
DETERMINISTIC
begin
	declare b int ;
	set b = a + 10 ;
	return b ;
end

select add_to_col(15);

select * from sales1
select quantity +10 from sales1

select quantity, add_to_col(quantity) from sales1



create function final_profits(profit int, discount int)
returns int
Deterministic
begin
	declare final_profit int;
set final_profit = profit - discount;
return final_profit;
end


create function final_profits_real(profit decimal(20,6), discount decimal(20,6), sales int)
returns int
Deterministic
begin
	declare final_profit int;
set final_profit = profit - sales * discount;
return final_profit;
end


create function int_to_str(a int)
returns varchar(30)
Deterministic
begin
declare b varchar(30);
set b =a ;
return b;
end

drop function mark_sales

create function mark_sales(sales int)
returns varchar(30)
Deterministic
begin
	declare flag_sales varchar(30);
	IF SALES <=100 then 
		set flag_sales = "super affordable product";
		
	elseif sales >100 and sales <300 then
		set flag_sales = "affordable product";
		
	elseif sales >300 and sales <600 then
		set flag_sales = "moderate price";
	
	ELSE set flag_sales = "expensive";	
	
	end IF ;
		return flag_sales;
end



select profit, discount, final_profits(profit,discount) from sales1;
select profit, discount,sales, final_profits_real(profit,discount,sales) from sales1;
select int_to_str(45);
select * from sales1;
select quantity,int_to_str(quantity) from sales1

select mark_sales(100);
select sales,mark_sales(sales) from sales1;


create table loop_table(val int)


create procedure insert_data()
begin
set @var =10;
generate_data : loop
insert into loop_table values(@var);

	set @var= @var + 1;
	if @var = 100 THEN 
	leave generate_data;
	end if;
end loop generate_data;
end



alter table loop_table 
add div_by_3 int

create procedure insert_data_div3()
begin
	set @var =1;
generate_data : loop
	if @var % 3= 0 then
	update loop_table set div_by_3 = @var;
	set @var = @var +1;
		if @var =100 then
			leave generate_data;
		end if;
	end if;
end loop generate_data;
end

select * from loop_table lt 
call insert_data_div3()

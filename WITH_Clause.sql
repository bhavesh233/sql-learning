
create table sales(
		
	store_id int,
	store_name varchar(50),
	product varchar(50),
	quantity int,
	store_cost real
	
)


insert into sales (store_id,store_name,product,quantity,store_cost) values 
(1,'Apple Originals 1','iPhone 12 Pro',1,1000),
(1,'Apple Originals 1','MacBook pro 13',3,2000),
(1,'Apple Originals 1','Airpods pro',2,280),

(2,'Apple Originals 2','iPhone 12 Pro',2,1000),

(3,'Apple Originals 2','iPhone 12 Pro',3,1000),
(3,'Apple Originals 3','MacBook pro 13',2,2000),
(3,'Apple Originals 3','MacBook air',1,1100),
(3,'Apple Originals 3','iPhone 12',3,1000),
(3,'Apple Originals 3','Airpods pro',2,280),

(4,'Apple Originals 2','iPhone 12 Pro',2,1000),
(4,'Apple Originals 2','MacBook pro 13',2,2500)


select * from sales s 

select store_id, sum(store_cost) as total_sales_per_store
from sales s group by s.store_id 

select avg(total_sales_per_store) from (
	select store_id, sum(store_cost) as total_sales_per_store
	from sales s group by s.store_id 
) x


select * 
from (	select store_id, sum(store_cost) as total_sales_per_store
		from sales s group by s.store_id 
	 ) total_sales
join (select cast(avg(total_sales_per_store) as int) as avg_sales_for_all_stores from (
		select s.store_id, sum(store_cost) as total_sales_per_store
		from sales s group by s.store_id 
			)x ) avg_sales
	on total_sales.total_sales_per_store > avg_sales. avg_sales_for_all_stores
	
	

	with Total_sales(store_id, total_sales_per_store) as 
			(select store_id, sum(store_cost) as total_sales_per_store 
			  from sales s group by s.store_id), 
			
		avg_sales(avg_sales_for_all_stores)	as 
			(select cast(avg(total_sales_per_store) as int)	as avg_sales_for_all_stores 
				from Total_sales )
	select * from Total_sales ts
	join avg_sales av 
	on ts.total_sales_per_store > av.avg_sales_for_all_stores
	











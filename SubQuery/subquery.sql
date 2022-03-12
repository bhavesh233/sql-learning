select paid, count(*)
from orders
group by paid


select u.first_name,u.last_name,o.paid
from orders o 
join users u 
on o.user_id = u.id

select * 
from products 
order by price desc

select *
from products 
order by price,weight desc; 

-- skip first 40 records
select * 
from  users 
offset 40 

-- gives 41 and 42 result 
select * 
from  users 
offset 40 limit 2

select * 
from products 
order by price desc
limit 5


-- union keyword

(	select * 
	from products 
	order by price desc 
	limit 4
)	
union all
(
	select * 
	from products 
	order by price/weight desc
	limit 4
)


/*
 	* show only duplicate value 
*/
(	select * 
	from products 
	order by price desc 
	limit 4
)	
intersect 
(
	select * 
	from products 
	order by price/weight desc
	limit 4
)

-- show only unquie value of first query
(	select * 
	from products 
	order by price desc 
	limit 4
)	
except 
(
	select * 
	from products 
	order by price/weight desc
	limit 4
)


-- subquery 
select name, price, (select max(price) from products) 
from products 
where price > 867

-- subquery
select name, price,(select price from products where id=3) as sub_price
from products
where price >867


-- subquery 
select name,price_weight_ratio
from (
	select name, price/weight as price_weight_ratio
	from products
) as p 
where price_weight_ratio>5

-- subquery
select * 
from (select max(price) from products) as p

-- avg find with help of subquery
select avg(order_count)
from 
  (
 	select user_id, count(*) as order_count
	from orders 
	group by user_id
  ) as p
  
-- subquery in join statment 
  select first_name
  from users 
  join (select user_id from orders where product_id=3) as o
  on o.user_id = users.id
  
-- subquery in where keyword
  select id 
  from orders
  where product_id in (
  	select id from products where price/weight > 50
  )
 
-- subquery in where condition
  select name 
  from products 
  where price>(select avg(price) from products)

 -- subquery  
 select name,department
 from products 
 where department not in (select department from products where price<100) 

 -- find greter than Industrial department price
 select name,department,price
 from products
 where price >All (select price from products where department='Industrial')
 
 -- same as above
 select name,department,price
 from products
 where price > (select max(price) from products where department='Industrial')

 
 --  atleast one Industrial department 
 select name,department,price
 from products
 where price > some (select price from products where department='Industrial')
 
-- all department max price	 
select name,department,price
from products p1
where p1.price = ( 
				   select max(price)  
				   from products p2
				   where p2.department = p1.department
			     )

			     
-- number of orders for each product
select name,(
				select count(*)
				from orders o1
				where o1.product_id = p1.id 
			) as num_orders
from products p1



select (
		select max(price)
		from products p 
	   ),
	   (
		select min(price)
		from products p2 
	   ),
	   (
	   	select avg(price)
	   	from products p3 
	   )
	   

select count(distinct department)
from products p 

-- not include same value od department and name
select distinct department,name
from products p 


select name,weight,greatest(30,2*weight)
from products p 

select name,price,least(price*0.5,400)
from products p 

select name,price,
		case
			when price > 600 then 'high'
			when price > 300 then 'medium'
			else 'cheap'
		end as descprition
from products p 		



			     
			     
 
 
 






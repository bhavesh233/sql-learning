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













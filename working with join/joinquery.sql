-- merge  contents and username 
select contents,username 
from comments_table 
join users 
on users.id = comments_table.user_id 

-- merge contents and url
select contents, url 
from comments_table ct 
join photos p 
on p.id  = ct .photo_id 

-- solve ambiguity problems 
select ct.id as comments_id, p.id
from comments_table as ct 
join photos as p 
on p.id = ct.id 



INSERT INTO photos (url, user_id)
VALUES ('https://banner.jpg', NULL);

-- gives only 20 recods it not consider null value  
select url, username 
from photos p 
join users u 
on p.user_id = u.id  

-- Left outer join 
select url, username
from photos p 
left join users u 
on p.user_id = u.id 


insert into users(username)
values ('Nicole')

-- Right outer join 
select url, username 
from photos p 
right join users u 
on p.user_id = u.id 

-- Full outer join 
select url,username 
from photos p 
full join users u 
on p.user_id = u.id 


-- join with where
select p.url,p.user_id,ct.user_id,ct.contents,ct.photo_id,p.id 
from photos p
join comments_table ct 
on p.id  = ct.photo_id 
where p.user_id = ct.user_id 

--three join column 
select url,p.user_id,ct.user_id,contents,u.id,username
from photos p 
join comments_table ct on p.id = ct.photo_id 
join users u ON u.id = ct.user_id and u.id = p.user_id  















select * from users
select * from photos
select * from comments_table 

INSERT INTO photos (url, user_id)
VALUES ('https://banner.jpg', NULL);


-- group by
select user_id, max(id) 
from comments_table ct 
group by user_id

-- count 
select user_id,count(id)
from comments_table ct 
group by user_id 

-- count 
select user_id,count(*)
from comments_table ct 
group by user_id 

select * from photos p 

-- null value not considire
select count(user_id) 
from photos p 

select count(*) 
from photos p 

select photo_id, count(*) 
from comments_table ct 
group by photo_id 


--find the number of comment for each photo
-- 		where photo_id less than 3
-- 		and   photo has more than 2 comments 

select photo_id,count(*)
from comments_table ct 
where photo_id < 3
group by photo_id 
having count(*) > 2 

  
/*
 * find the users(user_id) 
 * where
 * the user has commented on the first 50 photos
 * and 
 * the user added more than 20 comments on those photos
*/

select user_id, count(*)
from comments_table ct 
where photo_id <50
group by user_id
having count(*)>20 














drop table if exists users

--create table users
create table users(

	id serial primary key,
	username varchar(100)
)

--create table photos with references key point to users(id)
create table photos(
	
	id serial primary key,
	url varchar(100),
	user_id Integer references users(id)

)

INSERT INTO users (username)
VALUES
  ('monahan93'),
  ('pferrer'),
  ('si93onis'),
  ('99stroman');


INSERT INTO photos (url, user_id)
values
  ('http://one.jpg', 4),
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);


select * from users	
select * from photos p 

select * from photos p where user_id = 4

select username,url,user_id from photos p join users u on u.id = p.user_id 



-- delete table if exists
drop table if exists photos

-- create table photos 
create table photos(
	id serial primary key,
	url varchar(100),
	-- foregin key with cascade
	user_id Integer references users(id) on delete cascade
)

INSERT INTO photos (url, user_id)
values
  ('http://one.jpg', 4),
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

select * from users u 
select * from photos p 

-- delete users id 1 and also delete all user_id 1 in photos table 
delete from users where id=1





drop table if exists photos 

create table photos (
	id serial primary key,
	url varchar(100),
	user_id Integer references users(id) on delete set null
)

INSERT INTO photos (url, user_id)
values
  ('http://one.jpg', 4),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

 
 select * from users
 select * from photos p 
 
 delete from users where id =4
 











create table products(
	id serial primary key,
	name varchar(40),
	department varchar(40),
	price integer,
	weight integer
)


insert into products (name,department,price,weight) 
values ('Shirt','Clothes',20,1)

insert into products(name,department,weight)
values ('Pants','Cloths',3)

-- error already contains null value
alter table products 
alter column price
set not null

update products 
set price = 9999
where price is null

-- set price not null 
alter table products 
alter column price
set not null

insert into products(name,department,weight)
values ('Shoes','Cloths',5)







-- set default value 
alter table products 
alter column price
set default 999

insert into products (name,department,weight)
values ('Gloves','Tools',1)







-- unique constraints
insert into products (name,department,price,weight)
values ('Shirt','Tools',24,1)

-- error if same name exits
alter table products 
add unique(name)

insert into products (name,department,price,weight)
values ('Shirt','to',23,2)

alter table products 
drop constraint products_name_key

alter table products 
add unique(name,department)

insert into products (name,department,price,weight)
values ('Shirt','Clothes',12,2)

alter table products 
drop constraint products_name_department_key




-- check constraint
alter table products 
add check (price>0)

insert into products (name,department,price,weight)
values ('Belt','House',-99,1)










create table orders (
		id serial primary key,
		name varchar(40) not null,
		created_at timestamp not null,
		est_delivery timestamp not null,
		check (created_at < est_delivery)
)

insert into orders (name,created_at,est_delivery)
values ('Shirt','2000-NOV-20 01:00AM', '2000-NOV-25 01:00AM')

insert into orders (name,created_at,est_delivery)
values ('Shirt','2000-NOV-20 01:00AM', '2000-NOV-10 01:00AM')















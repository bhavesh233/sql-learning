create table company(

Id int primary key not null,
Name varchar(20) not null,
age int not null,
address varchar(25),
salary real,
join_date Date
)


insert into company(id,name,age,address,salary,join_date) values(1,'paul',32,'californiya',20000,'2022-02-22')


insert into company(id,name,age,address,salary,join_date) values 
(5,'hey',22,'californiya',20000000,'2023-02-25'),
(4,'heyid',43,'californiya',20000000,'2021-03-21')



select * from company
select id,name,salary from company
select * from company where salary=20000
select (15+6) as Addition;
select count(*) from company 
select current_timestamp 
select * from company where age>=25 or salary <=25000
select * from company where name like 'pa%'
select * from company where age not in (15,25)  nither 15 or nor 25
select * from company where age between 15 and 25
select * from company where exists (select age from company where salary<500)
select * from company where age >(select age from company where salary=25000)


update company set join_date ='2023-02-21' where id=3
select * from company 

update company set address ='delhi' where name='heyid'
delete from company where salary =2000

select * from company where address like '_aliforniya'
select * from company where address like '%l%'

select * from company where name='paul' limit 2 
select * from company order by id limit 3 offset 4

select * from company order by age desc
select * from company order by name
select * from company order by name asc,salary asc

select address,sum(salary) from company group by address 


with avrage_salary (avg_sal) as (
		(select cast(avg(salary) as int) from company )
)
select * from company c,avrage_salary av where c.salary >av.avg_sal




create table sales(
		
	store_id int,
	store_name varchar(50),
	product varchar(50),
	quantity int,
	store_cost real
	
)

		
   select name || ', '|| age as nameandage from company c 
   select concat(name,', - ',age) as nameandage from company c2 
   select concat(upper(name),', - ',age) as nameandage from company c2 



   select * from company c2
   select * from company c where  salary <> 22000
   select * from company c3 where salary != 20000
   
   select * from company c where salary between 22000 and 50000
   
   select * from company c where name in ('paul','hey')
   select * from company c where name not in ('paul','hey')
   
   select * from company c where age not in (25,45) and name='paul'
   select * from company c where age not in (25,45) or name='paul'
   select * from company c where age not in (25,45) or name='paul' or name='hey'
   


















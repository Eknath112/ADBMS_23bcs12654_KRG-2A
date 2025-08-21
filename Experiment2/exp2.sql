----------------.MEDIUM: Organizational Hierarchy Explorer
create database db2
create table emp_tbl(empid int primary key, emp_name varchar(max), department char(10), manager_id int)
insert into emp_tbl
values
	(1,'Alice','HR',NULL),
	(2,'Bob','Finance',1),
	(3,'Chotu','I.T.',1),
	(4,'Dhokad','Finance',2),
	(5,'Ennu','IT',3),
	(6,'Fulli','HR',1);

alter table emp_tbl
add constraint fk_emp foreign key(manager_id)
references emp_tbl(empid)

select * from emp_tbl

select e.emp_name as employee_name, e.department as employee_dept, f.emp_name as manager_name, f.department as manager_dept  
from emp_tbl as e
left outer join
emp_tbl as f
on
e.manager_id=f.empid


-------------------HARD: Financial Forecast Matching with Fallback Strategy 

create table year_tbl(id int , year int, npv int)
insert into year_tbl(id , year, npv)
values
	(1,2018,100),
	(7,2020,30),
	(13,2019,40),
	(1,2019,113),
	(2,2008,121),
	(3,2009,12),
	(11,2020,99),
	(7,2019,0);

create table quer_tbl(qid int , year int)
insert into quer_tbl
values
	(1,2019),
	(2,2008),
	(3,2009),
	(7,2018),
	(7,2019),
	(7,2020),
	(13,2019);

select * from year_tbl
select * from quer_tbl 

select y.id, y.year, isnull(y.npv,0)
from year_tbl as y
inner join
quer_tbl as q
on
y.id=q.qid
and
y.year=q.year
order by y.id
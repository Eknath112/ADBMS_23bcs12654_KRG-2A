----------MEDIUM LEVEL: Department Salary Champions
CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

select e.*,d.dept_name from
employee as e
inner join
department as d
on e.department_id=d.id

--solution 1
select dept_name, name, salary from
employee as e
inner join
department as d
on e.department_id=d.id
where e.salary in(
    select max(e2.salary)
    from employee as e2 
    where e2.department_id=e.department_id)
order by d.dept_name


-----------HARD LEVEL: Merging Employee Histories: Who Earned Least?
create table tablea(empid int, ename varchar(30),salary int)
insert into tablea values
(1,'aa',1000),
(2,'bb',300);

create table tableb(empid int, ename varchar(30), salary int)
insert into tableb values
(2,'bb',400),
(3,'cc',200);

select empid,ename,min(salary) from
(
select * from tablea
union all
select * from tableb 
) as t
group by empid,ename
-- creating tables
create table departments (
  department_id int primary key,
  department_name varchar(50)
);

create table courses (
  course_id int primary key,
  course_name varchar(50),
  department_id int,
  foreign key (department_id) references departments(department_id)
);

insert into departments (department_id, department_name) values
(1, 'artificial intelligence'),
(2, 'biotechnology'),
(3, 'environmental studies'),
(4, 'finance and economics'),
(5, 'design and media');

insert into courses (course_id, course_name, department_id) values
(101, 'neural networks', 1),
(102, 'natural language processing', 1),
(103, 'machine ethics', 1),
(201, 'genomics mapping', 2),
(202, 'protein modeling', 2),
(203, 'bioinformatics intro', 2),
(301, 'climate policy', 3),
(401, 'risk analysis', 4),
(402, 'portfolio management', 4),
(501, 'graphic storytelling', 5),
(502, 'interactive UI design', 5);

-- more than 2 courses
select department_name 
from departments 
where department_id in (
  select department_id 
  from courses 
  group by department_id 
  having count(course_id) > 2
);

-- grant select-only access
--grant select on courses to 'report_user';

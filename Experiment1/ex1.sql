--creating tables
create table authors(
  auth_id int primary key,
  auth_name varchar(50),
  country varchar(100)
);

create table books(
  book_id int primary key,
  book_name varchar(50),
  auth_id int,
  publish_year int
);

-- foreign key 
alter table books
add constraint fk_books_authors
foreign key (auth_id) references authors(auth_id);

insert into authors (auth_id, auth_name, country) values
(1, 'khushi', 'uttarakhand'),
(2, 'rahul ', 'jharkhand'),
(3, 'rumani', 'karnataka');

insert into books (book_id, book_name, auth_id, publish_year) values
(1001, 'jalebi sadyantra', 1, 2023),
(1002, 'chai ki chuski', 2, 1921),
(1003, 'lassi di jindagi', 1, 2010),
(1004, 'ricksha wala', 1, 2002),
(1005, 'chakravyu algorithm', 3, 1991),
(1006, 'swadist bytes', 3, 1942);

--displaying both tables
select * from authors
select * from books 

--displaying selected data after join 
select b.book_name, a.auth_name, a.country 
from authors a 
inner join books b on a.auth_id = b.auth_id;


---------MEDIUM--------
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

--displaying tables
select * from departments
select * from courses

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
--grant select on courses to user1;


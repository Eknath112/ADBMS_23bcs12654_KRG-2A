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

--displaying selected data after join 
select b.book_name, a.auth_name, a.country 
from authors a 
inner join books b on a.auth_id = b.auth_id;

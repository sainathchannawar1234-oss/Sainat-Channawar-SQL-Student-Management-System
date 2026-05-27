create database oasis_db;
use oasis_db;
create table student(
                      student_id int primary key,
                      sname varchar(50),
                      age int check(age >= 18),
                      gender varchar(20),
                      city varchar(50)
					);
				
 create table courses(
                        course_id int,
                        course_name varchar(50),
                        fees decimal(10,2)
				     );
alter table courses add primary key(course_id);
create table marks(
                    student_id int,
                    course_id int,
                    marks int,
                    foreign key (student_id) references student(student_id),
                    foreign key(course_id) references courses(course_id)
                  );
                  
CREATE TABLE enrollments( 
                           enrollment_id int,
                           student_id int,
                           course_id int,
                           enrollment_date date,
                           foreign key(student_id) references student(student_id),
                           foreign key(course_id) references courses(course_id)
						);
CREATE TABLE book(
                   book_id int primary key,
                   bname varchar(50) not null,
                   author varchar(50),
                   category varchar(50),
                   price decimal(10,2),
                   stock int
				  );

create table orders(
                     order_id int primary key,
                     student_id int,
                     book_id int,
                     order_date date,
                     quantity int,
                     status varchar(50) -- book still with student = issued
                                        -- book back in library = returned
                                        -- book not yet returned = return_date NULL
				   );
alter table orders alter quantity set default 0;
				
-- Data Insert
insert into student values
						  (1, 'Amit', 20, 'Male', 'Pune'),
						  (2, 'Sneha', 22, 'Female', 'Mumbai'),
						  (3, 'Rahul', 19, 'Male', 'Delhi'),
                          (4, 'Priya', 21, 'Female', 'Pune'),
                          (5, 'Karan', 23, 'Male', 'Bangalore'),
                          (6, 'Neha', 24, 'Female', 'Pune'),
                          (7, 'Arjun', 20, 'Male', 'Mumbai'),
                          (8, 'Pooja', 22, 'Female', 'Delhi'),
                          (9, 'Vikas', 25, 'Male', 'Hyderabad'),
                          (10, 'Anjali', 21, 'Female', 'Pune'),
                          (11, 'Rohit', 23, 'Male', 'Mumbai'),
                          (12, 'Meena', 20, 'Female', 'Chennai'),
                          (13, 'Suresh', 24, 'Male', 'Pune'),
                          (14, 'Kavita', 22, 'Female', 'Delhi'),
                          (15, 'Manoj', 26, 'Male', 'Bangalore');
-- courses                         
insert into courses values
						   (101, 'SQL', 5000),
                           (102, 'Python', 7000),
                           (103, 'Java', 6000),
                           (104, 'C++', 5500),
                           (105, 'Data Science', 8000);
						
-- Enrollments
insert into enrollments values
                               (1,1,101,'2026-01-10'),
                               (2,1,102,'2026-02-15'),
                               (3,2,101,'2026-01-12'),
                               (4,2,103,'2026-02-18'),
                               (5,3,103,'2026-03-01'),
                               (6,3,104,'2026-03-05'),
                               (7,4,102,'2026-02-20'),
                               (8,4,105,'2026-03-10'),
                               (9,5,101,'2026-01-25'),
							   (10,6,105,'2026-02-28'),
                               (11,7,101,'2026-03-02'),
                               (12,8,104,'2026-03-07'),
                               (13,9,102,'2026-03-09'),
                               (14,10,105,'2026-03-11'),
							   (15,11,101,'2026-03-12');
                               
-- Book                               
insert into book values
                          (1,'DBMS Basics','John Alen','Education',500,10),
						  (2,'Python Guide','Henry Fill','Programming',700,5),
						  (3,'Java Mastery','Stephen King','Programming',650,7),
                          (4,'C++ Handbook','Mark Twain','Programming',600,8),
                          (5,'Data Science Intro','Hokay','Education',900,6);
-- Orders
insert into orders values (1,1,1,'2026-03-10',1,'issued'),
						  (2,2,2,'2026-03-11',2,'returned'),
                          (3,3,3,'2026-03-12',1,'issued'),
                          (4,4,4,'2026-03-13',1,'returned'),
                          (5,5,5,'2026-03-14',2,'issued'),
                          (6,6,1,'2026-03-15',1,'returned'),
                          (7,7,2,'2026-03-16',3,'issued'),
                          (8,8,3,'2026-03-17',1,'returned'),
                          (9,9,4,'2026-03-18',2,'issued'),
                          (10,10,5,'2026-03-19',1,'issued'),
                          (11,11,1,'2026-03-20',1,'returned'),
						  (12,12,2,'2026-03-21',2,'issued'),
                          (13,13,3,'2026-03-22',1,'returned'),
                          (14,14,4,'2026-03-23',2,'issued'),
						  (15,15,5,'2026-03-24',1,'returned');
     
-- Marks
insert into marks values
						(1,101,85),(2,102,90),(3,103,70),(4,104,88),(5,105,60),(6,101,95),(7,102,72),(8,103,77),
                        (9,104,66),(10,105,91),(11,101,55),(12,102,60),(13,103,73),(14,104,82),(15,105,88);
                        
                        
select *from student;
select *from courses;
select *from enrollments;
select *from marks;
select *from book;
select *from orders;

create user 'SSS'@'localhost' identified by 'SSS';
grant all on oasis_db.* to 'SSS'@'localhost'; 

insert into student values
						  (16, 'Sainath', 20, 'Male', 'Pune');


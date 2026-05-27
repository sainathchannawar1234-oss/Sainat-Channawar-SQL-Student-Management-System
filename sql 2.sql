use oasis_db;
select *from student;
select *from courses;
select *from enrollments;
select *from book;
select *from orders;
select *from marks;

-- Management quetions
--------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- All students with their enrolled course names.
select e.*,s.sname, c.course_name from student s 
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id order by student_id;	
---------------------------------------------------------------------------------------------------------------------------------------------------------  
-- Student name and marks for each course.
select s.sname,m.marks,c.course_name 
from student s
inner join marks m on s.student_id = m.student_id
inner join courses c on c.course_id = m.course_id
group by course_name,s.sname,m.marks;
--------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
-- Student name and books they ordered.
select s.sname,b.bname,o.order_id,o.status
from student s
inner join orders o on s.student_id = o.order_id
inner join book b on o.book_id = b.book_id;
--------------------------------------------------------------------------------------------------------------------------------------------------------- 

-- Count number of students in each city.
select city as City,count(*) as Number_of_student from student group by city;
---------------------------------------------------------------------------------------------------------------------------------------------------------  
-- Total quantity of books ordered per student.
select student_id,sum(quantity) as TotalQuantity from orders group by student_id;
--------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- Average marks per course.
select course_id,avg(marks) from marks group by course_id;
--------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- Cities having more than 2 students.
select city,count(student_id) as Totalstudent from student 
group by city
having Totalstudent>2;
--------------------------------------------------------------------------------------------------------------------------------------------------------- 
 -- Students who ordered more than 2 books.
select s.sname,count(o.book_id) as Totalordered_books from student s
join orders o on s.student_id = o.student_id
group by s.sname having Totalordered_books>2;
---------------------------------------------------------------------------------------------------------------------------------------------------------
--  Courses where average marks > 72.
select c.course_name,avg(marks) as AvgMarks from courses c
inner join marks m on c.course_id = m.course_id
group by c.course_name having AvgMarks > 74;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Students who scored above from the average marks.
select s.student_id,s.sname,m.marks from student s
join marks m on s.student_id = m.student_id
where m.marks > (select avg(marks) from marks);
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Student names who scored highest marks in each course.
select s.sname,max(m.marks),m.course_id,c.course_name from student s 
join marks m on s.student_id = m.student_id
join courses c on c.course_id = m.course_id
group by s.sname,m.course_id;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Students who never enrolled in any course.
select s.sname,s.student_id,e.enrollment_id from student s
left join enrollments e on
s.student_id = e.student_id
where e.student_id is null;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Students who never ordered any books.
select s.sname,s.student_id,o.order_id from student s
left join orders o on s.student_id = o.order_id where o.order_id is null;
delete from orders where order_id = 15;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Top 3 students with highest total marks across all courses
select s.sname as StudentName,s.student_id,sum(m.marks) as TotalMarks,c.course_name as CourseName from student s
join marks m on s.student_id = m.student_id
join courses c on c.course_id = m.course_id
group by s.sname,s.student_id,c.course_id
order by sum(m.marks) desc
limit 3;
--------------------------------------------------------------------------------------------------------------------------------------------------------- 
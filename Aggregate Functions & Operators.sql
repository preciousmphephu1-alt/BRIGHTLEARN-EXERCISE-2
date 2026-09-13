--Step 1 Create a catalog
CREATE CATALOG IF NOT EXISTS excercise2;

--Step 2 Create a Schema 
CREATE SCHEMA IF NOT EXISTS excercise2.learnbright;

--Step 3 Create a table
CREATE TABLE IF NOT EXISTS excercise2.learnbright.students (student_id INT,name STRING,age INT,department STRING);

--Step 4 Insert data into table
INSERT INTO excercise2.learnbright.students 
 VALUES (1,'Alice',20,'IT'),
 (2,'Bob',22,'HR'),
 (3,'Charlie',21,'IT'),
 (4,'Diana',23,'Finance'),
 (5,'Eve',22,'HR');
 
 SELECT * 
 FROM excercise2.learnbright.students;

 --Students table questions 
 --QUESTION 1 01 List all distinct departments in the students table
 SELECT DISTINCT department
 FROM excercise2.learnbright.students;

 --QUESTION 2 Get the average age of students per department.
 SELECT department, AVG(age) AS avg_age 
 FROM excercise2.learnbright.students
 GROUP BY department;

 --Question 3 Show departments with more than 1 student
 SELECT department, COUNT(*) AS student_count 
 FROM excercise2.learnbright.students
 GROUP BY department
 HAVING COUNT (*) > 1;


--Question 4 Get all students whose age is between 21 and 23.
SELECT *
FROM excercise2.learnbright.students
WHERE age BETWEEN 21 AND 23;

--Question 5 List all students in the IT or HR department who are older than 21.
SELECT *
FROM excercise2.learnbright.students
WHERE department IN ('IT', 'HR') 
AND age > 21;

--02 The courses Table
CREATE TABLE IF NOT EXISTS excercise2.learnbright.courses (course_id INT,course_name STRING,department STRING,credits INT);

INSERT INTO excercise2.learnbright.courses 
 VALUES (101,'SQL Basics', 'IT', 3),
 (102,'Python', 'IT', 4),
 (103,'Data Science', 'IT', 4),
 (104,'Exel', 'Finance', 2),
 (105,'Statistics', 'HR',3);

SELECT*
FROM excercise2.learnbright.courses;

--QUESTION 6 Show total credits per department, only for departments with more than 5 total credits
SELECT department, SUM(credits) AS total_credits
FROM excercise2.learnbright.courses
GROUP BY department
HAVING total_credits > 5;


--QUESTION 7 List all courses that do not have 4 credits
SELECT DISTINCT course_id,
       course_name,
       department,
       credits
FROM excercise2.learnbright.courses
WHERE credits <>4;

--QUESTION 8  Show the top 3 courses by credits in descending order
SELECT DISTINCT course_id,
       course_name,
       credits
FROM excercise2.learnbright.courses
ORDER BY credits DESC
LIMIT 3;

--ENrollments table 03
CREATE TABLE IF NOT EXISTS excercise2.learnbright.enrollments (enrollment_id INT,student_id INT,course_id INT,grade INT);

INSERT INTO excercise2.learnbright.enrollments 
 VALUES (1,1,101,85),
 (2,2,102,78),
 (3,3,103,90),
 (4,4,104,88),
 (5,5,105,82);

 SELECT *
 FROM excercise2.learnbright.enrollments;

 --QUESTION 9 Get the maximum, minimum, and average grade across all enrollments
 SELECT MAX(grade) AS max_grade,
       MIN(grade) AS min_grade,
       AVG(grade) AS avg_grade
FROM excercise2.learnbright.enrollments;

--QUESTION 10 Count how many enrollments exist per course
SELECT course_id,
       COUNT(*) AS enrollment_count
FROM excercise2.learnbright.enrollments
GROUP BY course_id;

--04 The salaries Table
CREATE TABLE IF NOT EXISTS excercise2.learnbright.salaries (employee_id INT,name STRING,department STRING,salary INT,bonus INT);

INSERT INTO excercise2.learnbright.salaries 
 VALUES (1,'TOM','IT',60000,5000),
 (2,'Jerry','HR',55000,4000),
 (3,'Spike','Finance',70000,6000),
 (4,'Tyke','IT',62000,5500),
 (5,'Butch','HR',54000,3500);

 SELECT *
 FROM excercise2.learnbright.salaries;

-- QUESTION 11 Find total salary and total bonus per department
SELECT department,
       SUM(salary) AS total_salary,
       SUM(bonus) AS total_bonus
FROM excercise2.learnbright.salaries
GROUP BY department;

--QUESTION 12 Show departments where average salary is above 55,000
SELECT department,
       AVG(salary) AS avg_salary
FROM excercise2.learnbright.salaries
GROUP BY department
HAVING avg(salary)>55000;

--QUESTION 13 List employees whose salary plus bonus is greater than 60,000
SELECT 
    employee_id,
    name,
    salary,
    bonus,
    (salary+bonus) AS total_compensation
FROM excercise2.learnbright.salaries
WHERE (salary+bonus)>60000;

--05 The projects Table
CREATE TABLE IF NOT EXISTS excercise2.learnbright.projects (project_id INT,project_name STRING,department STRING,budget INT);

INSERT INTO excercise2.learnbright.projects 
 VALUES (1,'AI App', 'IT', 120000),
 (2,'Payroll System', 'Finance', 80000),
 (3,'Dashboard', 'IT', 150000),
 (4,'Website', 'Marketing', 60000),
 (5,'HR Portal','HR',50000);

--QUESTION 14 Show total and average budget per department. Only include departments with average budget above 70,000
SELECT 
     department,
     SUM(budget) AS total_budget,
     AVG(budget) AS avg_budget
FROM excercise2.learnbright.projects
GROUP BY department
HAVING AVG(budget)>70000;

--QUESTION 15 List all projects with budgets between 50,000 and 120,000, excluding the Marketing department
SELECT
     project_id,
     project_name,
     department,
     budget
FROM excercise2.learnbright.projects
WHERE budget BETWEEN 50000 AND 120000
AND department <> 'Marketing';

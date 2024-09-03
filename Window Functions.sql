create database office;

use office;

show tables;

select * from employee;

select * from salary;

alter table employee
add column new_HireDate date;
update employee
set new_HireDate = str_to_date(HireDate, '%d-%m-%Y');
alter table employee drop column HireDate;
alter table employee change column new_HireDate HireDate date; 

/*Assign a unique sequential number to each employee within their respective department, ordered by their hire date. 
(What is the row number of each employee within their department based on the order of their hire date?)*/
select *, row_number() over(
partition by Department 
order by HireDate) 
as RowNumber
from employee;

-- Rank the employees based on their salary in descending order. (What is the rank of each employee according to their salary?) --
select s.EmployeeID, concat(e.FirstName," ",e.LastName) as FullName, Salary, 
rank() over(order by Salary desc) as SalaryRank
from salary as s
join employee as e 
on s.EmployeeID = e.EmployeeID;

-- Determine the dense rank of employees based on their salary in descending order. (How does the dense rank of employees differ from the regular rank?) --
select s.EmployeeID, concat(e.FirstName," ",e.LastName) as FullName, Salary, 
dense_rank() over(order by Salary desc) as SalaryDenseRank, 
rank() over(order by Salary desc) as SalaryRank
from salary as s
join employee as e 
on s.EmployeeID = e.EmployeeID;

-- Divide the employees into four quartiles based on their salary. (Which quartile does each employee's salary fall into?) --
select EmployeeID, Salary, 
ntile(4) over(order by Salary) as Quartiles
from salary;

-- Determine the relative rank of each employee's salary as a percentage. (What is the percentile rank of each employee's salary?) --
select EmployeeID, Salary, 
round(percent_rank() over(order by Salary),2) as PercentRank
from salary;

-- For each employee, find the previous salary in descending order. (What was the salary of the employee who had the next highest salary?) --
select EmployeeID,
lag(Salary) over(order by Salary desc) as PreviousSalary
from salary;

-- For each employee, find the next salary in descending order. (What is the salary of the employee who has the next lower salary?) --
select EmployeeID,
lead(Salary) over(order by Salary desc) as NextSalary
from salary;

-- Find the first hired employee's salary in each department. (What is the salary of the first hired employee within each department?) --
select e.EmployeeID, concat(e.FirstName," ",e.LastName) as FullName, e.Department,
first_value(s.Salary) 
over(partition by Department order by HireDate) as FirsteEmployeeSalary
from employee as e
join salary as s 
on e.EmployeeID = s.EmployeeID;

-- Find the salary of the most recently hired employee in each department. (What is the salary of the last hired employee within each department?) --
select e.EmployeeID, concat(e.FirstName," ",e.LastName) as FullName, e.Department,
last_value(s.Salary) 
over(partition by Department order by HireDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as LasteEmployeeSaalry
from employee as e
join salary as s 
on e.EmployeeID = s.EmployeeID;

-- Find the third highest salary within each department. (What is the third highest salary in each department?) --
select e.EmployeeID, Department, s.Salary,
nth_value(s.Salary, 3) over(partition by Department order by s.Salary desc) as 3rdHighestSalary
from employee as e
join salary as  s 
on e.EmployeeID = s.EmployeeID;

-- Calculate the running total of salaries for employees. (What is the cumulative sum of salaries up to each employee?) --
select EmployeeID, Salary,
sum(Salary) over(order by EmployeeID) as RunningTotalSalaries
from salary;

-- Determine the average salary within each department.(What is the average salary of employees within their respective departments?) --
select e.Department, 
avg(s.Salary) over(partition by Department) as AverageSalary
from employee as e
join salary as s
on e.EmployeeID = s.EmployeeID;

select distinct Department,
avg(s.salary) over(partition by Department) as AverageSalary
from employee as e
join salary as s 
on e.EmployeeID = s.EmployeeID;

-- Identify the minimum salary within each department. (What is the lowest salary in each department?) --
select distinct Department,
min(s.salary) over(partition by Department) as AverageSalary
from employee as e
join salary as s 
on e.EmployeeID = s.EmployeeID;

-- Identify the maximum salary within each department. (What is the highest salary in each department?) --
select distinct Department,
max(s.salary) over(partition by Department) as AverageSalary
from employee as e
join salary as s 
on e.EmployeeID = s.EmployeeID;

-- Count the total number of employees in each department. How many employees are there in each department? --
select distinct Department,
count(*) over(partition by Department) as AverageSalary
from employee as e;


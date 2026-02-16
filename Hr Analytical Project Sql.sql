create database HR;
use hr;
-- 1 Show all employee records
SELECT * 
FROM hr_data;

-- 2 Count total employees
SELECT COUNT(Employee_ID) AS Total_Employees
FROM hr_data;

-- 3 Average salary of employees
SELECT AVG(Salary) AS Avg_Salary
FROM hr_data;

-- 4 Employees by department
SELECT Department, COUNT(Employee_ID) AS Emp_Count
FROM hr_data
GROUP BY Department;

-- 5 Highest and lowest salary
SELECT MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary
FROM hr_data;

-- 6 Average salary by department
SELECT Department, AVG(Salary) AS Avg_Salary
FROM hr_data
GROUP BY Department;

-- 7 Count employees by gender
SELECT Gender, COUNT(Employee_ID) AS Emp_Count
FROM hr_data
GROUP BY Gender;

-- 8 Employees with experience more than 5 years
SELECT * 
FROM hr_data
WHERE Experience_Years > 5;

-- 9 Attrition count
SELECT Attrition_Status, COUNT(Employee_ID) AS Emp_Count
FROM hr_data
GROUP BY Attrition_Status;

-- 10 Salary greater than company average
SELECT *
FROM hr_data
WHERE Salary > (SELECT AVG(Salary) FROM hr_data);

-- 11 Rank employees by salary (Window Function)
SELECT Employee_ID, Name, Salary,
RANK() OVER (ORDER BY Salary DESC) AS Salary_Rank
FROM hr_data;

-- 12 Top 3 highest salary employees
SELECT *
FROM (
    SELECT *, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
    FROM hr_data
) t
WHERE rnk <= 3;

-- 13 Running total salary by department
SELECT Department, Employee_ID, Salary,
SUM(Salary) OVER (PARTITION BY Department ORDER BY Salary) AS Running_Total
FROM hr_data;

-- 14 Average salary by department using window function
SELECT Employee_ID, Name, Department, Salary,
AVG(Salary) OVER (PARTITION BY Department) AS Dept_Avg_Salary
FROM hr_data;

-- 15 Find employees whose salary is above department average
SELECT *
FROM (
    SELECT *, AVG(Salary) OVER (PARTITION BY Department) AS Dept_Avg
    FROM hr_data
) t
WHERE Salary > Dept_Avg;















--basic 5 sql questions with solution 
--question 1 Retrieve All Data
SELECT*FROM employees;
--question 2 filter data using a condition 
SELECT first_name, last_name, salary
FROM employees
WHERE department = 'IT';
--question 3 sort a data
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;
--question 4 aggregate data
SELECT COUNT(*) AS hr_employee_count
FROM employees
WHERE department = 'HR';
--question 5 grouping data
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
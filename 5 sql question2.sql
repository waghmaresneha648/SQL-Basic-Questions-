--q6 find unique values
SELECT DISTINCT department 
FROM employees;
--q7  pattern matching
SELECT * FROM employees 
WHERE first_name LIKE 'A%';
--q8 finding empty values
SELECT * FROM employees 
WHERE manager_id IS NULL;
--q9 combining table (inner join)
SELECT employees.first_name, projects.project_name
FROM employees
INNER JOIN projects ON employees.emp_id = projects.emp_id;
--q10 filtering aggregated data
SELECT department, SUM(salary) AS total_expense
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;
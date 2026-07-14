--Displaying Unmatched Rows (LEFT JOIN)
SELECT e.first_name, e.last_name, p.project_name
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id;
--Filtering with a List (IN Operator)
SELECT * FROM employees
WHERE department IN ('IT', 'HR', 'Marketing');
--Conditional Logic (CASE statement)
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary >= 80000 THEN 'High'
           ELSE 'Standard'
       END AS salary_bracket
FROM employees;
--Basic Subquery
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
--Formatting and Concatenating Strings
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

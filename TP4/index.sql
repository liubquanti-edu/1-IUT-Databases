SELECT emp_no, first_name, last_name, hire_date FROM employees LIMIT 15;

SELECT * FROM employees ORDER BY hire_date DESC;

SELECT * FROM employees WHERE first_name LIKE 'A%';

SELECT COUNT(*) FROM employees WHERE YEAR(hire_date) > 2000;

SELECT SUM(gender = 'F') AS female, SUM(gender = 'M') AS male FROM employees;

SELECT last_name FROM employees GROUP BY last_name ORDER BY COUNT(*) DESC LIMIT 5;

SELECT 
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

SELECT 
    e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no WHERE dept_name = 'Sales';

SELECT 
    d.dept_name,
    COUNT(*) AS nb_employes
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY nb_employes DESC;

SELECT AVG(salary) from salaries;

SELECT 
    d.dept_name,
    MAX(s.salary) AS salaire_max
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY salaire_max DESC;

SELECT * FROM current_employees;
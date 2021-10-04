-- Queries

-- 1. Employee info 

SELECT s.emp_no, e.lastname, e.firstname, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

-- 2. Employees hired in 1986
SELECT e.firstname, e.lastname, e.hire_date
FROM employees AS e
WHERE extract(year FROM hire_date) = 1986;


-- 3. Department Managers info
SELECT DISTINCT (dm.dept_no), dm.dept_no, dm.emp_no, de.dept_name, e.lastname, e.firstname 
FROM dept_mgr AS dm
INNER JOIN departments AS de
ON dm.dept_no = de.dept_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no

-- 4. Employee department info
SELECT DISTINCT (e.emp_no), e.emp_no, e.lastname, e.firstname, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no DESC;

-- 5. Hercules B.
SELECT e.lastname, e.firstname
FROM employees AS e
WHERE (e.firstname = 'Hercules') and (lower(e.lastname) LIKE 'b%')


--  6. Sales department employee info
SELECT e.emp_no, e.lastname, e.firstname, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE lower(d.dept_name) = 'sales';


--  7. Sales & Development employee info
SELECT e.emp_no, e.lastname, e.firstname, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE (lower(d.dept_name) = 'sales') OR (lower(d.dept_name) = 'development');

--  8. Descending frequency of last names
SELECT lastname,count(lastname) as frequency
FROM employees
GROUP BY lastname
ORDER BY frequency DESC;

--- Epilogue: Search for my employee ID number

SELECT lastname, firstname
FROM employees 
WHERE employees.emp_id = 499942

--- "Foolsday, April"
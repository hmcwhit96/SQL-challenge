-- create titles table
CREATE TABLE titles(
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(50)
);

-- Create table for employees
CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
    title_id VARCHAR(10),
    birth_date DATE,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    sex VARCHAR(1),
    hire_date DATE
        FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

-- create table for departments
CREATE TABLE departments(
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- create dept manager table
CREATE TABLE dept_mgr(
    dept_no VARCHAR(10),
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- create dept employees table
CREATE TABLE dept_emp(
    emp_no INT,
    dept_no VARCHAR(10),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- create salaries table
CREATE TABLE salaries(
    emp_no INT,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
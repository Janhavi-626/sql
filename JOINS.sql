CREATE TABLE departments (
    dept_id      NUMBER PRIMARY KEY,
    dept_name    VARCHAR2(50) NOT NULL,
    location     VARCHAR2(50)
);
-- table 2 employee(child)
CREATE TABLE employees (
    emp_id        NUMBER PRIMARY KEY,
    emp_name      VARCHAR2(50) NOT NULL,
    dept_id       NUMBER,
    manager_id    NUMBER,
  salary        NUMBER(10,2),
   hire_date     DATE,
   CONSTRAINT fk_emp_dept
        FOREIGN KEY (dept_id)
      REFERENCES departments(dept_id)
 );
--Departments (note: dept_id 50 has no employees)
INSERT INTO departments VALUES (10, 'Sales',      'Mumbai');
INSERT INTO departments VALUES (20, 'Engineering','Bengaluru');
INSERT INTO departments VALUES (30, 'HR',         'Delhi');
INSERT INTO departments VALUES (40, 'Finance',    'Pune');
 INSERT INTO departments VALUES (50, 'Legal',      'Chennai');
-- Employees
-- One-to-many mapping example:
dept 20 has multiple employees
INSERT INTO employees VALUES (101, 'Asha',   10, 900, 60000, DATE '2022-01-10');
 INSERT INTO employees VALUES (102, 'Bharat', 20, 901, 80000, DATE '2021-03-15');
 INSERT INTO employees VALUES (103, 'Charu',  20, 901, 75000, DATE '2023-07-01');
 INSERT INTO employees VALUES (104, 'Deep',   20, NULL, NULL, DATE '2024-02-20');
INSERT INTO employees VALUES (105, 'Esha',   30, 902, 50000, DATE '2020-11-05');
INSERT INTO employees VALUES (106, 'Farhan', NULL, 903, 45000, DATE '2024-01-12'); -- NULL dept
INSERT INTO employees VALUES (107, 'Gauri',  40, 904, 90000, DATE '2019-08-25');
INSERT INTO employees VALUES (108, 'Hari',   NULL, NULL, NULL, DATE '2025-01-01'); -- NULL dept + NULL salary

COMMIT;

--Example 1: Basic INNER JOIN
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
  ON e.dept_id = d.dept_id;

-- Example 2: LEFT OUTER JOIN (all employees)
   SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
   ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

--Example 3: RIGHT OUTER JOIN (all departments)
SELECT d.dept_id, d.dept_name, e.emp_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
ORDER BY d.dept_id, e.emp_name;

--Example 4: FULL OUTER JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.dept_id = d.dept_id
ORDER BY d.dept_name, e.emp_name;

Example 5: Employees with no matching department   
SELECT e.emp_id, e.emp_name, e.dept_id
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;           

Example 6: Departments with no employees
SELECT d.dept_id, d.dept_name
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

--Example 7: INNER JOIN with filter on location
SELECT e.emp_name, d.dept_name, d.location
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.location = 'Bengaluru';

-- -- --Example 8: Count employees per department (including empty departments)
SELECT d.dept_id,
       d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_id;

-- --Example 9: Average salary per department
SELECT d.dept_name,
       ROUND(AVG(e.salary), 2) AS avg_salary
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY d.dept_name;

--Example 10: Show 'No Department' for NULL joins
SELECT e.emp_name,
       NVL(d.dept_name, 'No Department') AS dept_label
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_id;
-- --Employee names + their department (or “No Department” if none).

-- Example 11: Employees hired after 2023 with department names
-- xample 12: Departments having at least 2 employees
SELECT d.dept_name, COUNT(*) AS emp_count
FROM departments d
JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(*) >= 2;
--Example 13: Employee count + total salary by department
SELECT d.dept_name,
       COUNT(e.emp_id) AS emp_count,
       SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY d.dept_name;

--Example 14: Use COALESCE for salary display
SELECT e.emp_name,
       COALESCE(TO_CHAR(e.salary), 'Salary Missing') AS salary_text,
       d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id;

--Example 15: Find employees in departments located in Mumbai or Delhi
SELECT e.emp_name, d.dept_name, d.location
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.location IN ('Mumbai', 'Delhi');

--Example 16: Sort by department then highest salary
SELECT d.dept_name, e.emp_name, e.salary
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
ORDER BY d.dept_name, e.salary DESC NULLS LAST;
Example 17: Anti-join style using NOT EXISTS (departments without employees)
SELECT d.dept_id, d.dept_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);
-- --Example 18: Join with computed bucket (high/medium/low salary)
SELECT e.emp_name,
       d.dept_name,
       CASE
           WHEN e.salary >= 80000 THEN 'High'
           WHEN e.salary >= 50000 THEN 'Medium'
           WHEN e.salary IS NULL THEN 'Unknown'
           ELSE 'Low'
       END AS salary_band
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id;

-- -- --Example 19: Count NULL department employees via join result
-- -- --Counts how many employees don’t belong to any department.
SELECT COUNT(*) AS no_dept_employees
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --Example 20: CROSS JOIN (all combinations)
SELECT d.dept_name, e.emp_name
FROM departments d
CROSS JOIN employees e;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- --Write a query to list employee name and department name for only matched rows.
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- -- -- -- -- -- -- -- -- -- -- -- -- --Write a query to show all employees even if department is missing.
 SELECT e.emp_name, d.dept_name
-FROM employees e
LEFT JOIN departments d
 ON e.dept_id = d.dept_id;
--Write a query to show all departments even if no employee exists.
SELECT d.dept_name, e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

--Write a query to show all rows from both sides (matched + unmatched).
SELECT e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

--Find employees whose dept_id does not exist in departments.
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.dept_id = e.dept_id
);
--Find departments that currently have zero employees.
SELECT d.*
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- -- -- -- -- -- -- -- -- --Count number of employees in each department (include empty departments).
SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- -- -- -- -- -- -- -- --Show average salary by department.
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- -- -- -- -- -- -- -- Show highest salary by department (ignore NULL salaries).
SELECT d.dept_name, MAX(e.salary) AS max_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- -- -- -- -- -- --List employees hired in or after 2024 with their department names.
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.hire_date >= DATE '2024-01-01';

-- -- -- -- -- --Show each employee with department label as No Department when unmatched.
SELECT e.emp_name,
       NVL(d.dept_name, 'No Department') AS dept_label
FROM employees e
LEFT JOIN departments d
 ON e.dept_id = d.dept_id;

-- -- -- -- --Find departments with more than one employee.
SELECT d.dept_name
FROM departments d
JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 1;

--Show total salary by location using department-to-employee join.
SELECT d.location, SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.location;

-- -- --List employees from departments located in Bengaluru.
SELECT e.emp_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.location = 'Bengaluru';

-- --Return top paid employee from each department.
SELECT *
FROM (
    SELECT e.emp_name, d.dept_name, e.salary,
           RANK() OVER (PARTITION BY d.dept_id ORDER BY e.salary DESC) rnk
    FROM employees e
    JOIN departments d
    ON e.dept_id = d.dept_id
)
WHERE rnk = 1;

---Show departments where all employee salaries are NULL.
SELECT d.dept_name
 FROM departments d
 LEFT JOIN employees e
 ON d.dept_id = e.dept_id
 GROUP BY d.dept_name
 HAVING MAX(e.salary) IS NULL;

-- --Write a query using NOT EXISTS to find unassigned departments.
 SELECT *
 FROM departments d
 WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
 );

-- --Show count of employees with NULL dept_id.
SELECT COUNT(*) AS no_dept_count
 FROM employees
 WHERE dept_id IS NULL;

-- --Produce a cartesian product of departments and employees.
SELECT *
FROM employees e
 CROSS JOIN departments d;

-- --Compare results of INNER JOIN vs LEFT JOIN and explain missing rows.
SELECT e.emp_name, d.dept_name
FROM employees e
 INNER JOIN departments d
 ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

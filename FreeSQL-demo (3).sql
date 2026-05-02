-- 1. Employees earning more than average salary
-- select name,salary
--  from employees where salary>(select avg(salary)from employees)

---- 2. Second highest salary
-- select max(salary) from 
-- employees where salary<(select max(salary)from employees)
-- select max(salary)from employees
-- select * from employees

---- 3. Employees in IT department
SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id FROM Departments WHERE dept_name = 'IT'
);

--4. Employees with salary greater than HR employees
select emp_name from
 EMPLOYEES where salary>
 all(select salary from employees where dept_id=10)
-- select * from employees

--5. Employees who are managers
select emp_name from 
employees where emp_id in(select manager_id from employees)

--6. Departments having more than 5 employees
select * from employees
SELECT dept_id
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 5

--7. Employees without department
SELECT emp_name
FROM Employees
WHERE dept_id NOT IN (SELECT dept_id FROM Departments);

-- 8. Dept avg salary > overall avg
SELECT dept_id
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM Employees);

select * from employees

--INLINE VIEW ANSWERS
--9. Dept-wise avg salary (inline)
SELECT dept_id, avg_sal
FROM (
    SELECT dept_id, AVG(salary) avg_sal
    FROM Employees
    GROUP BY dept_id
) t;

--10. Employees > dept avg (inline)
SELECT emp_name
FROM Employees e
JOIN (
    SELECT dept_id, AVG(salary) avg_sal
    FROM Employees GROUP BY dept_id
) d
ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_sal;
--employee whose salary is greater than the average salary of their own department

--11. Top 5 salaries
SELECT *
FROM (
    SELECT emp_name, salary
    FROM Employees
    ORDER BY salary DESC
) t
FETCH FIRST 5 ROWS ONLY;

SELECT *
FROM (
    SELECT emp_name, salary
    FROM Employees
    ORDER BY salary DESC nulls last
) t
fetch first 5 rows only;

--CORRELATED SUBQUERY ANSWERS
--12. Employees > dept avg
SELECT emp_name
FROM Employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees e2
    WHERE e2.dept_id = e1.dept_id
);
--  Highest salary per dep
select emp_name.dept_id
from employees e1 where
salary=(select max(salary)from employees e2 where e2.dept_id=e1.dept_id)
--14. Employees without subordinates-means people who work under someone 
select emp_name
 from Employees e1
  where not exists(select 1 from employees e2 where e2.manager_id=e1.emp_id)
  
  --15. Salary = dept minimum
  SELECT emp_name
FROM Employees e1
WHERE salary = (
    SELECT MIN(salary)
    FROM Employees e2
    WHERE e2.dept_id = e1.dept_id
);

--CTE ANSWERS
--18. Dept total salary
WITH dept_total AS (
    SELECT dept_id, SUM(salary) total
    FROM Employees GROUP BY dept_id
)
SELECT * FROM dept_total;

-- 19. Rank employees
WITH cte AS (
    SELECT emp_name, salary,
           RANK() OVER (ORDER BY salary DESC) rnk
    FROM Employees
)
SELECT * FROM cte;

--21. Remove duplicates
WITH cte AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY name ORDER BY emp_id) rn
    FROM Employees
)
delete from cte WHERE rn > 1;

-- 22. Running total
WITH cte AS (
    SELECT emp_name, salary,
           SUM(salary) OVER (ORDER BY emp_id) running_total
    FROM Employees
)
SELECT * FROM cte;

-- 23. Dept avg → filter employees
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) avg_sal
    FROM Employees 
    GROUP BY dept_id
),
filtered AS (
    SELECT e.emp_name, e.salary
    FROM Employees e
    JOIN dept_avg d 
        ON e.dept_id = d.dept_id
    WHERE e.salary > d.avg_sal
)
SELECT * FROM filtered;

-- 24. Rank → filter top 3
WITH ranked AS (
    SELECT emp_name, salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) rnk
    FROM Employees
),
top3 AS (
    SELECT * FROM ranked WHERE rnk <= 3
)
SELECT * FROM top3;

-- 27. Employees whose manager earns less
SELECT e1.emp_name
FROM Employees e1
JOIN Employees e2
ON e1.manager_id = e2.emp_id
WHERE e1.salary > e2.salary;

-- 30. Convert correlated → JOIN (optimization)
SELECT e.emp_name
FROM Employees e
JOIN (
    SELECT dept_id, AVG(salary) avg_sal
    FROM Employees GROUP BY dept_id
) d
ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_sal;

--1. Company avg → Dept avg → Employees above dept avg
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM hr.employees
),
dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM hr.employees
    GROUP BY department_id
),
high_earners AS (
    SELECT e.employee_id, e.first_name, e.salary, e.department_id
    FROM hr.employees e
    JOIN dept_avg d
      ON e.department_id = d.department_id
    WHERE e.salary > d.avg_salary
      AND d.avg_salary > (SELECT avg_salary FROM company_avg)
)
SELECT * FROM high_earners;

--company average
--department average
--high earners

--2. Dept avg → Rank depts → Top departments → Employees
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM hr.employees
    GROUP BY department_id
),
ranked_depts AS (
    SELECT department_id,
           avg_salary,
           DENSE_RANK() OVER (ORDER BY avg_salary DESC) AS rnk
    FROM dept_avg
),
top_depts AS (
    SELECT department_id
    FROM ranked_depts
    WHERE rnk <= 3
)
SELECT e.employee_id, e.first_name, e.salary, e.department_id
FROM hr.employees e
JOIN top_depts t
  ON e.department_id = t.department_id;
  ---All employees from the top 3 highest-paying departments

  --3. Dept stats → Strong depts → Top earners in dept
  WITH dept_stats AS (
    SELECT department_id,
           COUNT(*) AS emp_count,
           AVG(salary) AS avg_salary
    FROM hr.employees
    GROUP BY department_id
),
strong_depts AS (
    SELECT department_id
    FROM dept_stats
    WHERE emp_count >= 3
      AND avg_salary > 8000
),
dept_max AS (
    SELECT department_id, MAX(salary) AS max_salary
    FROM hr.employees
    GROUP BY department_id
)
SELECT e.employee_id, e.first_name, e.salary, e.department_id
FROM hr.employees e
JOIN strong_depts s
  ON e.department_id = s.department_id
JOIN dept_max m
  ON e.department_id = m.department_id
WHERE e.salary = m.max_salary;

--4. Company avg → Dept performance → High performing depts
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM hr.employees
),
dept_performance AS (
    SELECT department_id,
           AVG(salary) AS avg_salary,
           COUNT(*) AS emp_count
    FROM hr.employees
    GROUP BY department_id
),
high_perf_depts AS (
    SELECT department_id
    FROM dept_performance
    WHERE avg_salary > (SELECT avg_salary FROM company_avg)
      AND emp_count >= 3
)
SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id
FROM hr.employees e
JOIN high_perf_depts h
  ON e.department_id = h.department_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
);
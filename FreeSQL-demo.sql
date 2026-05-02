-- -- -- -- -- -- -- select nvl(NULL,'DATA') from dual
-- -- -- -- -- -- -- select SALARY,NVL(SALARY,0)from HR.EMPLOYEES
-- -- -- -- -- -- select NVL2(20,'Not Null','ABCD')AS result from dual
-- -- -- -- -- -- select NULLIF('DATA','DATA SCIENCE')from dual
-- -- -- -- -- -- select COALESCE(NULL,NULL,20,45)from dual 
-- -- -- -- -- select employee_id,salary,rank()over(order by salary desc)as rank from hr.employees
-- -- -- -- -- select employee_id,salary,dense_rank()over(order by salary desc)as rank from hr.employees
-- -- -- -- -- select employee_id,salary,row_number()over(order by salary desc)as rank from hr.employees
-- -- -- -- -- select employee_id,department_id,salary,rank()
-- -- -- -- -- over(partition by department_id order by salary desc)
-- -- -- -- -- as rank from hr.employees

-- -- -- -- select employee_id,department_id,salary,dense_rank()
-- -- -- -- over(partition by department_id order by salary desc)
-- -- -- -- as rank from hr.employees

-- -- -- CREATE TABLE emp_demo (
-- -- --     emp_id NUMBER,
-- -- --     emp_name VARCHAR2(20),
-- -- --     dept_id NUMBER,
-- -- --     salary NUMBER
-- -- --  );

-- -- -- INSERT INTO emp_demo VALUES (1, 'A', 10, 5000);
-- -- -- INSERT INTO emp_demo VALUES (2, 'B', 10, 6000);
-- -- --  INSERT INTO emp_demo VALUES (3, 'C', 10, 7000);
-- -- --  INSERT INTO emp_demo VALUES (4, 'D', 20, 4000);
-- -- --  INSERT INTO emp_demo VALUES (5, 'E', 20, 4500);
-- -- --  INSERT INTO emp_demo VALUES (6, 'F', 20, 5500);

-- -- -- --  select * from emp_demo

-- -- -- --  select emp_name, dept_id,salary,
-- -- -- --        lag(salary) OVER (partition by dept_id 
-- -- -- --        ORDER BY emp_id) AS next_salary
-- -- -- -- FROM emp_demo;

-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lead(salary) OVER (partition by dept_id 
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo;

-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lag(salary,2) OVER (partition by dept_id 
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo;

-- -- SELECT emp_name, dept_id,salary,
-- --        lead(salary,2) OVER (partition by dept_id 
-- --        ORDER BY emp_id) AS next_salary
-- -- FROM emp_demo;

-- -- SELECT emp_name, dept_id,salary,
-- --        lag(salary,2) OVER (partition by dept_id 
-- --        ORDER BY emp_id) AS next_salary
-- -- FROM emp_demo;

-- -- SELECT emp_name,
-- --        dept_id,
-- --        salary,
-- --        LAG(salary) OVER (ORDER BY emp_id) AS next_salary
-- -- FROM emp_demo;

-- SELECT emp_name,
--        dept_id,
--        salary,
--        Lead(salary) OVER (ORDER BY emp_id) AS next_salary
-- FROM emp_demo;

-- select first_name,salary,CASE
-- WHEN salary>=15000 THEN 'HIGH'
-- WHEN salary>=8000 THEN 'MEDIUM'
-- ELSE 'LOW'
-- END AS salary_category from hr.Employees;

-- write a query to calculate experience and if it>=12 then senior else mid(5-12) level else junior

-- select * from HR.EMPLOYEES
-- SELECT hire_date,FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date) /12) AS experience_years,
-- CASE
--         WHEN MONTHS_BETWEEN(SYSDATE, hire_date) / 12 >= 12 THEN 'Senior'
--         WHEN MONTHS_BETWEEN(SYSDATE, hire_date) / 12 BETWEEN 5 AND 12 THEN 'Mid Level'
--         ELSE 'Junior'
--        END AS emp_level
--        from hr.employees

-- giving hike
-- select first_name,salary,case when salary>=15000 then salary+salary*0.20
-- when salary>=8000 then salary+salary*0.15 else salary end as slaary_hike from hr.employees
select
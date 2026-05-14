-- CREATE TABLE emp_analytics (
--     emp_id NUMBER,
--     emp_name VARCHAR2(50),
--     dept_id NUMBER,
--     salary NUMBER,
--     hire_date DATE
-- );

-- INSERT INTO emp_analytics VALUES (1, 'Amit', 10, 50000, DATE '2022-01-10');
-- INSERT INTO emp_analytics VALUES (2, 'Rahul', 10, 60000, DATE '2021-03-15');
-- INSERT INTO emp_analytics VALUES (3, 'Sita', 20, 55000, DATE '2020-07-20');
-- INSERT INTO emp_analytics VALUES (4, 'Kiran', 20, 70000, DATE '2019-05-11');
-- INSERT INTO emp_analytics VALUES (5, 'Anu', 30, 40000, DATE '2023-02-01');
-- INSERT INTO emp_analytics VALUES (6, 'John', 30, 45000, DATE '2022-08-25');
-- COMMIT;

-- select * from EMP_ANALYTICS
--  EXTRA ANALYTICAL EXAMPLES (GROUPED / PARTITION BY
-- 1. ROW_NUMBER - Top employee per department
-- SELECT * FROM (SELECT emp_name, dept_id, salary,ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rn FROM emp_analytics) WHERE rn = 1;
-- 2. RANK - Top 2 employees per department (handles ties)
--  SELECT *
-- FROM (
--     SELECT emp_name, dept_id, salary,
--            RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
--    FROM emp_analytics
--  )
-- WHERE rnk <= 2;

-- 3. DENSE_RANK - Unique ranking per department
-- SELECT emp_name, dept_id, salary,
--        DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS drnk
-- FROM emp_analytics;

-- 4. LEAD - Next employee salary within same department
-- SELECT emp_name, dept_id, salary,
--        LEAD(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS next_salary
-- FROM emp_analytics;
-- SELECT emp_name, dept_id, salary,
--        LAG(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS prev_salary
-- FROM emp_analytics;

-- 9. Employees earning more than previous employee
-- SELECT emp_name, dept_id, salary,
--        LAG(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS prev_salary
-- FROM emp_analytics
-- WHERE salary > LAG(salary) OVER (PARTITION BY dept_id ORDER BY salary);

SELECT *
FROM (
    SELECT emp_name, dept_id, salary,
           LAG(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS prev_salary
    FROM emp_analytics
) t
WHERE salary > prev_salary;g

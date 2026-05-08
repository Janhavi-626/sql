-- =========================================
-- ORACLE PL/SQL CONTINUE & EXIT EXAMPLES
-- 30 PRACTICE PROGRAMS
-- =========================================

-- 1. EXIT when number reaches 5
BEGIN
    for i in 1..10 loop
    exit when i=5;
    DBMS_OUTPUT.PUT_LINE(i);
    end loop;
    end;

    -- 2. CONTINUE for even numbers
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN MOD(i,2)=0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 3. EXIT from WHILE LOOP
DECLARE
    i NUMBER := 1;
BEGIN
    WHILE i <= 10 LOOP
        EXIT WHEN i = 6;
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END loop;
    end;

    -- 4. CONTINUE in WHILE LOOP
DECLARE
    i NUMBER := 0;
BEGIN
    WHILE i < 10 LOOP
        i := i + 1;

        CONTINUE WHEN MOD(i,2)=0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 5. EXIT Nested Loop
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..5 LOOP
            EXIT WHEN j = 3;
            DBMS_OUTPUT.PUT_LINE(i || ' ' || j);
        END LOOP;
    END LOOP;
END;

 -- 6. CONTINUE Nested Loop
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..5 LOOP
            CONTINUE WHEN j = 2;
            DBMS_OUTPUT.PUT_LINE(i || ' ' || j);
        END LOOP;
    END LOOP;
END;

-- 7. Skip multiples of 3
BEGIN
    FOR i IN 1..20 LOOP
        CONTINUE WHEN MOD(i,3)=0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 8. Stop loop at first multiple of 7
BEGIN
    FOR i IN 1..20 LOOP
        EXIT WHEN MOD(i,7)=0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 9. Skip vowels
DECLARE
    ch CHAR;
BEGIN
    FOR i IN 65..90 LOOP
        ch := CHR(i);

        CONTINUE WHEN ch IN ('A','E','I','O','U');

        DBMS_OUTPUT.PUT_LINE(ch);
    END LOOP;
END;

-- 10. EXIT after factorial exceeds 100
DECLARE
    fact NUMBER := 1;
BEGIN
    FOR i IN 1..10 LOOP
        fact := fact * i;

        EXIT WHEN fact > 100;

        DBMS_OUTPUT.PUT_LINE(fact);
    END LOOP;
END;

-- 10. EXIT after factorial exceeds 100
DECLARE
    fact NUMBER := 1;
BEGIN
    FOR i IN 1..10 LOOP
        fact := fact * i;

        EXIT WHEN fact > 100;

        DBMS_OUTPUT.PUT_LINE(fact);
    END LOOP;
END;

-- 11. CONTINUE for negative numbers
DECLARE
    num NUMBER;
BEGIN
    FOR i IN -5..5 LOOP
        num := i;

        CONTINUE WHEN num < 0;

        DBMS_OUTPUT.PUT_LINE(num);
    END LOOP;
END;

-- 12. EXIT when sum exceeds 50
DECLARE
    total NUMBER := 0;
BEGIN
    FOR i IN 1..20 LOOP
        total := total + i;

        EXIT WHEN total > 50;

        DBMS_OUTPUT.PUT_LINE(total);
    END LOOP;
END;

-- 13. CONTINUE for NULL values
DECLARE
    val NUMBER;
BEGIN
    FOR i IN 1..5 LOOP
        IF i = 3 THEN
            val := NULL;
        ELSE
            val := i;
        END IF;

        CONTINUE WHEN val IS NULL;

        DBMS_OUTPUT.PUT_LINE(val);
    END LOOP;
END;

-- 14. EXIT LOOP immediately
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        EXIT;
    END LOOP;
END;

-- 15. Skip number 5
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN i = 5;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

DECLARE
    num NUMBER := 121;
BEGIN
    FOR i IN 1..5 LOOP
        EXIT WHEN num = 121;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 17. CONTINUE for spaces
DECLARE
    str VARCHAR2(20) := 'HEL LO';
BEGIN
    FOR i IN 1..LENGTH(str) LOOP
        CONTINUE WHEN SUBSTR(str,i,1)=' ';

        DBMS_OUTPUT.PUT_LINE(SUBSTR(str,i,1));
    END LOOP;
END;

-- 18. EXIT when salary > 50000
BEGIN
    FOR rec IN (SELECT employee_id,salary FROM employees) LOOP

        EXIT WHEN rec.salary > 50000;

        DBMS_OUTPUT.PUT_LINE(rec.employee_id);
    END LOOP;
END;

-- 19. CONTINUE for low salaries
BEGIN
    FOR rec IN (SELECT employee_id,salary FROM employees) LOOP

        CONTINUE WHEN rec.salary < 30000;

        DBMS_OUTPUT.PUT_LINE(rec.employee_id || ' ' || rec.salary);
    END LOOP;
END;

-- 20. EXIT from infinite LOOP
DECLARE
    i NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(i);

        EXIT WHEN i = 5;

        i := i + 1;
    END LOOP;
END;

-- 21. CONTINUE in infinite LOOP
DECLARE
    i NUMBER := 0;
BEGIN
    LOOP
        i := i + 1;

        EXIT WHEN i > 10;

        CONTINUE WHEN MOD(i,2)=0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 22. EXIT when character found
DECLARE
    str VARCHAR2(20) := 'ORACLE';
BEGIN
    FOR i IN 1..LENGTH(str) LOOP

        EXIT WHEN SUBSTR(str,i,1)='C';

        DBMS_OUTPUT.PUT_LINE(SUBSTR(str,i,1));
    END LOOP;
END;

-- 23. Skip duplicate values
DECLARE
    TYPE arr IS VARRAY(5) OF NUMBER;
    nums arr := arr(1,2,2,3,4);
BEGIN
    FOR i IN 1..nums.COUNT LOOP

        CONTINUE WHEN i>1 AND nums(i)=nums(i-1);

        DBMS_OUTPUT.PUT_LINE(nums(i));
    END LOOP;
END;

- 24. EXIT after 3 rows
DECLARE
    cnt NUMBER := 0;
BEGIN
    FOR rec IN (SELECT first_name FROM employees) LOOP

        cnt := cnt + 1;

        EXIT WHEN cnt > 3;

        DBMS_OUTPUT.PUT_LINE(rec.first_name);
    END LOOP;
END;
select * from employees

--- 24. EXIT after 3 rows

DECLARE
    cnt NUMBER := 0;
BEGIN
    FOR rec IN (SELECT EMP_NAME FROM employees) LOOP

        cnt := cnt + 1;

        EXIT WHEN cnt > 3;

        DBMS_OUTPUT.PUT_LINE(rec.EMP_NAME);
    END LOOP;
END;

-- 25. CONTINUE for zero
BEGIN
    FOR i IN -2..2 LOOP

        CONTINUE WHEN i = 0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 26. EXIT when prime number found
DECLARE
    n NUMBER := 7;
BEGIN
    FOR i IN 2..n LOOP

        EXIT WHEN MOD(n,i)=0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 27. CONTINUE for special characters
DECLARE
    str VARCHAR2(20) := 'A@B#C';
    ch CHAR;
BEGIN
    FOR i IN 1..LENGTH(str) LOOP

        ch := SUBSTR(str,i,1);

        CONTINUE WHEN ch IN ('@','#');

        DBMS_OUTPUT.PUT_LINE(ch);
    END LOOP;
END;

-- 28. EXIT after 5 iterations
DECLARE
    i NUMBER := 1;
BEGIN
    LOOP
        EXIT WHEN i > 5;

        DBMS_OUTPUT.PUT_LINE(i);

        i := i + 1;
    END LOOP;
END;

---29. CONTINUE for odd numbers
BEGIN
    FOR i IN 1..10 LOOP

        CONTINUE WHEN MOD(i,2)=1;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- 30. EXIT and CONTINUE together
BEGIN
    FOR i IN 1..20 LOOP

        EXIT WHEN i > 15;

        CONTINUE WHEN MOD(i,2)=0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;



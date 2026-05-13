-- =========================================
-- ORACLE SQL & PL/SQL PRACTICE QUERIES
-- IF CONDITIONS, FOR LOOP, WHILE LOOP
-- =========================================

-- 1. Check Positive or Negative Number
DECLARE
    num NUMBER := -5;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Positive');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Negative');
    END IF;
END;

-- 2. Check Even or Odd
DECLARE
    num NUMBER := 10;
BEGIN
    IF MOD(num,2)=0 THEN
        DBMS_OUTPUT.PUT_LINE('Even');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Odd');
    END IF;
END;

-- 3. Find Greater Number
DECLARE
    a NUMBER := 20;
    b NUMBER := 15;
BEGIN
    IF a>b THEN
        DBMS_OUTPUT.PUT_LINE('A is Greater');
    ELSE
        DBMS_OUTPUT.PUT_LINE('B is Greater');
    END IF;
END;

-- 4. Grade Calculation
DECLARE
    marks NUMBER := 85;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade C');
    END IF;
END;

-- 5. Check Eligible for Voting
DECLARE
    age NUMBER := 20;
BEGIN
    IF age >= 18 THEN
        DBMS_OUTPUT.PUT_LINE('Eligible');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Eligible');
    END IF;
END;

-- 6. Salary Bonus Check
DECLARE
    salary NUMBER := 50000;
BEGIN
    IF salary > 40000 THEN
        DBMS_OUTPUT.PUT_LINE('Bonus Applicable');
    END IF;
END;

-- 7. Leap Year Check
DECLARE
    year NUMBER := 2024;
BEGIN
    IF MOD(year,400)=0 OR (MOD(year,4)=0 AND MOD(year,100)!=0) THEN
        DBMS_OUTPUT.PUT_LINE('Leap Year');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Leap Year');
    END IF;
END;
-- 8. Check Null Value
DECLARE
    name VARCHAR2(20):='janavi';
BEGIN
    IF name IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Value is NULL');
        ELSE
        DBMS_OUTPUT.PUT_LINE('Value is  not NULL');
    END IF;
END;

-- 8. Check Null Value
DECLARE
    name VARCHAR2(20);
BEGIN
    IF name IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Value is NULL');
    END IF;
END;

-- 9. Find Largest of Three Numbers
DECLARE
    a NUMBER:=10;
    b NUMBER:=40;
    c NUMBER:=30;
BEGIN
    IF a>b AND a>c THEN
        DBMS_OUTPUT.PUT_LINE('A Largest');
    ELSIF b>c THEN
        DBMS_OUTPUT.PUT_LINE('B Largest');
    ELSE
        DBMS_OUTPUT.PUT_LINE('C Largest');
    END IF;
END;

-- 10. Password Validation
DECLARE
    pwd VARCHAR2(20):='oracle123';
BEGIN
    IF LENGTH(pwd)>=8 THEN
        DBMS_OUTPUT.PUT_LINE('Valid Password');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Weak Password');
    END IF;
END;

-- =========================================
-- FOR LOOP EXAMPLES
-- =========================================
-- 11. Print Numbers 1 to 10
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Current value of i = ' || i);

    END LOOP;
END;

-- 12. Reverse Numbers
BEGIN
    FOR i IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('reverse of numbers i =' || i);
    END LOOP;
END;

-- 13. Multiplication Table
DECLARE
    n NUMBER:=5;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(n || ' x ' || i || ' = ' || n*i);
    END LOOP;
END;

-- 13. Multiplication Table
DECLARE
    n NUMBER:=5;
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(n || ' x ' || i || ' = ' || n*i);
    END LOOP;
END;

declare
total NUMBER:=0;
BEGIN
    for i in 1..10 LOOP
    total:=total+i;
    end loop;
    DBMS_OUTPUT.PUT_LINE('Total='|| total);
    end;

-- 15. Factorial Using FOR LOOP
DECLARE
    n NUMBER:=5;
    fact NUMBER:=1;
BEGIN
    FOR i IN 1..n LOOP
        fact := fact * i;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('total=' ||fact);
END;

-- 16. Print Even Numbers
BEGIN
    FOR i IN 1..20 LOOP
        IF MOD(i,2)=0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;

-- 17. Print Employee Names
BEGIN
    FOR rec IN (SELECT employee_id, first_name FROM employees) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.employee_id || ' ' || rec.first_name);
    END LOOP;
END;

-- 18. Nested FOR LOOP
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..2 LOOP
            DBMS_OUTPUT.PUT_LINE(i || ' ' || j);
        END LOOP;
    END LOOP;
END;

-- 19. Print Squares
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i*i);
    END LOOP;
END;
/


-- 20. Insert Data Using FOR LOOP
BEGIN
    FOR i IN 1..5 LOOP
        INSERT INTO test_table(id,name)
        VALUES(i,'User'||i);
    END LOOP;

    COMMIT;
END;

-- =========================================
-- WHILE LOOP EXAMPLES
-- =========================================
-- 21. Print Numbers Using WHILE LOOP
DECLARE
    i NUMBER:=1;
BEGIN
    WHILE i<=10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i:=i+1;
    END LOOP;
END;

-- 22. Sum Using WHILE LOOP
DECLARE
    i NUMBER:=1;
    total NUMBER:=0;
BEGIN
    WHILE i<=5 LOOP
        total:=total+i;
        i:=i+1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(total);
END;

-- 23. Factorial Using WHILE LOOP
DECLARE
    n NUMBER:=5;
    fact NUMBER:=1;
BEGIN
    WHILE n>0 LOOP
        fact:=fact*n;
        n:=n-1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(fact);
END;

-- 24. Fibonacci Series
DECLARE
    a NUMBER:=0;
    b NUMBER:=1;
    c NUMBER;
    i NUMBER:=1;
BEGIN
    WHILE i<=10 LOOP
        DBMS_OUTPUT.PUT_LINE(a);
        c:=a+b;
        a:=b;
        b:=c;
        i:=i+1;
    END LOOP;
END;

-- 25. Reverse a Number
DECLARE
    num NUMBER:=1234;
    rev NUMBER:=0;
BEGIN
    WHILE num>0 LOOP
        rev:=rev*10 + MOD(num,10);
        num:=TRUNC(num/10);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(rev);
END;

-- 26. Count Digits
DECLARE
    num NUMBER:=98765;
    cnt NUMBER:=0;
BEGIN
    WHILE num>0 LOOP
        cnt:=cnt+1;
        num:=TRUNC(num/10);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(cnt);
END;

-- 27. Palindrome Number Check
DECLARE
    num NUMBER:=121;
    temp NUMBER;
    rev NUMBER:=0;
BEGIN
    temp:=num;

    WHILE num>0 LOOP
        rev:=rev*10 + MOD(num,10);
        num:=TRUNC(num/10);
    END LOOP;

    IF temp=rev THEN
        DBMS_OUTPUT.PUT_LINE('Palindrome');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Palindrome');
    END IF;
END;

-- 28. Print Odd Numbers
DECLARE
    i NUMBER:=1;
BEGIN
    WHILE i<=20 LOOP
        IF MOD(i,2)!=0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;

        i:=i+1;
    END LOOP;
END;

-- 29. Exit WHILE LOOP
DECLARE
    i NUMBER:=1;
BEGIN
    WHILE i<=10 LOOP
        EXIT WHEN i=5;

        DBMS_OUTPUT.PUT_LINE(i);
        i:=i+1;
    END LOOP;
END;

-- 30. Update Salaries Using WHILE LOOP
DECLARE
    i NUMBER:=100;
BEGIN
    WHILE i<=105 LOOP
        UPDATE employees
        SET salary = salary + 1000
        WHERE employee_id = i;

        i:=i+1;
    END LOOP;

    COMMIT;
END;



-- =========================================
-- ORACLE PL/SQL CONTINUE & EXIT EXAMPLES
-- 30 PRACTICE PROGRAMS
-- =========================================

-- 1. EXIT when number reaches 5
BEGIN
    FOR i IN 1..10 LOOP
        EXIT WHEN i = 5;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 2. CONTINUE for even numbers
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN MOD(i,2)=0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 3. EXIT from WHILE LOOP
DECLARE
    i NUMBER := 1;
BEGIN
    WHILE i <= 10 LOOP
        EXIT WHEN i = 6;
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END LOOP;
END;
/

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
/

-- 5. EXIT Nested Loop
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..5 LOOP
            EXIT WHEN j = 3;
            DBMS_OUTPUT.PUT_LINE(i || ' ' || j);
        END LOOP;
    END LOOP;
END;
/

-- 6. CONTINUE Nested Loop
BEGIN
    FOR i IN 1..3 LOOP
        FOR j IN 1..5 LOOP
            CONTINUE WHEN j = 2;
            DBMS_OUTPUT.PUT_LINE(i || ' ' || j);
        END LOOP;
    END LOOP;
END;
/

-- 7. Skip multiples of 3
BEGIN
    FOR i IN 1..20 LOOP
        CONTINUE WHEN MOD(i,3)=0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 8. Stop loop at first multiple of 7
BEGIN
    FOR i IN 1..20 LOOP
        EXIT WHEN MOD(i,7)=0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

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
/

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
/

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
/

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
/

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
/

-- 14. EXIT LOOP immediately
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        EXIT;
    END LOOP;
END;
/

-- 15. Skip number 5
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN i = 5;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 16. EXIT on palindrome number
DECLARE
    num NUMBER := 121;
BEGIN
    FOR i IN 1..5 LOOP
        EXIT WHEN num = 121;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 17. CONTINUE for spaces
DECLARE
    str VARCHAR2(20) := 'HEL LO';
BEGIN
    FOR i IN 1..LENGTH(str) LOOP
        CONTINUE WHEN SUBSTR(str,i,1)=' ';

        DBMS_OUTPUT.PUT_LINE(SUBSTR(str,i,1));
    END LOOP;
END;
/

-- 18. EXIT when salary > 50000
BEGIN
    FOR rec IN (SELECT employee_id,salary FROM employees) LOOP

        EXIT WHEN rec.salary > 50000;

        DBMS_OUTPUT.PUT_LINE(rec.employee_id);
    END LOOP;
END;
/

-- 19. CONTINUE for low salaries
BEGIN
    FOR rec IN (SELECT employee_id,salary FROM employees) LOOP

        CONTINUE WHEN rec.salary < 30000;

        DBMS_OUTPUT.PUT_LINE(rec.employee_id || ' ' || rec.salary);
    END LOOP;
END;
/

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
/

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
/

-- 22. EXIT when character found
DECLARE
    str VARCHAR2(20) := 'ORACLE';
BEGIN
    FOR i IN 1..LENGTH(str) LOOP

        EXIT WHEN SUBSTR(str,i,1)='C';

        DBMS_OUTPUT.PUT_LINE(SUBSTR(str,i,1));
    END LOOP;
END;
/

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
/

-- 24. EXIT after 3 rows
DECLARE
    cnt NUMBER := 0;
BEGIN
    FOR rec IN (SELECT first_name FROM employees) LOOP

        cnt := cnt + 1;

        EXIT WHEN cnt > 3;

        DBMS_OUTPUT.PUT_LINE(rec.first_name);
    END LOOP;
END;
/

-- 25. CONTINUE for zero
BEGIN
    FOR i IN -2..2 LOOP

        CONTINUE WHEN i = 0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 26. EXIT when prime number found
DECLARE
    n NUMBER := 7;
BEGIN
    FOR i IN 2..n LOOP

        EXIT WHEN MOD(n,i)=0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

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
/

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
/

-- 29. CONTINUE for odd numbers
BEGIN
    FOR i IN 1..10 LOOP

        CONTINUE WHEN MOD(i,2)=1;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- 30. EXIT and CONTINUE together
BEGIN
    FOR i IN 1..20 LOOP

        EXIT WHEN i > 15;

        CONTINUE WHEN MOD(i,2)=0;

        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
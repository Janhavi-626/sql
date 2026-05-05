SET SERVEROUTPUT ON;

DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN

  -- 1. Simple IF
  IF v_num > 5 THEN
    DBMS_OUTPUT.PUT_LINE('1: Greater than 5');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF v_num > 5 THEN
    DBMS_OUTPUT.PUT_LINE('2: Greater');
  ELSE
    DBMS_OUTPUT.PUT_LINE('2: Smaller');
  END IF;
  end;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    if v_num>5 THEN
    DBMS_OUTPUT.PUT_LINE('3:Greater');
    elsif v_num =5 THEN
    DBMS_OUTPUT.PUT_LINE('3:Equal');
    ELSE
    DBMS_OUTPUT.PUT_LINE('3:Less');
    END IF;
    END;

DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF MOD(v_num,2)=0 THEN
    DBMS_OUTPUT.PUT_LINE('4: Even');
  ELSE
  DBMS_OUTPUT.PUT_LINE('4: Odd');
  END IF;
  END;

DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF v_salary > 40000 THEN
    DBMS_OUTPUT.PUT_LINE('5: High Salary');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF marks >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('6: A');
  ELSIF marks >= 75 THEN
  DBMS_OUTPUT.PUT_LINE('6: B');
  ELSE
  DBMS_OUTPUT.PUT_LINE('6: C');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF v_name IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('7: Name is NULL');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF user_name = 'admin' THEN
    DBMS_OUTPUT.PUT_LINE('8: Welcome Admin');
  ELSE
    DBMS_OUTPUT.PUT_LINE('8: Access Denied');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
     IF v_num > 0 THEN
    IF v_num < 20 THEN
      DBMS_OUTPUT.PUT_LINE('9: Between 1 and 20');
    END IF;
  END IF;
END;

DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
     IF salary > 25000 THEN
    DBMS_OUTPUT.PUT_LINE('10: Eligible for bonus');
  ELSE
    DBMS_OUTPUT.PUT_LINE('10: Not eligible');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF age < 18 THEN
    DBMS_OUTPUT.PUT_LINE('11: Minor');
  ELSIF age BETWEEN 18 AND 60 THEN
    DBMS_OUTPUT.PUT_LINE('11: Adult');
  ELSE
    DBMS_OUTPUT.PUT_LINE('11: Senior');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF ch BETWEEN 'A' AND 'Z' THEN
    DBMS_OUTPUT.PUT_LINE('12: Uppercase');
  ELSE
    DBMS_OUTPUT.PUT_LINE('12: Not Uppercase');
  END IF;
  END;
  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF b = 0 THEN
    DBMS_OUTPUT.PUT_LINE('13: Cannot divide');
  ELSE
    DBMS_OUTPUT.PUT_LINE('13: Result: ' || a/b);
  END IF;
  END;
  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF price > 1000 THEN
    DBMS_OUTPUT.PUT_LINE('14: 10% Discount');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF age > 21 OR salary >= 30000 THEN
    DBMS_OUTPUT.PUT_LINE('15: Eligible');
  END IF;
  END;

  DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF role = 'admin' OR role = 'manager' THEN
    DBMS_OUTPUT.PUT_LINE('16: Access Granted');
  END IF;
  END;

   DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
     IF NOT status = 'active' THEN
    DBMS_OUTPUT.PUT_LINE('17: User inactive');
  END IF;
  END;

  
   DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
    IF today = TRUNC(today) THEN
    DBMS_OUTPUT.PUT_LINE('18: Today date');
  END IF;
  END;

   DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
     IF a > b THEN
    DBMS_OUTPUT.PUT_LINE('19: A is greater');
  ELSE
    DBMS_OUTPUT.PUT_LINE('19: B is greater');
  END IF;
  END;

    DECLARE
  v_num NUMBER := 10;
  v_salary NUMBER := 50000;
  marks NUMBER := 75;
  v_name VARCHAR2(20);
  user_name VARCHAR2(20) := 'admin';
  salary NUMBER := 30000;
  age NUMBER := 18;
  ch CHAR := 'A';
  a NUMBER := 10;
  b NUMBER := 0;
  price NUMBER := 1200;
  role VARCHAR2(20) := 'manager';
  status VARCHAR2(10) := 'inactive';
  today DATE := SYSDATE;
  dept VARCHAR2(20) := 'IT';
BEGIN
     IF dept = 'HR' THEN
    DBMS_OUTPUT.PUT_LINE('20: HR Department');
  ELSIF dept = 'IT' THEN
    DBMS_OUTPUT.PUT_LINE('20: IT Department');
  ELSE
    DBMS_OUTPUT.PUT_LINE('20: Other Department');
  END IF;

END;
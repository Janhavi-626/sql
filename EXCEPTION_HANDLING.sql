DECLARE
a number:=10;
b number:=0;
c number;
BEGIN
c:=a/b ;
DBMS_OUTPUT.PUT_LINE(c);
EXCEPTION
WHEN ZERO_DIVIDE THEN
DBMS_OUTPUT.PUT_LINE('CANNOT BE DIVISIBLE BY ZERO');
END;

DECLARE
a number:=10;
b number:=2;
c number;
BEGIN
c:=a/b ;
DBMS_OUTPUT.PUT_LINE(c);
EXCEPTION
WHEN ZERO_DIVIDE THEN
DBMS_OUTPUT.PUT_LINE('CANNOT BE DIVISIBLE BY ZERO');
END;



DECLARE
    v_balance NUMBER := 5000;
    v_withdraw NUMBER := 7000;

    insufficient_balance EXCEPTION;

BEGIN

    IF v_withdraw > v_balance THEN
        RAISE insufficient_balance;
    END IF;

    v_balance := v_balance - v_withdraw;

    DBMS_OUTPUT.PUT_LINE('Remaining Balance: ' || v_balance);

EXCEPTION

    WHEN insufficient_balance THEN
        DBMS_OUTPUT.PUT_LINE('Insufficient account balance');

END;
/
DECLARE
    -- Product details
    product_id        NUMBER := 101;
    product_name      VARCHAR2(20);
    discount_percentage number;
    -- Inventory details
    available_stock   NUMBER := 5;
    requested_qty     NUMBER := 10;
    
    -- Billing details
    product_price     NUMBER := 2500;
    total_amount      NUMBER;

    -- Customer details
    customer_name     VARCHAR2(5);

    -- Discount
    discount_percent  NUMBER := 0;
    final_amount      NUMBER;

    --custom exception
    stock_availability exception;

-- BEGIN
--     total_amount:= requested_qty * product_price;
--     dbms_output.put_line(total_amount);
-- end;
--/
-- BEGIN
--     if requested_qty > available_stock then 
--         raise stock_availability;
--     end if;
--     dbms_output.put_line(available_stock);
-- exception
--     when stock_availability then
--     dbms_output.put_line('requested stock is unavailable');
-- end;
-- /
BEGIN
    customer_name:= 'jccbwucqwbcjnwkcjwoucwejkc';
exception
    when value_error then
       dbms_output.put_line('value size exceeded');
end;
/
BEGIN
    total_amount:= 20000;
    discount_percentage:= total_amount / discount_percent;
    dbms_output.put_line(discount_percentage);
exception
    when zero_divide then 
    DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
end;
/
BEGIN
    DBMS_OUTPUT.put_line(final_amount);
end;
/
BEGIN
    total_amount:= 20000;
    discount_percentage:= total_amount / discount_percent;
    dbms_output.put_line(discount_percentage);
exception
    when zero_divide then 
    DBMS_OUTPUT.PUT_LINE('cannot divide by zero');
end;
BEGIN
    customer_name:= 'jccbwucqwbcjnwkcjwoucwejkc';
exception
    when value_error then
       dbms_output.put_line('value size exceeded');
end;
/

BEGIN
    if requested_qty > available_stock then 
        raise stock_availability;
    end if;
    dbms_output.put_line(available_stock);
exception
    when stock_availability then
    dbms_output.put_line('Invalid Stock');
end;
/
BEGIN
        -- Unexpected error generated here
    product_price := TO_NUMBER('ABC');
exception
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);
END;
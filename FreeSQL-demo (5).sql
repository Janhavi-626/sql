CREATE TABLE airlines (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR2(100),
    country VARCHAR2(50)
);

CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    source VARCHAR2(50),
    destination VARCHAR2(50),
    departure_time DATE,
    arrival_time DATE,
    price NUMBER(10,2),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);

INSERT INTO flights VALUES
(101, 1, 'Delhi', 'Mumbai',
 TO_DATE('2026-04-01 08:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-01 10:00:00','YYYY-MM-DD HH24:MI:SS'), 600),

(102, 1, 'Mumbai', 'Bangalore',
 TO_DATE('2026-04-02 09:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-02 11:30:00','YYYY-MM-DD HH24:MI:SS'), 750),

(103, 2, 'Delhi', 'Bangalore',
 TO_DATE('2026-04-01 07:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-01 10:00:00','YYYY-MM-DD HH24:MI:SS'), 500),

(104, 2, 'Bangalore', 'Chennai',
 TO_DATE('2026-04-03 06:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-03 07:00:00','YYYY-MM-DD HH24:MI:SS'), 300),

(105, 3, 'Dubai', 'Delhi',
 TO_DATE('2026-04-01 02:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-01 07:00:00','YYYY-MM-DD HH24:MI:SS'), 1200),

(106, 3, 'Delhi', 'Dubai',
 TO_DATE('2026-04-02 03:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-02 08:00:00','YYYY-MM-DD HH24:MI:SS'), 1100),

(107, 4, 'Doha', 'Mumbai',
 TO_DATE('2026-04-01 04:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-01 09:00:00','YYYY-MM-DD HH24:MI:SS'), 1300),

(108, 4, 'Mumbai', 'Doha',
 TO_DATE('2026-04-02 05:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-02 10:00:00','YYYY-MM-DD HH24:MI:SS'), 1250),

(109, 1, 'Delhi', 'Mumbai',
 TO_DATE('2026-04-01 08:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-01 10:00:00','YYYY-MM-DD HH24:MI:SS'), 600),

(110, 2, 'Delhi', 'Bangalore',
 TO_DATE('2026-04-04 07:00:00','YYYY-MM-DD HH24:MI:SS'),
 TO_DATE('2026-04-04 10:00:00','YYYY-MM-DD HH24:MI:SS'), 550);
 select * from airlines

 WITH expensive_flights AS (
    SELECT * FROM flights WHERE price > 500
)
SELECT * FROM expensive_flights;

WITH flight_details AS (
    SELECT a.airline_name, f.source, f.destination, f.price
    FROM flights f
    JOIN airlines a ON f.airline_id = a.airline_id
)
SELECT * FROM flight_details;

WITH avg_price AS (
    SELECT airline_id, AVG(price) AS avg_price
    FROM flights
    GROUP BY airline_id
)
SELECT * FROM avg_price;


WITH ranked_flights AS (
    SELECT f.*, 
           RANK() OVER (PARTITION BY airline_id ORDER BY price DESC) AS rnk
    FROM flights f
)
SELECT * FROM ranked_flights;

WITH ranked_flights AS (
    SELECT f.*, 
           RANK() OVER (PARTITION BY airline_id ORDER BY price DESC) AS rnk
    FROM flights f
)
SELECT * 
FROM ranked_flights
WHERE rnk = 1;

WITH flight_paths (flight_id, source, destination, path) AS (
    
    SELECT flight_id, source, destination, source || ' -> ' || destination
    FROM flights
    WHERE source = 'Delhi'

    UNION ALL
    SELECT f.flight_id, fp.source, f.destination,
           fp.path || ' -> ' || f.destination
    FROM flight_paths fp
    JOIN flights f ON fp.destination = f.source
)
SELECT * FROM flight_paths;

WITH duplicates AS (
    SELECT source, destination, departure_time, COUNT(*) AS cnt
    FROM flights
    GROUP BY source, destination, departure_time
    HAVING COUNT(*) > 1
)
SELECT * FROM duplicates;

WITH running_total AS (
    SELECT f.*,
           SUM(price) OVER (
               PARTITION BY airline_id 
               ORDER BY departure_time
           ) AS running_total
    FROM flights f
)
SELECT * FROM running_total;

WITH flight_count AS (
    SELECT airline_id, COUNT(*) AS total_flights
    FROM flights
    GROUP BY airline_id
),
avg_price AS (
    SELECT airline_id, AVG(price) AS avg_price
    FROM flights
    GROUP BY airline_id
)
SELECT a.airline_name, fc.total_flights, ap.avg_price
FROM airlines a
JOIN flight_count fc ON a.airline_id = fc.airline_id
JOIN avg_price ap ON a.airline_id = ap.airline_id;

SELECT *
FROM flights
WHERE price > 500;

SELECT *
FROM flights
WHERE flight_id IN (
    SELECT flight_id FROM flights WHERE price > 500
);
SELECT 
    (SELECT airline_name 
     FROM airlines a 
     WHERE a.airline_id = f.airline_id) AS airline_name,
    f.source,
    f.destination,
    f.price
FROM flights f;

SELECT airline_id,
       (SELECT AVG(price) 
        FROM flights f2 
        WHERE f2.airline_id = f1.airline_id) AS avg_price
FROM flights f1
GROUP BY airline_id;

SELECT airline_name
FROM airlines a
WHERE airline_id IN (
    SELECT airline_id
    FROM flights
    GROUP BY airline_id
    HAVING AVG(price) > 700
);

SELECT f1.*,
       (SELECT COUNT(*) 
        FROM flights f2
        WHERE f2.airline_id = f1.airline_id
          AND f2.price > f1.price) + 1 AS rank_no
FROM flights f1;

SELECT *
FROM flights f1
WHERE price = (
    SELECT MAX(price)
    FROM flights f2
    WHERE f2.airline_id = f1.airline_id
);
SELECT 
    f1.source,
    f1.destination AS stop1,
    (SELECT f2.destination
     FROM flights f2
     WHERE f2.source = f1.destination
     AND ROWNUM = 1) AS stop2
FROM flights f1
WHERE f1.source = 'Delhi';

SELECT *
FROM flights f
WHERE (source, destination, departure_time) IN (
    SELECT source, destination, departure_time
    FROM flights
    GROUP BY source, destination, departure_time
    HAVING COUNT(*) > 1
);

SELECT f1.*,
       (SELECT SUM(f2.price)
        FROM flights f2
        WHERE f2.airline_id = f1.airline_id
          AND f2.departure_time <= f1.departure_time) AS running_total
FROM flights f1
ORDER BY airline_id, departure_time;

SELECT airline_name,
       (SELECT COUNT(*) 
        FROM flights f 
        WHERE f.airline_id = a.airline_id) AS total_flights,
       (SELECT AVG(price) 
        FROM flights f 
        WHERE f.airline_id = a.airline_id) AS avg_price
FROM airlines a;
-- Below are the basic select statment, Select x, y, where xy is column, from is followed by database

-- Example 1
use sql_store;
SELECT 
    *
FROM
    customers
WHERE
    customer_id = 1
ORDER BY first_name;

-- in the selcted columns, you can add algorithm to modify the selected columns in example2
-- in the "AS" statement, if you want to use a name with space, you need to add quotes
-- Example 2

SELECT 
    last_name,
    first_name,
    points,
    (points + 10) * 100 AS 'discount factor'
FROM
    customers;

-- DISTINCT after SELECT 
SELECT DISTINCT
    state
FROM
    customers;

-- Practice 1: Return name, unit price, new price(price*1.1)
SELECT 
    name, unit_price, unit_price * 1.1 AS new_price
FROM
    products;
-- -----------------------------------------------------------------

SELECT 
    *
FROM
    customers
WHERE
    points > 3000;
-- exercise
-- Get the orderd placed after my birthday
SELECT 
    *
FROM
    orders
WHERE
    order_date >= '2000-01-12';

-- -----------------------------------------------------
-- AND OR and NOT Operations
SELECT 
    *
FROM
    customers;

-- AND clause
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01'
        AND points > 1000;
-- OR
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01'
        OR points > 1000;

-- Combination, using parenthsis for clarify, AND has high priority
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01'
        OR (points > 1000 AND state = 'VA');

-- NOT clause
SELECT 
    *
FROM
    customers
WHERE
    NOT (birth_date > '1990-01-01'
        OR points > 1000);

-- exercise
SELECT 
    *
FROM
    order_items
WHERE
    order_id = 6
        AND unit_price * quantity > 30;

-- ---------------------------------------
-- IN clause: to combine multiple target condition

SELECT 
    *
FROM
    customers
WHERE
    state IN ('VA' , 'FL', 'GA');

-- ------------------------------
-- BETWEEN clause >= and <=

SELECT 
    *
FROM
    customers
WHERE
    points BETWEEN 1000 AND 3000;

-- -------------------------
-- LIKE clause, b% means anything start with "b" or "B"
-- similarily %b% means anything with "b" or "B"
SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE '%b%';

-- using _b means anything with second letter is b or b
SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE '_____y';-- there are six letters before y

SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'field';
-- if we put an ^ before field as ^field, it means last name start with field
-- if we put an $ after field as field$, it means last name end with field
-- to search for multiple words use |

SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'field$|mac|rose';

-- using [] to makesure there is g and i before letter e
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP '[gi]e';
-- a-h means a to h, - means range [a-h]e

SELECT 
    *
FROM
    customers
WHERE
    first_name IN ('ELKA' OR 'AMBUR')
        OR last_name REGEXP 'EY$|ON$|^MY|SE|B[ru]';

-- ---------------------------------
-- NULL clause

select * from customers
where phone is not null;

-- ----------------
-- Order BY clause, desc or asc

select * from customers
order by first_name desc, state desc;

-- -----------------------------
-- LIMIT clause
-- to set pages
-- page 1: 1 - 3
-- page 2: 4 - 6
-- page 3: 7 - 9

-- to select on page 3, use limit 6, 3
select * from customers
limit 6, 3;
-- it skips first 6 and select 3 items after
 








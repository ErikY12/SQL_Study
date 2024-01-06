use sql_store;

-- Chapter 3
-- Inner Joins

SELECT *
FROM orders JOIN customers 
ON orders.customer_id = customers.customer_id;

-- In the combined table, we need to clarify which customer_id column we are selecting
-- therefore we need to use orders.customer_id

-- To simplify
select order_id, o.customer_id, first_name, last_name
from orders o join customers c
on o.customer_id = c.customer_id;
-- --------------------------------------------
-- Joining multiple database
select * from order_items oi join sql_inventory.products p
on oi.product_id = p.product_id;

-- -------------------
-- Self Join

use sql_hr;
select e.employee_id, e.first_name, m.employee_id as manager
from employees e join employees m
on e.reports_to = m.employee_id;

-- Join multiple tables
-- join order_status

use sql_store;
select o.order_id, o.order_date, c.first_name, c.last_name, os.name as status 
from orders o 
join customers c 
	on o.customer_id = c.customer_id
join order_statuses os
	on o.status = os.order_status_id;
    
-- ----------------------------------
-- compound join composite primary key
-- join table where the condition needs multiple columns
select *
from order_items oi
join order_item_notes oin
	on oi.order_id = oin.order_id
    and oi.product_id = oin.product_id;
    
-- --------------------------------
-- Implicit join syntax (I do not recommend use this often)
select * from orders o, customers c
where o.customer_id = c.customer_id;
-- -----------------------
-- outer joins

select c.customer_id, c.first_name, o.order_id
from customers c
left join orders o
	on c.customer_id = o.customer_id
    -- c is the base data, we left join the o to c whether the on condition is satisfied
    -- right join use o as base data
order by c.customer_id; 
-- -------------------
-- outer join multiple tables

select c.customer_id, c.first_name, o.order_id, sh.name as shipper
from customers c
left join orders o
	on c.customer_id = o.customer_id
left join shippers sh
	on o.shipper_id = sh.shipper_id
order by c.customer_id; 
-- -------------------------------------
-- self outer joins

use sql_hr;
select e.employee_id, e.first_name, m.first_name as manager
from employees e
left join employees m
	on e.reports_to = m.employee_id; -- this include employee without manager
-- --------------------------------------
-- USING clause
-- The goal for using "USING" is to simplify the duplicated columns when using ON
use sql_store;	
select o.order_id, c.first_name, sh.name as shipper
from orders o
left join customers c
	using(customer_id)
left join shippers sh
	using(shipper_id); -- USING only works when col name is same
-- when use USING in composite key, we type USING(order_id, product_id)

-- ----------------------
-- Natural Join(Let the system decide how to join tables)
select o.order_id, c.first_name
from orders o
natural join customers c;
-- ------------------------
-- cross joins,
select c.first_name, p.name as product
from customers c -- implicit way: from customers c, orders o
cross join products p
order by c.first_name;
-- ----------------------
-- UNION, to combine rows from multiple tables
select order_id, order_date, 'Active' as status
from orders
where order_date >= '2019-01-01'
Union
select order_id, order_date, 'Archived' as status
from orders
where order_date < '2019-01-01';
-- Must have same numbers of col
-- ------------------------------

--1. Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street, "addresses".city, "addresses".state, "addresses".zip
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

--2. Get all orders and their line items (orders, quantity and product).
SELECT "products".description, "line_items".quantity, "orders".order_date
FROM "line_items"
JOIN "orders" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id;

--3. Which warehouses have cheetos?
SELECT "warehouse_product".warehouse_id, "warehouse".warehouse
FROM "warehouse_product"
JOIN "products" ON "warehouse_product".product_id = "products".id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'cheetos';

--4.  Which warehouses have diet pepsi?
SELECT "warehouse_product".warehouse_id, "warehouse".warehouse
FROM "warehouse_product"
JOIN "products" ON "warehouse_product".product_id = "products".id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'diet pepsi';

--5.  Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".id, count(*)
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".id;

--6.  How many customers do we have?
SELECT COUNT(*)
from "customers";

--7.  How many products do we carry?
SELECT COUNT(*)
from "products";

--8.  What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand)
FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';
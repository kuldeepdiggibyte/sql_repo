

CREATE DATABASE ecommerce;
USE ecommerce;
go

CREATE TABLE gold_member_users (
    userid INTEGER,
    user_name VARCHAR(100),
    signup_date DATE
);

CREATE TABLE  users (
    userid INTEGER,
    user_name VARCHAR(100),
    signup_date DATE
);

CREATE TABLE sales (
    userid INTEGER,
    user_name VARCHAR(100),
    created_date DATE,
    product_id INTEGER
);

CREATE TABLE product (
    product_id INTEGER,
    product_name VARCHAR(100),
    price INTEGER
);

INSERT INTO gold_member_users VALUES 
(001,'kuldeep','2017-09-22'), (002,'kartik','2017-04-21'),(003,'hardik','2017-04-21'), (004,'hari','2017-04-21')

INSERT INTO users VALUES 
(001,'rajesh','2014-09-02'), (003,'Michel','2015-01-15'), (002,'Mary','2014-04-11');

INSERT INTO sales VALUES 
(001,'John','2017-04-19',2), (002,'Mary','2019-12-18',1), (003,'Michel','2020-07-20',3), 
(004,'rahul','2019-10-23',2), (005,'vijay','2018-03-19',3), (006,'raju','2016-12-20',2), 
(007,'John','2016-11-09',1), (008,'John','2016-05-20',3), (009,'Michel','2017-09-24',1), 
(010,'John','2017-03-11',2), (011,'John','2016-03-11',1), (002,'Mary','2016-11-10',1), 
(002,'Mary','2017-12-07',2), (003,'Michel','2020-05-20',1), (003,'Michel','2020-01-20',3);

INSERT INTO product VALUES 
(1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330);

SELECT 
    (SELECT COUNT(*) FROM gold_member_users) AS gold_member_users_count,
    (SELECT COUNT(*) FROM users) AS users_count,
    (SELECT COUNT(*) FROM sales) AS sales_count,
    (SELECT COUNT(*) FROM product) AS product_count;

SELECT 
    userid,
    user_name,
    SUM(price) AS total_amount_spent
FROM sales
JOIN product ON sales.product_id = product.product_id
GROUP BY userid, user_name;


SELECT DISTINCT
    created_date AS date,
    user_name AS customer_name
FROM sales;

'''8.Find the first product purchased by each customer using 3 tables(users, sales, product)'''

SELECT 
    u.user_name,
    MIN(p.product_name) AS first_product_purchased
FROM users u
JOIN sales s ON u.userid = s.userid
JOIN product p ON s.product_id = p.product_id
GROUP BY u.userid, u.user_name
ORDER BY MIN(s.created_date);

'''9.What is the most purchased item of each customer and how many times the customer has purchased it:'''

SELECT 
    user_name AS customer_name,
    product_name AS most_purchased_item,
    COUNT(*) AS item_count
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY user_name, product_name
ORDER BY item_count DESC;

'''10.Find out the customer who is not the gold_member_user '''

SELECT user_name
FROM users
WHERE user_name NOT IN (SELECT user_name FROM gold_member_users);

'''11.What is the amount spent by each customer when he was the gold_member user '''

SELECT 
    g.user_name,
    SUM(p.price) AS total_amount_spent
FROM gold_member_users g
JOIN sales s ON g.userid = s.userid
JOIN product p ON s.product_id = p.product_id
GROUP BY g.userid, g.user_name;


12.Find the Customers names whose name starts with M 


select user_name 
from users 
where user_name LIKE 'M%';

'''13.Find the Distinct customer Id of each customer '''

select distinct userid, user_name
from users;

'''14.Change the Column name from product table as price_value from price '''
EXEC sp_rename 'product.price', 'price_value', 'COLUMN';


'''15.Change the Column value product_name – Ipad to Iphone from product table '''

UPDATE product
SET product_name = 'Iphone'
WHERE product_name = 'Ipad';

'''16.Change the table name of gold_member_users to gold_membership_users '''
EXEC sp_rename 'gold_member_users', 'gold_membership_users';

ALTER TABLE gold_member_users
ADD Status VARCHAR(3) DEFAULT 'No';

UPDATE gold_member_users
SET Status = 'Yes';


BEGIN TRANSACTION;

DELETE FROM users WHERE userid = 1;
-- Rollback
ROLLBACK;

BEGIN TRANSACTION;

DELETE FROM users WHERE userid = 2;
-- Rollback
ROLLBACK;


INSERT INTO product (product_id, product_name, price_value) VALUES (3, 'Laptop', 330);

SELECT product_id, product_name, price_value, COUNT(*) AS duplicates_count
FROM product
GROUP BY product_id, product_name, price_value
HAVING COUNT(*) > 1;






















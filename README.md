


```markdown


This project aims to create and manage a database system for an ecommerce company. 

1. **Create Database as ecommerce:**
   - Use SQL command `CREATE DATABASE ecommerce;` to create the database.

2. **Create 4 tables (gold_member_users, users, sales, product) under the above database(ecommerce):**
   - Use SQL commands to create each table with appropriate columns and data types.

3. **Insert the values provided above with respective datatypes:**
   - Use SQL `INSERT INTO` statements to insert values into each table.

4. **Show all the tables in the same database(ecommerce):**
   - Utilize SQL command `SHOW TABLES;` or equivalent depending on the database system.

5. **Count all the records of all four tables using single query:**
   - Write a SQL query that uses `COUNT(*)` on each table and possibly joins them together.

6. **What is the total amount each customer spent on ecommerce company:**
   - Write a SQL query to sum up the sales amount for each customer.

7. **Find the distinct dates of each customer visited the website:**
   - Write a SQL query that retrieves distinct dates for each customer.

8. **Find the first product purchased by each customer using 3 tables(users, sales, product):**
   - Utilize SQL joins and possibly `MIN()` function to find the first purchase for each customer.

9. **What is the most purchased item of each customer and how many times the customer has purchased it:**
   - Write a SQL query to find the most purchased item for each customer along with its count.

10. **Find out the customer who is not the gold_member_user:**
    - Write a SQL query to identify customers who are not gold members.

11. **What is the amount spent by each customer when he was the gold_member user:**
    - Write a SQL query to calculate the total amount spent by gold member users.

12. **Find the Customers names whose name starts with M:**
    - Write a SQL query using `LIKE` operator to find customers whose names start with 'M'.

13. **Find the Distinct customer Id of each customer:**
    - Write a SQL query to retrieve distinct customer IDs.

14. **Change the Column name from product table as price_value from price:**
    - Use SQL `ALTER TABLE` command to rename the column.

15. **Change the Column value product_name – Ipad to Iphone from product table:**
    - Use SQL `UPDATE` statement to change the column value.

16. **Change the table name of gold_member_users to gold_membership_users:**
    - Use SQL `ALTER TABLE` command to rename the table.

17. **Create a new column as Status in the table created above gold_membership_users:**
    - Use SQL `ALTER TABLE` command to add a new column and then update its values accordingly.

18. **Delete the users_ids 1,2 from users table and roll back changes:**
    - Use SQL `DELETE FROM` statement to remove the rows, then employ transactions to roll back if needed.

19. **Insert one more record as same (3,'Laptop',330) as product table:**
    - Use SQL `INSERT INTO` statement to add the new record.

20. **Write a query to find the duplicates in product table:**
    - Write a SQL query using `GROUP BY` and `HAVING` to identify duplicates based on certain criteria.
```

2. **Query to Find Number of Different Products Sold for Each Date:**

   - **Create table product_details with provided data:**
     - Execute SQL `CREATE TABLE product_details (sell_date DATE, product VARCHAR(255));` to create the table.

   - **Insert provided data into the table:**
     - Execute SQL `INSERT INTO product_details (sell_date, product) VALUES ('2020-05-30', 'Headphones'), ('2020-06-01','Pencil'), ('2020-06-02','Mask'), ('2020-05-30','Basketball'), ('2020-06-01','Book'), ('2020-06-02', 'Mask'), ('2020-05-30','T-Shirt');` to insert the data into the table.

   - **Write SQL query to find the number of different products sold for each date:**
     - Use SQL `SELECT sell_date, COUNT(DISTINCT product) AS num_of_products, GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS product_names FROM product_details GROUP BY sell_date;` to get the desired result.

3. **Query to Find Total Salary of Each Department:**

   - **Create table employee_details with provided data:**
     - Execute SQL `CREATE TABLE employee_details (id_deptname VARCHAR(255), emp_name VARCHAR(255), salary INT);` to create the table.

   - **Insert provided data into the table:**
     - Execute SQL `INSERT INTO employee_details (id_deptname, emp_name, salary) VALUES ('1111-MATH', 'RAHUL', 10000), ('1111-MATH', 'RAKESH', 20000), ('2222-SCIENCE', 'AKASH', 10000), ('222-SCIENCE', 'ANDREW', 10000), ('22-CHEM', 'ANKIT', 25000), ('3333-CHEM', 'SONIKA', 12000), ('4444-BIO', 'HITESH', 2300), ('44-BIO', 'AKSHAY', 10000);` to insert the data into the table.

   - **Write SQL query to find the total salary of each department:**
     - Use SQL `SELECT id_deptname, SUM(salary) AS total_salary FROM employee_details GROUP BY id_deptname;` to get the desired result.

4. **Query to Find Gmail Accounts with Latest and First Signup Date and Difference Between Both Dates:**

   - **Create table user_accounts with provided data:**
     - Execute SQL `CREATE TABLE user_accounts (id INT, email_id VARCHAR(255), signup_date DATE);` to create the table.

   - **Insert provided data into the table:**
     - Execute SQL `INSERT INTO user_accounts (id, email_id, signup_date) VALUES (1, 'Rajesh@Gmail.com', '2022-02-01'), (2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'), (3, 'Hitest@Gmail.com', '2020-09-08'), (4, 'Salil@Gmmail.com', '2019-07-05'), (5, 'Himanshu@Yahoo.com', '2023-05-09'), (6, 'Hitesh@Twitter.com', '2015-01-01'), (7, 'Rakesh@facebook.com', null);` to insert the data into the table.

   - **Write SQL query to find gmail accounts with latest and first signup date and difference between both dates:**
     - Use SQL `SELECT email_id, MAX(signup_date) AS latest_signup, MIN(signup_date) AS first_signup, DATEDIFF(MAX(signup_date), MIN(signup_date)) AS date_difference FROM user_accounts WHERE email_id LIKE '%@gmail.com' GROUP BY email_id;` to get the desired result.

   - **Write SQL query to replace null value with '1970-01-01':**
     - Use SQL `UPDATE user_accounts SET signup_date = '1970-01-01' WHERE signup_date IS NULL;` to replace null values in the signup_date column with '1970-01-01'.


5. **Using Window Functions on Sales Data:**

   - **Create table sales_data with columns: product_id, sale_date, and quantity_sold:**
     - Execute SQL `CREATE TABLE sales_data (product_id INT, sale_date DATE, quantity_sold INT);` to create the table.

   - **Insert sample data into the table:**
     - Execute SQL `INSERT INTO sales_data (product_id, sale_date, quantity_sold) VALUES (1, '2022-01-01', 20), (2, '2022-01-01', 15), (1, '2022-01-02', 10), (2, '2022-01-02', 25), (1, '2022-01-03', 30), (2, '2022-01-03', 18), (1, '2022-01-04', 12), (2, '2022-01-04', 22);` to insert the data.

   - **Assign rank by partition based on product_id and find the latest product_id sold:**
     - Use SQL window function `ROW_NUMBER()` partitioned by product_id to assign ranks and then select rows with rank = 1 to find the latest product_id sold.

   - **Retrieve the quantity_sold value from a previous row and compare the quantity_sold:**
     - Use SQL window function `LAG()` to retrieve the quantity_sold value from the previous row and then compare it with the current quantity_sold.

   - **Partition based on product_id and return the first and last values in ordered set:**
     - Use SQL window functions `FIRST_VALUE()` and `LAST_VALUE()` to return the first and last values in an ordered set partitioned by product_id.

6. **Designing ER Diagram for University Database System:**

   - **Entities and Attributes:**
     - Student: student_id (PK), name, date_of_birth, email
     - Course: course_code (PK), title, credit_hours
     - Instructor: instructor_id (PK), name, office_location
     - Major: major_id (PK), name
     - Department: department_id (PK), name
   - **Relationships and Cardinality Constraints:**
     - Student-Course: Many-to-Many
     - Course-Instructor: One-to-Many
     - Student-Major: Many-to-One
     - Course-Department: Many-to-One

   - **ER Diagram:**
     - Include graphical representation of the entities, relationships, and cardinality constraints as per the above requirements.


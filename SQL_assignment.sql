/* 
====================================================
Assignment: SQL Basics
====================================================
*/

/*
   --------------------------------------------------------------------
*/

/*
1.	Create a table called employees with the following structure?
	emp_id (integer, should not be NULL and should be a primary key).
	emp_name (text, should not be NULL).
	age (integer, should have a check constraint to ensure the age is at least 18).
	email (text, should be unique for each employee).
	salary (decimal, with a default value of 30,000).
	Write the SQL query to create the above table with all constraints.

	-- Answer:
*/
CREATE TABLE employees (emp_id INT PRIMARY KEY,
						emp_name VARCHAR(30) NOT NULL,
						age INT CHECK(age >= 18),
                        email VARCHAR(30) UNIQUE,
                        salary DECIMAL(10, 2) DEFAULT(30000)

);
/*
   --------------------------------------------------------------------
*/

/* 
2. Explain the purpose of constraints and how they help maintain data integrity in a database. 
   Provide examples of common types of constraints.
   
   -- Answer:
   
   Constraints are like rules applied to a column to get a consistent and reliable data. 
   They bascally prevent to enter invalid data as a record.
   Common types of constraints:
   (i) UNIQUE -> ensures all value in the column are unique
   (ii) NOT NULL -> ensures no value is empty or NULL
   (iii) CHECK -> checks for a condition to satisfy before entering a value
   (iv) DEFAULT -> provides a default value, if noting entered
   (v) PRIMARY KEY -> this ensures that each record is uniquely identified
   
*/
/*
   --------------------------------------------------------------------
*/
/* 
3. Why would you apply the NOT NULL constraint to a column? 
   Can a primary key contain NULL values? Justify your answer.
   
   -- Answer:
   
   NOT NULL basically ensures that no value in the column has NULL Value.
   NO, a primary key cannot contain NULL values because NULL Value means missing or unknown value,
   but primary key is used to uniquely identify the records, so it must be unique and not null.
   
*/
/*
   --------------------------------------------------------------------
*/
/* 
4. Explain the steps and SQL commands used to add or remove constraints on an existing table. 
   Provide an example for both adding and removing a constraint.
   
   -- Answer:
   
   - Adding a constraint -> Use ALTER TABLE command and also specify the column and type of constraint to add, with a constraint name.
   - example: adding UNIQUE constraint on the EMAIL column.
   ALTER TABLE user_details
   ADD CONSTRAINT unique_email UNIQUE(email)
   
   
   - Removing a constraint -> Use ALTER TABLE and simply use DROP to remove the constraint.
   - example: remove a UNIQUE constraint on the "email" column.
   ALTER TABLE user_details
   DROP INDEX unique_email;
*/
/*
   --------------------------------------------------------------------
*/
/* 
5. Explain the consequences of attempting to insert, update, or delete data in a way 
   that violates constraints. Provide an example of an error message that might occur 
   when violating a constraint.
   
   -- Answer:
   
*/
/*
   --------------------------------------------------------------------
*/
/* 
6. You created a products table without constraints as follows:
*/
CREATE TABLE products (
	product_id INT,
	product_name VARCHAR(50),
	price DECIMAL(10, 2)
);
/*
   Now, you realise that:
   • The product_id should be a primary key.
   • The price should have a default value of 50.00.
   
   -- Answer:
*/
ALTER TABLE products 
ADD PRIMARY KEY(product_id),
MODIFY price DECIMAL(10,2) DEFAULT 50.00;
/*
   --------------------------------------------------------------------
*/
/*
7. 	You have two tables:	
	Table 1: Students
	Table 2: Classes
    
	Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

	-- Answer:
	SELECT student_name, class_name FROM
	Students INNER JOIN Classes
	ON Students.class_id = Classes.class_id;
*/
/*
   --------------------------------------------------------------------
*/
/*
8.  Consider the following three tables:
	Table 1: Orders
    Table 2: Customers
    Table 3: Products
    
    Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
	listed even if they are not associated with an order 
	Hint: (use INNER JOIN and LEFT JOIN).
    
    -- Answer:
    SELECT  order_id, customer_name, product_name 
    FROM
    Products LEFT JOIN Orders
    ON Products.order_id = Orders.order_id
    INNER JOIN Customers
    ON Customers.customer_id = Orders.customer_id;
*/
/*
   --------------------------------------------------------------------
*/
/* 
9. 	Given the following tables: 
	Table 1: Sales
    Table 2: Products
    Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
    
    
    -- Answer:
    SELECT product_name, SUM(amount) AS Total_Sales FROM
    Sales INNER JOIN Products
    ON Sales.product_id = Products.product_id
    GROUP BY product_name;
*/
/*
   --------------------------------------------------------------------
*/    
/*
10. You are given three tables:
	Table 1: Orders
    Table 2: Customers
    Table 3: Order_Details
    Write a query to display the order_id, customer_name, and the quantity of products ordered by each
	customer using an INNER JOIN between all three tables.
    
    -- Answer:
    SELECT order_id, customer_name, quantity FROM
    Orders INNER JOIN Customers
    ON Orders.customer_id = Customers.customer_id
    INNER JOIN Order_Details
    ON Orders.order_id = Order_Details.order_id;
*/
/*
   --------------------------------------------------------------------
*/  

/*
================================================================================
								MAVEN MOVIES DATABASE
================================================================================
									SQL COMMANDS
================================================================================
*/

/*
--------------------------------------------------------------------
Question 1: Identify the primary keys and foreign keys in maven movies db. 
Discuss the differences.
*/

/*
--------------------------------------------------------------------
Question 2: List all details of actors
*/
SELECT * FROM Actor;

/*
--------------------------------------------------------------------
Question 3: List all customer information from DB
*/
SELECT * FROM Customer;

/*
--------------------------------------------------------------------
Question 4: List different countries
*/
SELECT DISTINCT Country FROM country;

/*
--------------------------------------------------------------------
Question 5: Display all active customers
*/
SELECT * FROM customer
WHERE active = 1;

/*
--------------------------------------------------------------------
Question 6: List of all rental IDs for customer with ID 1
*/
SELECT rental_id FROM rental
WHERE customer_id = 1;


/*
--------------------------------------------------------------------
Question 7: Display all the films whose rental duration is greater than 5
*/
SELECT * FROM film
WHERE rental_duration > 5;


/*
--------------------------------------------------------------------
Question 8: List the total number of films whose replacement cost is greater 
than $15 and less than $20
*/
select COUNT(*) AS Total_Film FROM film 
WHERE replacement_cost > 15 AND replacement_cost < 20;

/*
--------------------------------------------------------------------
Question 9: Display the count of unique first names of actors
*/
SELECT COUNT(DISTINCT first_name) AS Unique_Name FROM actor;

/*
--------------------------------------------------------------------
Question 10: Display the first 10 records from the customer table
*/
SELECT * FROM Customer
LIMIT 10;

/*
--------------------------------------------------------------------
Question 11: Display the first 3 records from the customer table whose 
first name starts with 'b'
*/
SELECT * FROM Customer
WHERE first_name LIKE "b%"
ORDER BY customer_id
LIMIT 3;

/*
--------------------------------------------------------------------
Question 12: Display the names of the first 5 movies which are rated as 'G'
*/
SELECT title, rating FROM film
WHERE rating = "G"
ORDER BY film_id
LIMIT 5;
/*
--------------------------------------------------------------------
Question 13: Find all customers whose first name starts with "a"
*/
SELECT * FROM Customer
WHERE first_name LIKE "a%";

/*
--------------------------------------------------------------------
Question 14: Find all customers whose first name ends with "a"
*/
SELECT * FROM Customer
WHERE first_name LIKE "%a";

/*
--------------------------------------------------------------------
Question 15: Display the list of first 4 cities which start and end with 'a'
*/
SELECT * FROM city
WHERE city LIKE "a%a"
ORDER BY city_id
LIMIT 4;

/*
--------------------------------------------------------------------
Question 16: Find all customers whose first name have "NI" in any position
*/
SELECT * FROM Customer 
WHERE first_name LIKE "%NI%";

/*
--------------------------------------------------------------------
Question 17: Find all customers whose first name have "r" in the second position
*/
SELECT * FROM Customer 
WHERE first_name LIKE "_r%";

/*
--------------------------------------------------------------------
Question 18: Find all customers whose first name starts with "a" and are 
at least 5 characters in length
*/
SELECT * FROM Customer 
WHERE first_name LIKE "a____%";

/*
--------------------------------------------------------------------
Question 19: Find all customers whose first name starts with "a" and ends with "o"
*/
SELECT * FROM Customer 
WHERE first_name LIKE "a%o";

/*
--------------------------------------------------------------------
Question 20: Get the films with pg and pg-13 rating using IN operator
*/
SELECT * FROM film
WHERE rating IN ("PG","PG-13");

/*
--------------------------------------------------------------------
Question 21: Get the films with length between 50 to 100 using between operator
*/
SELECT * FROM film 
WHERE length BETWEEN 50 AND 100;

/*
--------------------------------------------------------------------
Question 22: Get the top 50 actors using limit operator
*/
SELECT * FROM actor
LIMIT 50;

/*
--------------------------------------------------------------------
Question 23: Get the distinct film ids from inventory table
*/
SELECT DISTINCT(film_id) FROM inventory;






/*
================================================================================
                        FUNCTIONS BASIC AGGREGATE FUNCTIONS
================================================================================
*/

/*
Question 1: Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function.
*/
SELECT COUNT(rental_id) AS total_rentals
FROM rental;
    
/*
Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.
*/
SELECT AVG(DATEDIFF(return_date, rental_date)) AS avg_rental_duration_days
FROM rental;

/*
Question 3: Display the first name and last name of customers in uppercase.
Hint: Use the UPPER() function.
*/
SELECT
UPPER(first_name) AS first_name_uppercase,
UPPER(last_name) AS last_name_uppercase
FROM customer;

/*
Question 4: Extract the month from the rental date and display it alongside the rental ID.
Hint: Employ the MONTH() function.
*/
SELECT
rental_id, rental_date,
MONTH(rental_date) AS rental_month
FROM rental;

/*
Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT() in conjunction with GROUP BY.
*/
SELECT customer_id, COUNT(rental_id) AS rental_count
FROM rental
GROUP BY customer_id
ORDER BY rental_count DESC;

/*
Question 6: Find the total revenue generated by each store.
Hint: Combine SUM() and GROUP BY.
*/
SELECT c.store_id, SUM(p.amount) AS total_revenue
FROM payment AS p
JOIN customer AS c 
ON p.customer_id = c.customer_id
GROUP BY c.store_id;

/*
Question 7: Determine the total number of rentals for each category of movies.
Hint: JOIN film_category, film, and rental tables, then use COUNT() and GROUP BY.
*/
SELECT cat.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM rental AS r
JOIN inventory AS i 
ON r.inventory_id = i.inventory_id
JOIN film_category AS fc 
ON i.film_id = fc.film_id
JOIN category AS cat 
ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY total_rentals DESC;

/*
Question 8: Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG() and GROUP BY.
*/
SELECT l.name AS language,
AVG(f.rental_rate) AS average_rental_rate
FROM film AS f
JOIN language AS l 
ON f.language_id = l.language_id
GROUP BY l.name;


/*
================================================================================
									JOINS
================================================================================
*/
-- -----------------------------------------------------------------------------
-- Question 9: Display the title of the movie, customer's first name, and last name who rented it.
-- Hint: Use JOIN between the film, inventory, rental, and customer tables.
-- -----------------------------------------------------------------------------
SELECT f.title, c.first_name, c.last_name
FROM rental AS r
JOIN customer AS c 
ON r.customer_id = c.customer_id
JOIN inventory AS i 
ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id;

-- -----------------------------------------------------------------------------
-- Question 10: Retrieve the names of all actors who have appeared in the film "ACADEMY DINOSAUR".
-- Hint: Use JOIN between the film_actor, film, and actor tables.
-- -----------------------------------------------------------------------------
SELECT a.first_name, a.last_name
FROM actor AS a
JOIN film_actor AS fa 
ON a.actor_id = fa.actor_id
JOIN film AS f 
ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';

-- -----------------------------------------------------------------------------
-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer and payment tables, then use SUM() and GROUP BY.
-- -----------------------------------------------------------------------------
SELECT c.first_name, c.last_name,
SUM(p.amount) AS total_spent
FROM customer AS c
JOIN payment AS p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- -----------------------------------------------------------------------------
-- Question 12: List the titles of movies rented by customers in 'London'.
-- Hint: JOIN customer, address, city, rental, inventory, and film tables.
-- -----------------------------------------------------------------------------
SELECT c.first_name, c.last_name,
f.title AS rented_movie_title
FROM customer AS c
JOIN address AS a ON c.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN rental AS r ON c.customer_id = r.customer_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
WHERE ci.city = 'London';

/*
================================================================================
							Advanced Joins and GROUP BY
================================================================================
*/

-- -----------------------------------------------------------------------------
-- Question 13: Display the top 5 rented movies along with the number of times they've been rented.
-- Hint: JOIN film, inventory, and rental tables, then use COUNT() and GROUP BY, and limit the results.
-- -----------------------------------------------------------------------------
SELECT f.title,
COUNT(r.rental_id) AS rental_count
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- -----------------------------------------------------------------------------
-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT(DISTINCT) and GROUP BY.
-- -----------------------------------------------------------------------------
SELECT c.first_name, c.last_name
FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;

/*
================================================================================
								WINDOW FUNCTION
================================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. Rank the customers based on the total amount they've spent on rentals.
-- -----------------------------------------------------------------------------
SELECT c.first_name, c.last_name,
SUM(p.amount) AS total_spent,
RANK() OVER (ORDER BY SUM(p.amount) DESC) AS customer_rank
FROM customer AS c
JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- -----------------------------------------------------------------------------
-- 2. Calculate the cumulative revenue generated by each film over time.
-- -----------------------------------------------------------------------------
SELECT f.title, p.payment_date, p.amount,
SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

-- -----------------------------------------------------------------------------
-- 3. Determine the average rental duration for each film, considering films with similar lengths.
-- -----------------------------------------------------------------------------
SELECT title, length, rental_duration,
AVG(rental_duration) OVER (PARTITION BY length) AS avg_duration_for_similar_length
FROM film;

-- -----------------------------------------------------------------------------
-- 4. Identify the top 3 films in each category based on their rental counts.
-- -----------------------------------------------------------------------------
SELECT
category_name,
title,
rental_count
FROM (	SELECT
        c.name AS category_name,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) as rn
		FROM rental AS r
		JOIN inventory AS i ON r.inventory_id = i.inventory_id
		JOIN film AS f ON i.film_id = f.film_id
		JOIN film_category AS fc ON f.film_id = fc.film_id
		JOIN category AS c ON fc.category_id = c.category_id
		GROUP BY c.name, f.title
) AS FilmRentalCounts
WHERE rn <= 3;

-- -----------------------------------------------------------------------------
-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
-- -----------------------------------------------------------------------------
SELECT
crt.customer_id,
crt.total_rentals,
crt.total_rentals - avg_rentals.avg_total AS difference_from_avg
FROM
(SELECT customer_id, COUNT(rental_id) AS total_rentals FROM rental GROUP BY customer_id) AS crt
CROSS JOIN
(SELECT AVG(total_rentals) AS avg_total FROM (SELECT COUNT(rental_id) AS total_rentals 
												FROM rental 
												GROUP BY customer_id) AS inner_avg) 
												AS avg_rentals;

-- -----------------------------------------------------------------------------
-- 6. Find the monthly revenue trend for the entire rental store over time.
-- -----------------------------------------------------------------------------
SELECT
payment_month,
monthly_revenue,
SUM(monthly_revenue) OVER (ORDER BY payment_month) AS cumulative_revenue
FROM 
(	SELECT
	DATE_FORMAT(payment_date, '%Y-%m') AS payment_month,
	SUM(amount) AS monthly_revenue
    FROM payment
    GROUP BY payment_month
) AS MonthlyRevenue;

-- -----------------------------------------------------------------------------
-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
-- -----------------------------------------------------------------------------
SELECT
cs.customer_id,
c.first_name,
c.last_name,
cs.total_spent
FROM (	SELECT
        customer_id,
        SUM(amount) AS total_spent,
        NTILE(5) OVER (ORDER BY SUM(amount) DESC) as percentile_rank
		FROM payment
		GROUP BY customer_id
) AS cs
JOIN
customer c ON cs.customer_id = c.customer_id
WHERE
cs.percentile_rank = 1;

-- -----------------------------------------------------------------------------
-- 8. Calculate the running total of rentals per category, ordered by rental count.
-- -----------------------------------------------------------------------------
SELECT
category_name,
rental_count,
SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM (
    SELECT
	c.name AS category_name,
	COUNT(r.rental_id) AS rental_count
    FROM
	rental AS r
    JOIN inventory AS i ON r.inventory_id = i.inventory_id
    JOIN film_category AS fc ON i.film_id = fc.film_id
    JOIN category AS c ON fc.category_id = c.category_id
    GROUP BY c.name
) AS CategoryRentalCounts;

-- -----------------------------------------------------------------------------
-- 9. Find the films that have been rented less than the average rental count for their respective categories.
-- -----------------------------------------------------------------------------
SELECT
title,
category_name,
rental_count,
avg_category_rentals
FROM (
    SELECT
	f.title,
	c.name AS category_name,
	COUNT(r.rental_id) AS rental_count,
	AVG(COUNT(r.rental_id)) OVER (PARTITION BY c.name) AS avg_category_rentals
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY f.film_id, f.title, c.name
) AS FilmCategoryRentals
WHERE rental_count < avg_category_rentals;


-- -----------------------------------------------------------------------------
-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
-- -----------------------------------------------------------------------------
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS payment_month,
SUM(amount) AS monthly_revenue
FROM payment
GROUP BY payment_month
ORDER BY monthly_revenue DESC
LIMIT 5;






/*
================================================================================
							Normalisation & CTE
================================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. First Normal Form (1NF):
--  a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
-- -----------------------------------------------------------------------------
-- ANSWER:
-- The `film` table violates 1NF. The `special_features` column contains a comma-separated list of values (e.g., 'Trailers,Commentaries,Deleted Scenes').
-- 1NF requires that every column in a table holds atomic (indivisible) values, and each row is unique.
--
-- To normalize it to 1NF, we would create a separate junction table to handle the many-to-many relationship between films and special features.
--
-- Step 1: Create a new table for special features to store each feature individually.
-- CREATE TABLE special_feature (
--     feature_id INT PRIMARY KEY AUTO_INCREMENT,
--     feature_name VARCHAR(50) UNIQUE NOT NULL
-- );
--
-- Step 2: Create a junction table to link films and special features.
-- CREATE TABLE film_special_feature (
--     film_id INT NOT NULL,
--     feature_id INT NOT NULL,
--     PRIMARY KEY (film_id, feature_id),
--     FOREIGN KEY (film_id) REFERENCES film(film_id),
--     FOREIGN KEY (feature_id) REFERENCES special_feature(feature_id)
-- );
--
-- Step 3: Populate the new tables by extracting the data from the original `film` table and then drop the `special_features` column from the `film` table.

-- -----------------------------------------------------------------------------
-- 2. Second Normal Form (2NF):
--  a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.
-- -----------------------------------------------------------------------------
-- ANSWER:
-- Let's examine the `film_actor` table.
-- The primary key of `film_actor` is a composite key: (`actor_id`, `film_id`).
--
-- To be in 2NF, a table must first be in 1NF, and all non-key attributes must be fully functionally dependent on the entire primary key.
-- This means that no non-key attribute can be dependent on only a part of the composite primary key.
--
-- In `film_actor`, the only non-key attribute is `last_update`.
-- - Does `last_update` depend only on `actor_id`? No, it records when the specific film-actor relationship was updated.
-- - Does `last_update` depend only on `film_id`? No, for the same reason.
--
-- The `last_update` attribute depends on the combination of both `actor_id` and `film_id`. Therefore, it is fully functionally dependent on the primary key.
-- The `film_actor` table IS in 2NF. It does not violate 2NF.

-- -----------------------------------------------------------------------------
-- 3. Third Normal Form (3NF):
--  a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
-- -----------------------------------------------------------------------------
-- ANSWER:
-- The Sakila schema is generally well-normalized. However, we can find a transitive dependency by looking at relationships between tables.
-- A transitive dependency exists when a non-key attribute depends on another non-key attribute.
--
-- Consider the `address` table in relation to the `city` and `country` tables.
-- The `address` table has `address_id` (PK) and `city_id` (FK).
-- The `city` table has `city_id` (PK) and `country_id` (FK).
--
-- If we had a denormalized table, for example `customer_full_address`, that looked like this:
-- `(customer_id, address, city_name, country_name)`
-- Here, `address` determines `city_name`, and `city_name` determines `country_name`.
-- This is a transitive dependency: `address` -> `city_name` -> `country_name`.
--
-- The Sakila schema correctly normalizes this to 3NF by splitting it into `address`, `city`, and `country` tables.
-- - `address` table: (`address_id`, `address`, `city_id`)
-- - `city` table: (`city_id`, `city`, `country_id`)
-- - `country` table: (`country_id`, `country`)
-- This removes the transitive dependency. `country` now depends on `country_id`, which is linked via the `city` table.

-- -----------------------------------------------------------------------------
-- 4. Normalization Process:
--  a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
-- -----------------------------------------------------------------------------
-- ANSWER:
-- Let's use the `film` table as an example.
--
-- Unnormalized Form (violates 1NF):
-- The `special_features` column contains multiple values like 'Trailers,Commentaries'.
--
-- Step 1: Achieve First Normal Form (1NF)
-- To achieve 1NF, we must ensure all columns contain atomic values. We remove the repeating group in `special_features`.
-- We create a new table `film_special_feature` to store each feature separately.
--
-- `film` table (after 1NF): The `special_features` column is removed.
-- `film_special_feature` table (new): Contains `film_id` and `special_feature` columns.
--
-- Example data in `film_special_feature`:
-- film_id | special_feature
-- --------|------------------
-- 1       | Trailers
-- 1       | Commentaries
--
-- Step 2: Achieve Second Normal Form (2NF)
-- To be in 2NF, the table must be in 1NF and have no partial dependencies. This rule applies to tables with composite primary keys.
-- The `film` table has a single-column primary key (`film_id`), so it automatically satisfies 2NF.
-- Our new `film_special_feature` table would have a composite key (`film_id`, `special_feature`). Since there are no other columns, it has no partial dependencies and is also in 2NF.

-- -----------------------------------------------------------------------------
-- 5. CTE Basics:
--  a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in.
-- -----------------------------------------------------------------------------
WITH ActorFilmCounts AS (
    SELECT
        actor_id,
        COUNT(film_id) AS film_count
    FROM
        film_actor
    GROUP BY
        actor_id
)
SELECT
    a.first_name,
    a.last_name,
    afc.film_count
FROM
    actor a
JOIN
    ActorFilmCounts afc ON a.actor_id = afc.actor_id;

-- -----------------------------------------------------------------------------
-- 6. CTE with Joins:
--  a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
-- -----------------------------------------------------------------------------
WITH FilmLanguageInfo AS (
    SELECT
        f.title,
        l.name AS language_name,
        f.rental_rate
    FROM
        film f
    JOIN
        language l ON f.language_id = l.language_id
)
SELECT
    title,
    language_name,
    rental_rate
FROM
    FilmLanguageInfo;

-- -----------------------------------------------------------------------------
-- 7. CTE for Aggregation:
--  a. Write a query using a CTE to find the total revenue generated by each customer from the customer and payment tables.
-- -----------------------------------------------------------------------------
WITH CustomerRevenue AS (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM
        payment
    GROUP BY
        customer_id
)
SELECT
    c.first_name,
    c.last_name,
    cr.total_revenue
FROM
    customer c
JOIN
    CustomerRevenue cr ON c.customer_id = cr.customer_id;

-- -----------------------------------------------------------------------------
-- 8. CTE with Window Functions:
--  a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
-- -----------------------------------------------------------------------------
WITH FilmRankByDuration AS (
    SELECT
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) as film_rank
    FROM
        film
)
SELECT
    title,
    rental_duration,
    film_rank
FROM
    FilmRankByDuration;

-- -----------------------------------------------------------------------------
-- 9. CTE and Filtering:
--  a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table.
-- -----------------------------------------------------------------------------
WITH FrequentRenters AS (
    SELECT
        customer_id,
        COUNT(rental_id) AS rental_count
    FROM
        rental
    GROUP BY
        customer_id
    HAVING
        COUNT(rental_id) > 2
)
SELECT
    c.first_name,
    c.last_name,
    fr.rental_count
FROM
    customer c
JOIN
    FrequentRenters fr ON c.customer_id = fr.customer_id;

-- -----------------------------------------------------------------------------
-- 10. CTE for Date Calculations:
--  a. Write a query using a CTE to find the total number of rentals made each month.
-- -----------------------------------------------------------------------------
WITH MonthlyRentals AS (
    SELECT
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
        COUNT(rental_id) AS total_rentals
    FROM
        rental
    GROUP BY
        rental_month
)
SELECT
    rental_month,
    total_rentals
FROM
    MonthlyRentals
ORDER BY
    rental_month;

-- -----------------------------------------------------------------------------
-- 11. CTE and Self-Join:
--  a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together.
-- -----------------------------------------------------------------------------
WITH ActorPairs AS (
    SELECT
        fa1.film_id,
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id
    FROM
        film_actor fa1
    JOIN
        film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
)
SELECT
    f.title,
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor1,
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor2
FROM
    ActorPairs ap
JOIN
    actor a1 ON ap.actor1_id = a1.actor_id
JOIN
    actor a2 ON ap.actor2_id = a2.actor_id
JOIN
    film f ON ap.film_id = f.film_id;

-- -----------------------------------------------------------------------------
-- 12. CTE for Recursive Search:
--  a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager.
-- -----------------------------------------------------------------------------
-- NOTE: The standard Sakila `staff` table does not have a hierarchical structure (e.g., a 'reports_to' column).
-- The following is a general example of how a recursive CTE would be structured if such a relationship existed.
-- Let's assume a 'manager_id' column exists that references another 'staff_id'.

/*
-- Hypothetical query structure:
WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor member: select the starting manager
    SELECT
        staff_id,
        first_name,
        last_name,
        manager_id,
        1 AS level
    FROM
        staff
    WHERE
        staff_id = 1 -- Example: starting with the top manager

    UNION ALL

    -- Recursive member: join staff to the hierarchy
    SELECT
        s.staff_id,
        s.first_name,
        s.last_name,
        s.manager_id,
        eh.level + 1
    FROM
        staff s
    JOIN
        EmployeeHierarchy eh ON s.manager_id = eh.staff_id
)
SELECT * FROM EmployeeHierarchy;
*/
######## BASIC QUERIES 
#Query 1: we want everything
SELECT *
FROM customers;

#Query 2: we want only first and last name and birth date
SELECT first_name, last_name, birth_date
FROM customers;

#Query 3: we do not want to repeat first name
SELECT DISTINCT first_name
FROM customers;

#Query 4: Don’t want to repeat state
SELECT DISTINCT state
FROM customers;

######## SORTING
#Query 5: Order by city 
SELECT *
FROM customers 
ORDER BY City;

#Query 6: Order by first name, last name
SELECT * 
FROM customers 
ORDER BY first_name, last_name;
 
#Query 7: Order by first name but in reverse
SELECT * 
FROM customers
ORDER BY first_name DESC;

######## FILTERING
#Query 8: Only want state to be CA
SELECT * 
FROM customers 
WHERE state = "CA";

#Query 9: Only want specific range of birthday
SELECT *
FROM customers 
WHERE birth_date BETWEEN "1980-01-01" and "2000-01-01";

#Query 10:  Reaffirm above with only first, last, and points
SELECT first_name, last_name, points
FROM customers 
WHERE birth_date BETWEEN "1980-01-01" and "2000-01-01";

#Query 11: Only want to return names of people with points > 1500
SELECT first_name, last_name, points
FROM customers 
WHERE points > 1500;

######## AND, OR, NOT
#Query 12: Return names of people who have specific birth_date OR live in Cali 
SELECT first_name, last_name
FROM customers
WHERE birth_date = "1985-02-07" or state ="CA";

#Query 13: Return records for persons not named Romola and not live in Cali 
SELECT *
FROM customers
WHERE NOT first_name = "Romola" and NOT state = "CA";

#Query 14: Return records for persons not born in certain date
SELECT * 
FROM customers
WHERE NOT birth_date BETWEEN "1980-01-01" and "2000-01-01";

######## JOINS
#Query 15: INNER JOIN to find first_name occurring on both table (before doing show both tables)
SELECT customers.customer_id, customers.first_name, customer2.customer_id, customer2.first_name
FROM customers
INNER JOIN customer2
ON customers.first_name = customer2.first_name;

#Query 16: INNER JOIN to find same city on both 
SELECT customers.customer_id, customers.first_name, customers.city, customer2.customer_id, customer2.first_name, customer2.city
FROM customers
INNER JOIN customer2
ON customers.city = customer2.city;

#Query 17: LEFT OUTER JOIN to find matching names (will show all contents of table1 including null matches with t2)
SELECT customers.customer_id, customers.first_name, customer2.customer_id, customer2.first_name
FROM customers
LEFT OUTER JOIN customer2
ON customers.first_name = customer2.first_name;

#Query 18: RIGHT OUTER JOIN to find matching points (shows 5 matches btwn t1&t2, last record of t2)
SELECT customers.first_name, customers.points, customer2.first_name, customer2.points
FROM customers
RIGHT OUTER JOIN customer2
ON customers.points = customer2.points;
-- Nicholas Sutherland (gcg2ws)
-- Pallavi Vemuri (tut4un)
	
-- 1) 
use sakila; 
SELECT first_name, last_name FROM actor WHERE actor_id IN 
	(SELECT actor_id from film_actor WHERE film_id LIKE 
     		(SELECT film_id FROM film WHERE title LIKE "ACADEMY DINOSAUR"));
    	 
-- 2) 
use sakila; 
SELECT category.name AS category_name, COUNT(film.film_id) AS count 
	FROM category 
   		JOIN film_category ON category.category_id = film_category.category_id
		JOIN film ON film_category.film_id = film.film_id
			GROUP BY category.name;
    
-- 3) 
use sakila; 
SELECT rating, avg(rental_duration)
	FROM film
   		GROUP BY rating;

-- 4) 
use sakila; 
SELECT customer.first_name AS first, customer.last_name AS last, COUNT(rental.rental_id) AS count
	FROM customer 
   		JOIN rental ON customer.customer_id = rental.customer_id
		GROUP BY customer.first_name, customer.last_name;

-- 5)
use sakila; 
SELECT store.store_id AS storeID, COUNT(rental.rental_id) AS count
FROM store
JOIN inventory on store.store_id = inventory.store_id
JOIN rental on inventory.inventory_id = rental.inventory_id
GROUP BY store.store_id
ORDER BY COUNT(rental.rental_id) DESC
LIMIT 1;
 	
-- 6)
use sakila; 
SELECT category.name AS cat, COUNT(rental.rental_id) AS count
FROM category
JOIN film_category on category.category_id = film_category.category_id
JOIN inventory on film_category.film_id = inventory.film_id
JOIN rental on inventory.inventory_id = rental.inventory_id
GROUP BY category.name
ORDER BY COUNT(rental.rental_id) DESC
LIMIT 1;

-- 7)
use sakila; 
SELECT category.name AS category_name, AVG(film.rental_rate) AS rate 
	FROM category 
   		JOIN film_category ON category.category_id = film_category.category_id
		JOIN film ON film_category.film_id = film.film_id
			GROUP BY category.name;

-- 8)
use sakila; 
SELECT film.film_id, film.title, rental.rental_date 
	FROM film 
         JOIN inventory ON film.film_id = inventory.film_id
         JOIN rental ON inventory.inventory_id = rental.inventory_id
         WHERE rental.return_date is NULL
			ORDER BY film.title;
   

-- 9)
use sakila; 
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS name, SUM(film.rental_rate) AS spending 
	FROM customer 
   		JOIN rental ON customer.customer_id = rental.customer_id
		JOIN inventory ON rental.inventory_id = inventory.inventory_id
        JOIN film ON inventory.film_id = film.film_id
			GROUP BY CONCAT(customer.first_name, ' ', customer.last_name);
   
-- 10) 
use sakila; 
SELECT language.name AS lang, AVG(film.rental_duration) AS duration 
	FROM language 
   		LEFT JOIN film ON film.language_id = language.language_id
			GROUP BY language.name;





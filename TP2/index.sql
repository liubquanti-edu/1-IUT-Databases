SELECT * FROM actor WHERE first_name = "Scarlett";

SELECT * FROM actor WHERE last_name = "Johansson";

SELECT DISTINCT last_name FROM actor;

SELECT COUNT(*) FROM actor;

SELECT last_name from actor GROUP BY last_name HAVING COUNT(*) = 1;

SELECT last_name from actor GROUP BY last_name HAVING COUNT(*) > 1;

SELECT AVG(length) FROM film;

SELECT category.name, AVG(film.length) AS average_length
FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
GROUP BY category.name;

SELECT category.name, COUNT(film.film_id) AS film_number FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
GROUP BY category.name;

SELECT actor.first_name, actor.last_name, film.title
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id;

SELECT film.title
FROM film
JOIN language ON film.language_id = language.language_id
WHERE language.language_id = 6;

SELECT DISTINCT actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
ORDER BY actor.last_name, actor.first_name;

SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, actor.first_name, actor.last_name
ORDER BY film_count DESC
LIMIT 1;

SELECT inventory.inventory_id
FROM film
JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE film.title = 'Academy Dinosaur'
AND inventory.store_id = 1
AND rental.return_date IS NULL;

SELECT
film.title,
rental.rental_date,
DATE_ADD(rental.rental_date, INTERVAL film.rental_duration DAY) AS return_due
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE film.title = 'Academy Dinosaur'
AND rental.return_date IS NULL;

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
SELECT
NOW(),
inventory.inventory_id,
customer.customer_id,
staff.staff_id
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN customer ON customer.first_name = 'Mary' AND customer.last_name = 'Smith'
JOIN staff ON staff.first_name = 'Mike' AND staff.last_name = 'Hillyer'
WHERE film.title = 'Academy Dinosaur'
AND inventory.store_id = 1
LIMIT 1;

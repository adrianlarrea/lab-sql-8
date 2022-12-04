
USE sakila;

-- 1.Write a query to display for each store its store ID, city, and country.
select *
from store;
select *
from address;
select *
from city;
select *
from country;

SELECT s.store_id, city , country
FROM store s
JOIN address a
ON s.address_id = a.address_id
JOIN city ci
ON ci.city_id = a.city_id
JOIN country co
ON co.country_id = ci.country_id
;


-- 2.Write a query to display how much business, in dollars, each store brought in.
select *
from store;
select *
from customer;
select *
from payment;

SELECT s.store_id, sum(p.amount) as business_amount
FROM store s
JOIN customer c
ON s.store_id = c.store_id
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY store_id;


-- 3. Which film categories are longest? avg length of film with categories
select *
from film;
select *
from film_category;

SELECT fc.category_id, avg(f.length) 
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
GROUP BY fc.category_id
ORDER BY avg(f.length) desc;



-- 4.Display the most frequently rented movies in descending order. movie titles and inventory
select *
from film;
select *
from inventory;
select *
from rental;


SELECT f.title, COUNT(r.rental_ID) 
FROM film f
JOIN inventory i USING(film_id)
JOIN rental r USING(inventory_id)
GROUP BY f.title
ORDER BY COUNT(r.rental_ID) DESC;

-- 5.List the top five genres in gross revenue in descending order. categories

select *
from film_category;
select *
from film;
select *
from category;

SELECT c.name, SUM(p.amount) as 'gross_revenue'
FROM category c
JOIN film_category fc USING(category_id)
JOIN inventory i 
ON i.film_id = fc.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
JOIN payment p
ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY SUM(p.amount) DESC
LIMIT 5;



-- 6.Is "Academy Dinosaur" available for rent from Store 1?

select *
from store;
select *
from inventory;
select *
from film;

SELECT i.store_id, f.title, i.inventory_id
FROM film f
JOIN inventory i USING(film_id)
WHERE f.title = 'Academy Dinosaur' and i.store_id = 1;


-- 7.Get all pairs of actors that worked together. self-join

SELECT *
FROM film_actor;

SELECT fa1.actor_id AS actor1, fa2.actor_id AS actor2
FROM film_actor fa1
JOIN film_actor fa2
ON (fa1.actor_id > fa2.actor_id) AND (fa1.film_id = fa2.film_id);


-- 8.Get all pairs of customers that have rented the same film more than 3 times. NO



-- 9.For each film, list actor that has acted in more films. NO


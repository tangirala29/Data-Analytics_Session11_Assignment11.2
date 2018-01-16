use sakila;
show tables;

select * from customer;
select * from rental;
select * from film;
select * from film category;
select * from rental;
select * from payment;

/*Assignment 11.2 - problem-1*/
SELECT 	c.customer_id AS 'Customer ID', 
		c.first_name AS 'First Name', 
		c.last_name AS 'Last Name', 
        SUM(amount) AS 'Total Paid'
FROM sakila.payment p
	INNER JOIN customer c ON
	p.customer_id = c.customer_id
GROUP BY c.customer_id
order by sum(amount) desc;

/*list of all the customers who have rented more than 10 horror movies*/
/*Assignment 11.2- problem-2*/
SELECT R.customer_id, COUNT(*) AS cnt 
FROM sakila.rental R LEFT JOIN sakila.inventory I ON R.inventory_id = I.inventory_id 
left JOIN sakila.film F ON I.film_id = F.film_id 
left JOIN sakila.film_category FC on F.film_id = FC.film_id 
left JOIN sakila.category C ON FC.category_id = C.category_id 
WHERE C.name = "Horror" 
GROUP BY R.customer_id HAVING cnt > 10;




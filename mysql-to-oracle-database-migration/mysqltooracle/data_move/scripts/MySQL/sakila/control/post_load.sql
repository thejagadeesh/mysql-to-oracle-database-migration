WHENEVER SQLERROR CONTINUE;

ALTER TRIGGER sakila.film_special_features_STRG ENABLE;
ALTER TRIGGER sakila.film_rating_ETRG ENABLE;

--TODO - YOU NEED TO SORT IDENTITY COLUMNS

ALTER TABLE sakila.actor ENABLE CONSTRAINT PRIMARY;
ALTER TABLE sakila.category ENABLE CONSTRAINT PRIMARY_2;
ALTER TABLE sakila.staff ENABLE CONSTRAINT PRIMARY_14;
ALTER TABLE sakila.film_category ENABLE CONSTRAINT PRIMARY_8;
ALTER TABLE sakila.film_actor ENABLE CONSTRAINT PRIMARY_7;
ALTER TABLE sakila.address ENABLE CONSTRAINT PRIMARY_15;
ALTER TABLE sakila.city ENABLE CONSTRAINT PRIMARY_3;
ALTER TABLE sakila.store ENABLE CONSTRAINT PRIMARY_1;
ALTER TABLE sakila.rental ENABLE CONSTRAINT PRIMARY_13;
ALTER TABLE sakila.payment ENABLE CONSTRAINT PRIMARY_12;
ALTER TABLE sakila.language ENABLE CONSTRAINT PRIMARY_11;
ALTER TABLE sakila.inventory ENABLE CONSTRAINT PRIMARY_10;
ALTER TABLE sakila.film_text ENABLE CONSTRAINT PRIMARY_9;
ALTER TABLE sakila.film ENABLE CONSTRAINT PRIMARY_6;
ALTER TABLE sakila.customer ENABLE CONSTRAINT PRIMARY_5;
ALTER TABLE sakila.country ENABLE CONSTRAINT PRIMARY_4;
ALTER TABLE sakila.rental ENABLE CONSTRAINT rental_date;
ALTER TABLE sakila.store ENABLE CONSTRAINT idx_unique_manager;
ALTER TABLE sakila.city ENABLE CONSTRAINT fk_city_country;
ALTER TABLE sakila.customer ENABLE CONSTRAINT fk_customer_address;
ALTER TABLE sakila.customer ENABLE CONSTRAINT fk_customer_store;
ALTER TABLE sakila.store ENABLE CONSTRAINT fk_store_staff;
ALTER TABLE sakila.store ENABLE CONSTRAINT fk_store_address;
ALTER TABLE sakila.address ENABLE CONSTRAINT fk_address_city;
ALTER TABLE sakila.staff ENABLE CONSTRAINT fk_staff_store;
ALTER TABLE sakila.staff ENABLE CONSTRAINT fk_staff_address;
ALTER TABLE sakila.rental ENABLE CONSTRAINT fk_rental_staff;
ALTER TABLE sakila.rental ENABLE CONSTRAINT fk_rental_inventory;
ALTER TABLE sakila.rental ENABLE CONSTRAINT fk_rental_customer;
ALTER TABLE sakila.film ENABLE CONSTRAINT fk_film_language;
ALTER TABLE sakila.payment ENABLE CONSTRAINT fk_payment_customer;
ALTER TABLE sakila.inventory ENABLE CONSTRAINT fk_inventory_store;
ALTER TABLE sakila.inventory ENABLE CONSTRAINT fk_inventory_film;
ALTER TABLE sakila.film_category ENABLE CONSTRAINT fk_film_category_film;
ALTER TABLE sakila.film_category ENABLE CONSTRAINT fk_film_category_category;
ALTER TABLE sakila.film_actor ENABLE CONSTRAINT fk_film_actor_film;
ALTER TABLE sakila.film ENABLE CONSTRAINT fk_film_language_original;
ALTER TABLE sakila.payment ENABLE CONSTRAINT fk_payment_rental;
ALTER TABLE sakila.film_actor ENABLE CONSTRAINT fk_film_actor_actor;
ALTER TABLE sakila.payment ENABLE CONSTRAINT fk_payment_staff;


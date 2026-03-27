WHENEVER SQLERROR CONTINUE;

ALTER TRIGGER sakila.film_special_features_STRG DISABLE;
ALTER TRIGGER sakila.film_rating_ETRG DISABLE;

 
CREATE DIRECTORY sakila_data_dir AS 'C:\Users\JAGADEESH\Desktop\MIGRATION\mysqltooracle\datamove\2026-03-27_00-41-58\MySQL\sakila\data';
GRANT READ ON DIRECTORY sakila_data_dir TO sakila;
GRANT WRITE ON DIRECTORY sakila_data_dir TO sakila;

CREATE DIRECTORY sakila_log_dir AS 'C:\Users\JAGADEESH\Desktop\MIGRATION\mysqltooracle\datamove\2026-03-27_00-41-58\MySQL\sakila\log';
GRANT READ ON DIRECTORY sakila_log_dir TO sakila;
GRANT WRITE ON DIRECTORY sakila_log_dir TO sakila;

ALTER TABLE sakila.payment DISABLE CONSTRAINT fk_payment_staff;
ALTER TABLE sakila.customer DISABLE CONSTRAINT fk_customer_store;
ALTER TABLE sakila.customer DISABLE CONSTRAINT fk_customer_address;
ALTER TABLE sakila.city DISABLE CONSTRAINT fk_city_country;
ALTER TABLE sakila.store DISABLE CONSTRAINT fk_store_staff;
ALTER TABLE sakila.store DISABLE CONSTRAINT fk_store_address;
ALTER TABLE sakila.address DISABLE CONSTRAINT fk_address_city;
ALTER TABLE sakila.staff DISABLE CONSTRAINT fk_staff_store;
ALTER TABLE sakila.staff DISABLE CONSTRAINT fk_staff_address;
ALTER TABLE sakila.rental DISABLE CONSTRAINT fk_rental_staff;
ALTER TABLE sakila.rental DISABLE CONSTRAINT fk_rental_inventory;
ALTER TABLE sakila.rental DISABLE CONSTRAINT fk_rental_customer;
ALTER TABLE sakila.film DISABLE CONSTRAINT fk_film_language;
ALTER TABLE sakila.payment DISABLE CONSTRAINT fk_payment_customer;
ALTER TABLE sakila.inventory DISABLE CONSTRAINT fk_inventory_store;
ALTER TABLE sakila.inventory DISABLE CONSTRAINT fk_inventory_film;
ALTER TABLE sakila.film_category DISABLE CONSTRAINT fk_film_category_film;
ALTER TABLE sakila.film_category DISABLE CONSTRAINT fk_film_category_category;
ALTER TABLE sakila.film_actor DISABLE CONSTRAINT fk_film_actor_actor;
ALTER TABLE sakila.payment DISABLE CONSTRAINT fk_payment_rental;
ALTER TABLE sakila.film DISABLE CONSTRAINT fk_film_language_original;
ALTER TABLE sakila.film_actor DISABLE CONSTRAINT fk_film_actor_film;
ALTER TABLE sakila.store DISABLE CONSTRAINT PRIMARY_1;
ALTER TABLE sakila.category DISABLE CONSTRAINT PRIMARY_2;
ALTER TABLE sakila.actor DISABLE CONSTRAINT PRIMARY;
ALTER TABLE sakila.rental DISABLE CONSTRAINT PRIMARY_13;
ALTER TABLE sakila.payment DISABLE CONSTRAINT PRIMARY_12;
ALTER TABLE sakila.language DISABLE CONSTRAINT PRIMARY_11;
ALTER TABLE sakila.inventory DISABLE CONSTRAINT PRIMARY_10;
ALTER TABLE sakila.film_text DISABLE CONSTRAINT PRIMARY_9;
ALTER TABLE sakila.address DISABLE CONSTRAINT PRIMARY_15;
ALTER TABLE sakila.staff DISABLE CONSTRAINT PRIMARY_14;
ALTER TABLE sakila.film_category DISABLE CONSTRAINT PRIMARY_8;
ALTER TABLE sakila.film_actor DISABLE CONSTRAINT PRIMARY_7;
ALTER TABLE sakila.film DISABLE CONSTRAINT PRIMARY_6;
ALTER TABLE sakila.customer DISABLE CONSTRAINT PRIMARY_5;
ALTER TABLE sakila.country DISABLE CONSTRAINT PRIMARY_4;
ALTER TABLE sakila.city DISABLE CONSTRAINT PRIMARY_3;
ALTER TABLE sakila.rental DISABLE CONSTRAINT rental_date;
ALTER TABLE sakila.store DISABLE CONSTRAINT idx_unique_manager;


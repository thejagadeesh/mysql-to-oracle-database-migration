CREATE TABLE sakila.film_category_ext (
  "CATEGORY_ID" NUMBER(3,0),
  "FILM_ID" NUMBER(5,0),
  "LAST_UPDATE" DATE)
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.film_category.bad'
LOGFILE sakila_log_dir:'sakila.film_category.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("CATEGORY_ID", 
"FILM_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3"
))
LOCATION ('film_category.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.film_category (SELECT * from sakila.film_category_ext);
commit;

-- drop table sakila.film_category_ext;


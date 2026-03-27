CREATE TABLE sakila.rental_ext (
  "CUSTOMER_ID" NUMBER(5,0),
  "INVENTORY_ID" NUMBER(12,0),
  "LAST_UPDATE" DATE,
  "RENTAL_DATE" DATE,
  "RENTAL_ID" NUMBER(10,0),
  "RETURN_DATE" DATE,
  "STAFF_ID" NUMBER(3,0))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.rental.bad'
LOGFILE sakila_log_dir:'sakila.rental.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("CUSTOMER_ID", 
"INVENTORY_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"RENTAL_DATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"RENTAL_ID", 
"RETURN_DATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"STAFF_ID"
))
LOCATION ('rental.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.rental (SELECT * from sakila.rental_ext);
commit;

-- drop table sakila.rental_ext;


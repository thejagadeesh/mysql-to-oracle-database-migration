CREATE TABLE sakila.inventory_ext (
  "FILM_ID" NUMBER(5,0),
  "INVENTORY_ID" NUMBER(12,0),
  "LAST_UPDATE" DATE,
  "STORE_ID" NUMBER(3,0))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.inventory.bad'
LOGFILE sakila_log_dir:'sakila.inventory.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("FILM_ID", 
"INVENTORY_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"STORE_ID"
))
LOCATION ('inventory.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.inventory (SELECT * from sakila.inventory_ext);
commit;

-- drop table sakila.inventory_ext;


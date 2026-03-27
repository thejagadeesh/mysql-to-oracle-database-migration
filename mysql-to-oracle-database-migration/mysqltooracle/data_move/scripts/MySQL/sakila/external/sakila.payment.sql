CREATE TABLE sakila.payment_ext (
  "AMOUNT" FLOAT,
  "CUSTOMER_ID" NUMBER(5,0),
  "LAST_UPDATE" DATE,
  "PAYMENT_DATE" DATE,
  "PAYMENT_ID" NUMBER(5,0),
  "RENTAL_ID" NUMBER(10,0),
  "STAFF_ID" NUMBER(3,0))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.payment.bad'
LOGFILE sakila_log_dir:'sakila.payment.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("AMOUNT", 
"CUSTOMER_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"PAYMENT_DATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"PAYMENT_ID", 
"RENTAL_ID", 
"STAFF_ID"
))
LOCATION ('payment.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.payment (SELECT * from sakila.payment_ext);
commit;

-- drop table sakila.payment_ext;


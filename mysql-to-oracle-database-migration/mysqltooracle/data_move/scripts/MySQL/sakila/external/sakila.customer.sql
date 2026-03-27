CREATE TABLE sakila.customer_ext (
  "ACTIVE" NUMBER(3,0),
  "ADDRESS_ID" NUMBER(5,0),
  "CREATE_DATE" DATE,
  "CUSTOMER_ID" NUMBER(5,0),
  "EMAIL" VARCHAR2(50 CHAR),
  "FIRST_NAME" VARCHAR2(45 CHAR),
  "LAST_NAME" VARCHAR2(45 CHAR),
  "LAST_UPDATE" DATE,
  "STORE_ID" NUMBER(3,0))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.customer.bad'
LOGFILE sakila_log_dir:'sakila.customer.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("ACTIVE", 
"ADDRESS_ID", 
"CREATE_DATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"CUSTOMER_ID", 
"EMAIL", 
"FIRST_NAME", 
"LAST_NAME", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"STORE_ID"
))
LOCATION ('customer.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.customer (SELECT * from sakila.customer_ext);
commit;

-- drop table sakila.customer_ext;


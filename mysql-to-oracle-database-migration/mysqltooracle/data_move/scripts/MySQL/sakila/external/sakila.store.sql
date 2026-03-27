CREATE TABLE sakila.store_ext (
  "ADDRESS_ID" NUMBER(5,0),
  "LAST_UPDATE" DATE,
  "MANAGER_STAFF_ID" NUMBER(3,0),
  "STORE_ID" NUMBER(3,0))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.store.bad'
LOGFILE sakila_log_dir:'sakila.store.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("ADDRESS_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"MANAGER_STAFF_ID", 
"STORE_ID"
))
LOCATION ('store.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.store (SELECT * from sakila.store_ext);
commit;

-- drop table sakila.store_ext;


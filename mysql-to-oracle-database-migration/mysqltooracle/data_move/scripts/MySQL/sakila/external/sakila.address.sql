CREATE TABLE sakila.address_ext (
  "ADDRESS" VARCHAR2(50 CHAR),
  "ADDRESS2" VARCHAR2(50 CHAR),
  "ADDRESS_ID" NUMBER(5,0),
  "CITY_ID" NUMBER(5,0),
  "DISTRICT" VARCHAR2(20 CHAR),
  "LAST_UPDATE" DATE,
  "LOCATION" geometry(0),
  "PHONE" VARCHAR2(20 CHAR),
  "POSTAL_CODE" VARCHAR2(10 CHAR))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.address.bad'
LOGFILE sakila_log_dir:'sakila.address.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("ADDRESS", 
"ADDRESS2", 
"ADDRESS_ID", 
"CITY_ID", 
"DISTRICT", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"LOCATION", 
"PHONE", 
"POSTAL_CODE"
))
LOCATION ('address.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.address (SELECT * from sakila.address_ext);
commit;

-- drop table sakila.address_ext;


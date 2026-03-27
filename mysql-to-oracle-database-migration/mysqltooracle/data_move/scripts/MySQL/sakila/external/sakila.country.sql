CREATE TABLE sakila.country_ext (
  "COUNTRY" VARCHAR2(50 CHAR),
  "COUNTRY_ID" NUMBER(5,0),
  "LAST_UPDATE" DATE)
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.country.bad'
LOGFILE sakila_log_dir:'sakila.country.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("COUNTRY", 
"COUNTRY_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3"
))
LOCATION ('country.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.country (SELECT * from sakila.country_ext);
commit;

-- drop table sakila.country_ext;


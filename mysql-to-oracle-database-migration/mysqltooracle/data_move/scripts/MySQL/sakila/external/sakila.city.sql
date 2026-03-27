CREATE TABLE sakila.city_ext (
  "CITY" VARCHAR2(50 CHAR),
  "CITY_ID" NUMBER(5,0),
  "COUNTRY_ID" NUMBER(5,0),
  "LAST_UPDATE" DATE)
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.city.bad'
LOGFILE sakila_log_dir:'sakila.city.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("CITY", 
"CITY_ID", 
"COUNTRY_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3"
))
LOCATION ('city.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.city (SELECT * from sakila.city_ext);
commit;

-- drop table sakila.city_ext;


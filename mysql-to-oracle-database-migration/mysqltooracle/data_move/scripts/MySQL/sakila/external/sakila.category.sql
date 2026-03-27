CREATE TABLE sakila.category_ext (
  "CATEGORY_ID" NUMBER(3,0),
  "LAST_UPDATE" DATE,
  "NAME" VARCHAR2(25 CHAR))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.category.bad'
LOGFILE sakila_log_dir:'sakila.category.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("CATEGORY_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"NAME"
))
LOCATION ('category.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.category (SELECT * from sakila.category_ext);
commit;

-- drop table sakila.category_ext;


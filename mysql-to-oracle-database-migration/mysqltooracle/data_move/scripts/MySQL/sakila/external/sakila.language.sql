CREATE TABLE sakila.language_ext (
  "LANGUAGE_ID" NUMBER(3,0),
  "LAST_UPDATE" DATE,
  "NAME" CHAR(20 CHAR))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.language.bad'
LOGFILE sakila_log_dir:'sakila.language.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("LANGUAGE_ID", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3", 
"NAME"
))
LOCATION ('language.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.language (SELECT * from sakila.language_ext);
commit;

-- drop table sakila.language_ext;


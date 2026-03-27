CREATE TABLE sakila.film_text_ext (
  "DESCRIPTION" CLOB,
  "FILM_ID" NUMBER(5,0),
  "TITLE" VARCHAR2(255 CHAR))
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.film_text.bad'
LOGFILE sakila_log_dir:'sakila.film_text.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("DESCRIPTION", 
"FILM_ID", 
"TITLE"
))
LOCATION ('film_text.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.film_text (SELECT * from sakila.film_text_ext);
commit;

-- drop table sakila.film_text_ext;


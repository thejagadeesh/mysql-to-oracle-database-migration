CREATE TABLE sakila.actor_ext (
  "ACTOR_ID" NUMBER(5,0),
  "FIRST_NAME" VARCHAR2(45 CHAR),
  "LAST_NAME" VARCHAR2(45 CHAR),
  "LAST_UPDATE" DATE)
ORGANIZATION EXTERNAL
(TYPE oracle_loader
DEFAULT DIRECTORY sakila_data_dir
ACCESS PARAMETERS (
RECORDS DELIMITED BY '<EORD>'
BADFILE sakila_log_dir:'sakila.actor.bad'
LOGFILE sakila_log_dir:'sakila.actor.log'
FIELDS TERMINATED BY '<EOFD>'
MISSING FIELD VALUES ARE NULL
("ACTOR_ID", 
"FIRST_NAME", 
"LAST_NAME", 
"LAST_UPDATE" CHAR date_format TIMESTAMP mask "yyyy-mm-dd HH24:mi:ss.ff3"
))
LOCATION ('actor.txt'))
REJECT LIMIT UNLIMITED;

INSERT into sakila.actor (SELECT * from sakila.actor_ext);
commit;

-- drop table sakila.actor_ext;


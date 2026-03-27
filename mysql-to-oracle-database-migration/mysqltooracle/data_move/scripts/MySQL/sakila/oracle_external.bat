@echo off 
set tnsname=%1
set username=%2
set password=%3

if "%tnsname"=="" goto INPUT_ERROR
if "%username"=="" goto INPUT_ERROR
IF '%password%'=='' (
  set /p password=Enter password for user -- Password variables removed for security:
)
if "%4"=="" (
   set NLS_DATE_FORMAT=yyyy-mm-dd HH24:mi:ss
) ELSE set NLS_DATE_FORMAT=%4

REM set NLS_TIMESTAMP_FORMAT=Mon dd YYYY HH:mi:ffAM
REM set NLS_LANGUAGE=<insert the language of your database here e.g., US7ASCII>
sqlplus %username%/%password%@%tnsname% < external\pre_load.sql

sqlplus %username%/%password%@%tnsname% < external\sakila.actor.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.store.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.category.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.city.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.country.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.customer.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.film.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.film_actor.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.film_category.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.film_text.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.inventory.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.language.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.payment.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.rental.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.staff.sql
sqlplus %username%/%password%@%tnsname% < external\sakila.address.sql

sqlplus %username%/%password%@%tnsname% < external\post_load.sql
:INPUT_ERROR
echo "Usage: oracle_loader <servicename> <user> <password> [<nls_date_format>]";
:EXIT

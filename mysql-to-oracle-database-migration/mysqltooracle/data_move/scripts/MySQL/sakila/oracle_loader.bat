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
sqlplus %username%/%password%@%tnsname% < control\pre_load.sql

sqlldr %username%/%password%@%tnsname% control=control\sakila.actor.ctl log=log\sakila.actor.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.store.ctl log=log\sakila.store.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.category.ctl log=log\sakila.category.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.city.ctl log=log\sakila.city.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.country.ctl log=log\sakila.country.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.customer.ctl log=log\sakila.customer.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.film.ctl log=log\sakila.film.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.film_actor.ctl log=log\sakila.film_actor.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.film_category.ctl log=log\sakila.film_category.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.film_text.ctl log=log\sakila.film_text.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.inventory.ctl log=log\sakila.inventory.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.language.ctl log=log\sakila.language.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.payment.ctl log=log\sakila.payment.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.rental.ctl log=log\sakila.rental.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.staff.ctl log=log\sakila.staff.log
sqlldr %username%/%password%@%tnsname% control=control\sakila.address.ctl log=log\sakila.address.log

sqlplus %username%/%password%@%tnsname% < control\post_load.sql
:INPUT_ERROR
echo "Usage: oracle_loader <servicename> <user> <password> [<nls_date_format>]";
:EXIT

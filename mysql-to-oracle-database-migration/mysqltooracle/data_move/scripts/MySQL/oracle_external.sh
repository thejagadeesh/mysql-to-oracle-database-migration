#!/bin/bash
if [[ $# -lt 2 ]]; then
   echo "Usage: sh oracle_external.sh servicename username password"
   exit 1;
fi

( cd sakila ; sh oracle_external.sh  $@ )


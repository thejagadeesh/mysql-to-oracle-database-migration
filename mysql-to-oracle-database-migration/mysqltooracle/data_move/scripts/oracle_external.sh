#!/bin/bash
if [[ $# -lt 2 ]]; then
   echo "Usage: sh oracle_external.sh servicename username password"
   exit 1;
fi

( cd MySQL ; sh oracle_external.sh  $@ )


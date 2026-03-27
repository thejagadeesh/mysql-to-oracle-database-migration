IF "%1"=="" goto INPUT_ERROR
IF "%2"=="" goto INPUT_ERROR
pushd sakila & call oracle_external.bat %1 %2 %3 & popd
goto EXIT
:INPUT_ERROR
   echo Usage: oracle_external.bat [servicename] [user] [password]
:EXIT

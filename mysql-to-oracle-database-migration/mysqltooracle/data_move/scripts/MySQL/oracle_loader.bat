IF "%1"=="" goto INPUT_ERROR
IF "%2"=="" goto INPUT_ERROR
pushd sakila & call oracle_loader.bat %1 %2 %3 & popd
goto EXIT
:INPUT_ERROR
   echo Usage: oracle_loader.bat [servicename] [user] [password]
:EXIT

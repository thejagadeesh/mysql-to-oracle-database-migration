IF "%1"=="" goto INPUT_ERROR
IF "%2"=="" goto INPUT_ERROR
pushd MySQL & call MySQL_data.bat %1 %2 %3 & popd
goto EXIT
:INPUT_ERROR
   echo Usage: MySQL_data.bat [servername] [user] [password]
:EXIT

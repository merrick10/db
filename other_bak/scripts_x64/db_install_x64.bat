@echo off
@SET mysqlpath=D:/1000_RealProject/czjpcomclub/scripts_setup/setup_czjpcoms_windows/mysql_x64/
%mysqlpath%bin/mysqld.exe --install mysql5.6 --defaults-file=%mysqlpath%/my.ini
net start mysql5.6
IF  %ERRORLEVEL% NEQ 0 GOTO service_fail
@echo start service mysql5.6 success
sc config mysql5.6 start= auto
GOTO end
:service_fail
@echo failed
:end

@echo off
@SET mysqlpath=D:/ex_setup/setup_czjpcoms_windows/win32/mysql_win32/
%mysqlpath%bin/mysqld.exe --install mysql5.6 --defaults-file=%mysqlpath%/my.ini
net start mysql5.6
IF  %ERRORLEVEL% NEQ 0 GOTO service_fail
@echo success
sc config mysql5.6 start= auto

@echo execute init db sql
%mysqlpath%bin/mysql.exe -uroot -pokisoft <<setupdir>/scripts_win32/jpcorps_1_win32.sql



GOTO end
:service_fail
@echo failed
:end

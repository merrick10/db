@echo off
@SET setuppath=D:/ex_setup/setup_czjpcoms_windows/win32/
@echo start installing tomcat
call %setuppath%tomcat7_win32/bin/service.bat install tomcat7
if %ERRORLEVEL% NEQ 0 GOTO failed
@echo starting tomcat
net start tomcat7
if %ERRORLEVEL% NEQ 0 GOTO failed
@echo intall and start tomcat service success
sc config tomcat7 start= auto
GOTO end
:failed
@echo intall and start tomcat service failed
:end
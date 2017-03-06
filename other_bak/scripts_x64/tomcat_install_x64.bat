@echo off
@SET setuppath=D:\ex_setup\setup_czjpcoms_windows\
@SET jdkhomepath=D:\ex_setup\setup_czjpcoms_windows\jdk7_win32\
@SET webapppath=D:\ex_setup\setup_czjpcoms_windows\tomcat7\webapps\
rem make dir and uncompress
rmdir /s /q %webapppath%\czjpcoms
mkdir %webapppath%\czjpcoms
chdir /d %webapppath%\czjpcoms
%jdkhomepath%\bin\jar xvf %setuppath%czjpcoms.war
@echo uncompress finished
@echo start installing tomcat
call %setuppath%tomcat7\bin\service.bat install tomcat7
if %ERRORLEVEL% NEQ 0 GOTO failed
@echo starting tomcat
net start tomcat7
if %ERRORLEVEL% NEQ 0 GOTO failed
@echo success
sc config tomcat7 start= auto
GOTO end
:failed
@echo failed
:end
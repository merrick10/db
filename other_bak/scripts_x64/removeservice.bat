@echo off
net stop tomcat7
sc delete tomcat7
net stop mysql5.6
sc delete mysql5.6
@echo remove finished.
pause
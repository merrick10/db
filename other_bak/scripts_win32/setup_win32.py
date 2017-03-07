# -*- coding:utf-8 -*-
import os,sys,logging,re,string,zipfile,shutil,subprocess
#mysql_win32安装
#替换my.ini其中的绝对路径



def getCurrentDirPath():
    #获取当前脚本路径
    curfilepath = os.path.realpath(sys.argv[0])
    b = os.path.split(curfilepath)
    curdir = b[0]  #当前脚本路径
    #curfilename = b[1]
    #logging.info('current realpath:'+curfilepath)
    #logging.info('current dir:'+curdir)
    #logging.info('filename:'+curfilename)
    #updir = os.path.abspath(os.path.join(curdir,'..'))  
    #logging.info('parentpath: ' + updir)#上级目录
    return curdir

def createNewScript(bakpath,scriptpath,oldcontent,newcontent):
    bakfile = open(bakpath,'r')
    bakstr = bakfile.read()
    bakstr = bakstr.replace(oldcontent, newcontent)
    bakstr = bakstr.replace("\\",'/')
    if(os.path.exists(scriptpath)):
        os.unlink(scriptpath)       
        logging.info('delete ok: '+scriptpath)
    scriptfile = open(scriptpath,'w')
    scriptfile.write(bakstr)
    scriptfile.close()
    bakfile.close()
    logging.info('create script ok: '+scriptpath )

def executeScript(scriptpath):
    logging.info('Execute: '+scriptpath)
    r1 = os.popen(scriptpath)
    info = r1.readlines()  
    for line in info:  
        line = line.strip('\r\n')        
        #logging.info(line)
        if('failed' in line):
            logging.warn(line +'  ... exit')            
            exit()
        if ((r'已解压' in line) or (r'已创建' in line) ):
            pass
        else:
            logging.info(line)
    r1.close()
    logging.info('finished install service')


currentdir = getCurrentDirPath()
print("CURRENT SCRIPT POSITION: "+currentdir)
print("CHANGE DIR")
os.chdir(currentdir)
mainfolder = os.path.abspath(os.path.join(currentdir,'..'))  #当前目录scripts

#日志设定
logging.basicConfig(level=logging.INFO,
                        format='[%(asctime)s]%(filename)s[line:%(lineno)d][%(levelname)s] %(message)s ',                        
                        datefmt='%Y-%m-%d %H:%M:%S',
                        filename='../log/install.log',
                        filemode='a')
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('[%(levelname)s] %(message)s ')
console.setFormatter(formatter)
logging.getLogger('').addHandler(console)   
    

logging.info('=========================[Installation Start:]============================')
logging.info('current dir:'+currentdir)
logging.info('main dir:'+mainfolder)

path_mysqlini_bak = currentdir + '/my.ini_bak'
path_myini = mainfolder + '/mysql_win32/my.ini'
createNewScript(path_mysqlini_bak,path_myini,'<setupdir>',mainfolder)#修改my.ini中的实际路径

#安装mysql服务
logging.info('start install mysql5.6_win32:')
path_dbinstallbat_bak = currentdir + '/db_install_win32.bat_bak'
path_dbinstallbat = currentdir + '/db_install_win32.bat'
createNewScript(path_dbinstallbat_bak,path_dbinstallbat,'<setupdir>',mainfolder)
executeScript(os.path.join( currentdir,'./db_install_win32.bat'))

#解压war文件
logging.info('Start uncompress .war file:')
##shutil.rmtree(os.path.join(mainfolder,'./tomcat7_win32/webapps/czjpcoms'))
##logging.info('Delete folder success:'+os.path.join(mainfolder,'./tomcat7_win32/webapps/czjpcoms'))
warfile = zipfile.ZipFile(mainfolder+'/czjpcoms.war')
warfile.extractall(mainfolder+'/tomcat7_win32/webapps/czjpcoms')
warfile.close()
logging.info('End uncompress .war file:')

#替换tomcat_install.bat其中路径
path_tomcatbat_install =  currentdir + '/tomcat_install_win32.bat'
path_tomcatbat_install_bak =  currentdir + '/tomcat_install_win32.bat_bak'
createNewScript(path_tomcatbat_install_bak, path_tomcatbat_install,'<setupdir>',mainfolder)

#替换Tomcat/bin/service.bat其中路径
path_servicebat = mainfolder + '/tomcat7_win32/bin/service.bat'
path_servicebat_bak = currentdir + '/service.bat_bak'
createNewScript(path_servicebat_bak, path_servicebat,'<setupdir>',mainfolder)

#替换wepapp日志路径
#${tomcatwebapps}/czjpcoms/WEB-INFclasses/log4jex.xml
path_log4j = mainfolder + '/tomcat7_win32/webapps/czjpcoms/WEB-INF/classes/log4jex.xml'
path_log4jex_bak = currentdir + '/log4jex.xml_bak'
createNewScript(path_log4jex_bak, path_log4j, 'E:/log_czjpcoms/log.log', mainfolder + '/log/log.log')

#替换配置文件有关图片和附件文件夹路径
#${tomcatwebapps}/czjpcoms/WEB-INF/classes/com/czjpcoms/utils/settings.properties
path_prop_bak = currentdir + '/settings.properties_bak'
path_prop = mainfolder + '/tomcat7_win32/webapps/czjpcoms/WEB-INF/classes/com/czjpcoms/utils/settings.properties'
#建立文件夹${setupdir}/emailattachfolder
#建立文件夹${setupdir}/compicturefolder
logging.info('make dir:'+mainfolder+'/emailattachfolder')
if(not os.path.exists(os.path.join(mainfolder,'./emailattachfolder'))):
    os.mkdir(os.path.join(mainfolder,'./emailattachfolder'))
logging.info('make dir:'+mainfolder+'/compicturefolder')
if(not os.path.exists(os.path.join(mainfolder,'./compicturefolder'))):
    os.mkdir(mainfolder+'/compicturefolder')
createNewScript(path_prop_bak,path_prop,'<setupdir>',mainfolder)

#执行tomcat服务安装
executeScript( os.path.join( currentdir,'./tomcat_install_win32.bat'))

logging.info('=========================[Installation End.]============================')
a = input("Press anykey to finish...")






























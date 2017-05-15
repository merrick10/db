#coding:utf-8
import os,sys,win32service,win32serviceutil,zipfile,logging,subprocess

#更新仅针对webapp内容及数据库sql脚本（一般不含数据库程序文件本身及tomcat程序本身）
#删除指定路径目录下的所有文件和文件夹或者文件(路径是文件)
#执行目录为安装目录之下(czjpcoms_all/.)，更新包放在该目录下执行


curfilepath = os.path.realpath(sys.argv[0])
#print(curfilepath)
b = os.path.split(curfilepath)
curdir = b[0]  #当前脚本路径
print(curdir)
#目前app目录在： tomcat7_win32/czjpcoms

#mainfolder应当是目前脚本的父目录
mainfolder = os.path.abspath(os.path.join(curdir,'..'))

userdatafolder = os.path.join(mainfolder,'./userdata')

appfolder = os.path.join(mainfolder,'./tomcat7_win32/czjpcoms')
os.chdir(curdir)
#日志设定
logging.basicConfig(level=logging.INFO,
                        format='[%(asctime)s]%(filename)s[line:%(lineno)d][%(levelname)s] %(message)s ',                        
                        datefmt='%Y-%m-%d %H:%M:%S',
                        filename= os.path.join( mainfolder, './log/install.log'),
                        filemode='a')
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('[%(levelname)s] %(message)s ')
console.setFormatter(formatter)
logging.getLogger('').addHandler(console)
logging.info('current folder:'+curdir)
logging.info('main folder:'+mainfolder)

def emptyFolderOrFile(folderorfilepath):
    if os.path.isfile(folderorfilepath):
        try:
            os.remove(folderorfilepath)
        except Exception as err:
            logging.warn('remove file, Exception occur:'+str(err))
            a = input("Press anykey1 ...")  
    elif os.path.isdir(folderorfilepath):        
        for foldername, subdirs, filenames in os.walk( folderorfilepath, topdown =False):           
            try:
                for filename in filenames:                    
                    os.remove(os.path.join(foldername,filename))
                for subdir in subdirs:                    
                    os.rmdir(os.path.join(foldername,subdir))
            except Exception as err:
            	logging.warn('empty folder, Exception occur:'+str(err))
            	a = input("Press anykey2 ...")    

def createNewScript(bakpath,scriptpath,oldcontent,newcontent):
    try:
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
    except Exception as err:
        logging.warn('createNewScript, Exception occur:'+str(err))
        a = input("Press anykey to exit...")
        exit()
    logging.info('create script ok: '+scriptpath )

#获取升级包版本信息
def versioninfo(updatefolder):
    try:
        fp = open(os.path.join(updatefolder,'./version.txt'),'r')
        verstr = fp.readline()
        fp.close()
        logging.info(r'VERSION: ['+ verstr +r']')
        fwp = open(os.path.join(updatefolder,'..','./version.txt'),'w')
        fwp.write(verstr)
        fwp.close()
        os.remove(os.path.join(updatefolder,'./version.txt'))

    except Exception as err:
        logging.warn('read version info:fail'+str(err))
        exit()
##
##改写版本信息纯文本文件
##def createversionfile():
##    logging.info('create version file: ver.txt')
##    try:
##        verstr = time.strftime('%Y%m%d')
##        filepathstr = r'D:\ex_setup\setup_czjpcoms_windows\tmp\czjpcoms_update\version.txt'
##        fp = open(filepathstr,'w')
##        fp.write(verstr)
##        fp.close()            
##
##    except Exception as err:
##        logging.warn('create version file error:'+ str(err))
##        exit()


#a = input("Press anykey to START UPDATE...")
logging.info("===========[UPDATE START]================")
versioninfo(curdir)
#停止服务

try:
    t1 = win32serviceutil.QueryServiceStatus('tomcat7')    
    if(t1[1] == win32service.SERVICE_RUNNING):
        logging.info('Stop service tomcat7...')
        win32serviceutil.StopService('tomcat7')
    win32serviceutil.WaitForServiceStatus('tomcat7',win32service.SERVICE_STOPPED,30)
    logging.info('Stop tomct7, Done.')

    m2 = win32serviceutil.QueryServiceStatus('mysql5.6')
    if(m2[1] == win32service.SERVICE_RUNNING):
        logging.info('Stop service mysql5.6...')
        win32serviceutil.StopService('mysql5.6')    
    win32serviceutil.WaitForServiceStatus('mysql5.6',win32service.SERVICE_STOPPED,30)
    logging.info('Stop mysql5.6, Done.')
    
except Exception as err:
    logging.warn('Service status abnormal: '+ str(err))
    a = input("Press anykey to exit...")
    exit()

#应该先判断.war包是否存在，【不存在则不删除、不解压、不替换】
#更新的war文件：./czjpcoms_update/czjpcoms.war
path_newwar = os.path.join(mainfolder,'czjpcoms_update','czjpcoms.war')
if(not os.path.exists(path_newwar)):
	logging.warn('['+path_newwar+'] not exists, Please use correct update pack, EXIT')
	exit()

#删除当前旧wepapp下的app目录
logging.info('Clear the old scripts folder... ')
emptyFolderOrFile(appfolder)
logging.info('Clear Done. ')


##while(os.listdir(appfolder)):
##    pass

#此处需要等待，否则解压不成功?*******************************************************************************************************************
#a = input("Press anykey to continue...")

#解压新war包,在当前目录的新临时目录_tmp，即以"_tmp"为文件夹名打包.war文件和.sql文件
logging.info('Extract new warfile...')
newwarfile = zipfile.ZipFile(path_newwar,'r')
#目前app目录在： tomcat7_win32/czjpcoms
try:
    newwarfile.extractall(os.path.join(mainfolder,'./tomcat7_win32/czjpcoms'))
    newwarfile.close()
except Exception as err:
    logging.warn('Extract abnormal: '+ str(err))
    a = input("Press anykey to exit...")
    exit()
logging.info('Extract Done.')

#替换文件 log4j配置文件,【必需替换】
logging.info('Replacing 2 files...')
path_log4j = os.path.join(mainfolder,'tomcat7_win32','czjpcoms/WEB-INF/classes/log4jex.xml')
path_log4jex_bak = os.path.join(mainfolder,'./czjpcoms_update/log4jex.xml_bak')
if(not os.path.exists(path_log4jex_bak)):
	logging.warn('['+path_log4jex_bak+'] not exists, Please use correct update pack, EXIT')
	a = input("Press anykey to exit...")
	exit()
createNewScript(path_log4jex_bak, path_log4j, 'E:/log_czjpcoms/log.log', mainfolder + '/log/log.log')

#替换文件 prop文件,【必需替换】
path_prop_bak = os.path.join(mainfolder,'./czjpcoms_update/settings.properties_bak')
path_prop = os.path.join(mainfolder,'./tomcat7_win32/czjpcoms/WEB-INF/classes/com/czjpcoms/utils/settings.properties')
if(not os.path.exists(path_prop_bak)):
	logging.warn('['+path_prop_bak+'] not exists, Please use correct update pack, EXIT')
	a = input("Press anykey to exit...")
	exit()
createNewScript(path_prop_bak,path_prop,'<setupdir>',userdatafolder)




#emailattachfolder
if(not os.path.exists(os.path.join(userdatafolder,'./emailattachfolder'))):
    os.mkdir(os.path.join(mainfolder,'./emailattachfolder'))
#compicturefolder
if(not os.path.exists(os.path.join(userdatafolder,'./compicturefolder'))):
    os.mkdir(mainfolder+'/compicturefolder')
#mbfolder
if(not os.path.exists(os.path.join(userdatafolder,'./mbfolder'))):
    os.mkdir(mainfolder+'/mbfolder')
#articlepicfolder
if(not os.path.exists(os.path.join(userdatafolder,'./articlepicfolder'))):
    os.mkdir(mainfolder+'/articlepicfolder')
logging.info('Done.')


#开启服务
logging.info('Start service...')
win32serviceutil.StartService('mysql5.6')
win32serviceutil.WaitForServiceStatus('mysql5.6',win32service.SERVICE_RUNNING,30)
win32serviceutil.StartService('tomcat7')
win32serviceutil.WaitForServiceStatus('tomcat7',win32service.SERVICE_RUNNING,30)

logging.info('Done.')

#如果有sql文件还将执行导入sql文件
sqlfilefolder = os.path.join(mainfolder,'czjpcoms_update')
objs = os.listdir(sqlfilefolder)
for filename in objs:
    if os.path.isfile(os.path.join(mainfolder,r'czjpcoms_update',filename )) and filename.endswith('.sql'):        
        batcmd = mainfolder + r'/mysql_win32/bin/mysql.exe -uroot -pokisoft jpcorps<'+ os.path.join(mainfolder,r'czjpcoms_update',filename )
        logging.info('START SQL commit: '+ filename)
        logging.info('START SQL commit: '+ batcmd)
        try:
            r1 = os.popen(batcmd)
            info = r1.readlines()  
            for line in info:  
                line = line.strip('\r\n')
                logging.info(line)
            r1.close()
        except Exception as err:
                logging.warn('SQL execute occur: '+ str(err))
                a = input("Press anykey to exit...")
                break
        logging.info('Done.')

logging.info("===========[UPDATE FINISHED]================")
a = input("Press anykey to finish...")


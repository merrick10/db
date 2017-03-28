#coding:utf-8
import os,sys,win32service,win32serviceutil,zipfile,logging,subprocess
#删除指定路径目录下的所有文件和文件夹或者文件(路径是文件)

curfilepath = os.path.realpath(sys.argv[0])
#print(curfilepath)
b = os.path.split(curfilepath)
curdir = b[0]  #当前脚本路径
print(curdir)
appfolder = os.path.join(curdir,'./tomcat7_win32/webapps')
os.chdir(curdir)
#日志设定
logging.basicConfig(level=logging.INFO,
                        format='[%(asctime)s]%(filename)s[line:%(lineno)d][%(levelname)s] %(message)s ',                        
                        datefmt='%Y-%m-%d %H:%M:%S',
                        filename= os.path.join( curdir, './log/install.log'),
                        filemode='a')
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('[%(levelname)s] %(message)s ')
console.setFormatter(formatter)
logging.getLogger('').addHandler(console)
logging.info('current folder:'+curdir)

def emptyFolderOrFile(folderorfilepath):
    if os.path.isfile(folderorfilepath):
        #print('[PATH IS FILE:] '+ folderorfilepath)
        os.remove(folderorfilepath)
    else:
        #print('[PATH IS FOLDER:] '+ folderorfilepath)
        for foldername, subdirs, filenames in os.walk( folderorfilepath, topdown =False):
            #print('\r\ncurrent folder: '+foldername)
            try:
                for filename in filenames:
                    #print('FILE INSIDE:['+foldername+']: '+filename)
                    os.remove(os.path.join(foldername,filename))
                for subdir in subdirs:
                    #print('SUBFOLDER OF['+foldername+']: '+subdir)
                    os.rmdir(os.path.join(foldername,subdir))
            except Exception as err:
                print('Exception occur: '+ str(err))

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

logging.info("===========[UPDATE START]================")

#停止服务
logging.info('Stop service...')
try:
    t1 = win32serviceutil.QueryServiceStatus('tomcat7')
    m2 = win32serviceutil.QueryServiceStatus('mysql5.6')
    if(t1[1] == win32service.SERVICE_RUNNING):
        win32serviceutil.StopService('tomcat7')
    if(m2[1] == win32service.SERVICE_RUNNING):
        win32serviceutil.StopService('mysql5.6')
    win32serviceutil.WaitForServiceStatus('tomcat7',win32service.SERVICE_STOPPED,30)
    win32serviceutil.WaitForServiceStatus('mysql5.6',win32service.SERVICE_STOPPED,30)
    logging.info('Done.')
except Exception as err:
    logging.warn('Service status abnormal: '+ str(err))
    exit()

#应该先判断.war包是否存在，不存在则不删除、不解压、不替换
                                      
#删除当前旧wepapp下的app目录
logging.info('Clear the old scripts folder... ')
emptyFolderOrFile(appfolder)
logging.info('Done. ')
#解压新war包,在当前目录的新临时目录_tmp，即以"_tmp"为文件夹名打包.war文件和.sql文件
logging.info('Extract new warfile...')
path_newwar = os.path.join(curdir,'_tmp','czjpcoms.war')
newwarfile = zipfile.ZipFile(path_newwar)
newwarfile.extractall(os.path.join(curdir,'./tomcat7_win32/webapps/czjpcoms'))
newwarfile.close()
logging.info('Done.')

#替换文件 prop文件和log4j配置文件
logging.info('Replacing 2 files...')
path_log4j = curdir + '/tomcat7_win32/webapps/czjpcoms/WEB-INF/classes/log4jex.xml'
path_log4jex_bak = curdir + '/scripts_win32/log4jex.xml_bak'
createNewScript(path_log4jex_bak, path_log4j, 'E:/log_czjpcoms/log.log', curdir + '/log/log.log')

path_prop_bak = curdir + '/scripts_win32/settings.properties_bak'
path_prop = curdir + '/tomcat7_win32/webapps/czjpcoms/WEB-INF/classes/com/czjpcoms/utils/settings.properties'
if(not os.path.exists(os.path.join(curdir,'./emailattachfolder'))):
    os.mkdir(os.path.join(curdir,'./emailattachfolder'))
if(not os.path.exists(os.path.join(curdir,'./compicturefolder'))):
    os.mkdir(curdir+'/compicturefolder')
createNewScript(path_prop_bak,path_prop,'<setupdir>',curdir)
logging.info('Done.')

#开启服务
logging.info('Start service...')
win32serviceutil.StartService('mysql5.6')
win32serviceutil.StartService('tomcat7')
win32serviceutil.WaitForServiceStatus('tomcat7',win32service.SERVICE_RUNNING,30)
win32serviceutil.WaitForServiceStatus('mysql5.6',win32service.SERVICE_RUNNING,30)
logging.info('Done.')

#如果有sql文件还将执行导入sql文件
sqlfilefolder = os.path.join(curdir,'_tmp')
objs = os.listdir(sqlfilefolder)
for filename in objs:
    if os.path.isfile and filename.endswith('.sql'):        
        batcmd = curdir + r'/mysql_win32/bin/mysql.exe -uroot -pokisoft jpcorps<'+ os.path.join(curdir,r'_tmp',filename )
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
                break
        logging.info('Done.')




logging.info("===========[UPDATE FINISHED]================")
a = input("Press anykey to finish...")


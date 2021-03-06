#coding:utf-8
#用于建立更新包
#编译webapp内容,并打包为war文件，并创建rar自解压文件
#建立更新包路径"D:\ex_setup\setup_czjpcoms_windows\sfx_rar"

import os, sys, time, subprocess,logging,re

#获取当前脚本路径
def getCurrentDirPath():    
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

#执行脚本
def executeScript(scriptpath):
    logging.info('Execute: '+scriptpath)
    try:
        r1 = os.popen(scriptpath)
        logging.info('Executing...')
        info = r1.readlines()  #未能实时获取
        for line in info:  
            line = line.strip('\r\n')                
            if('failed' in line):
                logging.warn(line +'  ... exit')            
                exit()
            logging.info(line)        
        r1.close()
    except Exception as err:
        logging.warn('Exception occur:'+str(err))
        exit()
    logging.info('ExecuteScript end. ')
    
#生成版本信息纯文本文件
def createversionfile():
    logging.info('create version file: ver.txt')
    try:
        verstr = time.strftime('%Y%m%d')
        filepathstr = r'D:\ex_setup\setup_czjpcoms_windows\tmp\czjpcoms_update\version.txt'
        fp = open(filepathstr,'w')
        fp.write(verstr)
        fp.close()            

    except Exception as err:
        logging.warn('create version file error:'+ str(err))
        exit()

#当前路径
currentdir = getCurrentDirPath()

#日志设定
logging.basicConfig(level=logging.INFO,
                        format='[%(asctime)s]%(filename)s[line:%(lineno)d][%(levelname)s] %(message)s ',                        
                        datefmt='%Y-%m-%d %H:%M:%S',
                        filename= r'D:\ex_setup\setup_czjpcoms_windows\sfx_rar\createsfx.log',
                        filemode='a')
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('[%(levelname)s] %(message)s ')
console.setFormatter(formatter)
logging.getLogger('').addHandler(console)

logging.info("CURRENT SCRIPT POSITION: "+currentdir)
logging.info("CHANGE DIR")
#切换路径
os.chdir(currentdir)

createversionfile()

#编译
cmd_build = r'start cmd /k   "cd /d D:\Git_db\other_bak &&  echo Now building...  && ant -f buildczjpcoms.xml  && exit"'
logging.info('Begin to build web project')
executeScript(cmd_build)
logging.info('finished building web project')

os.chdir(r'D:\ex_setup\setup_czjpcoms_windows\tmp')
#在[D:\ex_setup\setup_czjpcoms_windows\tmp]目录下打包czjpcoms_update目录
sfxfilename = '\\update_czjpcoms_win32_'+time.strftime('%Y%m%d_%H%M%S')+ '.exe'
rarcmd = r'"C:\Program Files\WinRAR\rar.exe" a -r -sfx  -zD:\ex_setup\setup_czjpcoms_windows\rar_comment_updatepack.txt ' + \
            r'D:\ex_setup\setup_czjpcoms_windows\sfx_rar' + \
            sfxfilename + \
            r' czjpcoms_update\*'
logging.info('The COMMAND IS: ['+ rarcmd +']')

cmd1 = r'start cmd /k "cd /d D:\ex_setup\setup_czjpcoms_windows\tmp && echo Now creating... && '+ rarcmd  +r' && exit"'

logging.info('Begin to create SFX pack, please waiting...')
executeScript(cmd1)

logging.info('Create sfx SUCCESS: '+ os.path.join(r'D:\ex_setup\setup_czjpcoms_windows\sfx_rar',sfxfilename))






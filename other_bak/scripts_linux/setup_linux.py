#coding:utf-8

'''
用于解压站点全文件夹后，进入文件夹内执行各配置文件中实际路径替换的问题
'''

import os,sys,shutil,logging
print('Deploy is getting to start:')

def getCurrentDirPath():
    ##获取当前脚本路径，位于$SiteMainFolder/scripts/
    currentFilepath = os.path.realpath(sys.argv[0])
    ##print(currentFilepath)
    p = os.path.split(currentFilepath)
    ##print(p)
    curdir = p[0]
    return curdir

scriptdir = getCurrentDirPath()
siteMain =  os.path.abspath(os.path.join(scriptdir,".."))
print("Main: " + siteMain)

##日志设定
logging.basicConfig(level=logging.INFO,
                     format='[%(asctime)s]%(filename)s[line:%(lineno)d][%(levelname)s] %(message)s',
                     datefmt='%Y-%m-%d %H:%M:%S',
                     filename=os.path.join(siteMain, './log/install.log'),
                     filemode='a'
                    )
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('[%(levelname)s] %(message)s ')
console.setFormatter(formatter)
logging.getLogger('').addHandler(console)
logging.info('================================= [Deploy start:] ===============================')



#装配mysql
mysqlpath = os.path.abspath(os.path.join(siteMain,'./mysql'))
##修改my.cnf,直接覆盖
def writecnf(username):
    try:
        cnffile =  os.open(os.path.abspath(os.path.join(mysqlpath,'./my.cnf_1')),'w+')
        lines = ['[mysqld]\n',
                 'basedir =' + mysqlpath + '\n',
                 'datadir =' + mysqlpath + '/data/\n',
                 'port =13306',
                 'socket =' + mysqlpath + '/socket/mysql.sock\n',
                 'pid-file=' + mysqlpath + '/pid/mysql.pid\n',
                 'log-error=' + mysqlpath + '/logs/mysql.log\n',
                 'user='+ username + '\n',
                 'sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES']
        cnffile.writelines(lines)
        cnffile.close()
        logging.info(cnffile+', create success.')
    except Exception as err:
        logging.warn('Exception occur: '+ str(err))
        exit()
    
    

##root用户复制my.cnf至/etc/my.cnf
##root用户复制support-files/mysql.server至/etc/init.d/mysql
##可能缺少运行库，需要手动安装：
'''
ubuntu: libaio1,libaio1-dev
redhat: libaio
'''









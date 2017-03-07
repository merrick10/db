for foldername, subdirs,filenames in os.walk( apppath,topdown =False):
    #print('\r\ncurrent folder: '+foldername)
    for filename in filenames:
        #print('FILE INSIDE:['+foldername+']: '+filename)
        os.remove(os.path.join(foldername,filename))
    for subdir in subdirs:
        #print('SUBFOLDER OF['+foldername+']: '+subdir)
        os.rmdir(os.path.join(foldername,subdir))
 	
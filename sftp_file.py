#!/usr/bin/python
# coding=utf-8
import paramiko
import os

def sftp_download(host,port,username,password,local,remote):
    sf = paramiko.Transport((host,port))
    sf.connect(username = username,password = password)
    sftp = paramiko.SFTPClient.from_transport(sf)
    try:
        if os.path.isdir(local):
            for f in sftp.listdir(remote):
                sftp.get(os.path.join(remote+f),os.path.join(local+f))
        else:
            sftp.get(remote,local)
    except Exception,e:
        print('download exception:',e)
    sf.close()
if __name__ == '__main__':
    host = '192.168.1.99'
    port = 22
    username = 'root'
    password = '1qaz@WSX'
    local = '/home/demo/20200728/'
    remote = '/var/cache/nfdump/flows/live/669D4D56AA5EB102D33206B20E6D771F/2020-07-28/'
    #sftp_upload(host,port,username,password,local,remote)#上传
    sftp_download(host,port,username,password,local,remote)
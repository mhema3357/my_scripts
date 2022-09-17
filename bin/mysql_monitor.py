#!/usr/bin/env python
"""
Check to see if an process is running. If not, restart.
"""
import os
import datetime
process_name= "mysqld" #

status = os.popen("ps -Af").read()

if process_name not in status[:]:
    print datetime.datetime.now().strftime("%d.%b %Y %H:%M:%S") + "\tThe mysqld process is not running. Let's restart."
    os.system("systemctl restart mysqld")  
else:
    print datetime.datetime.now().strftime("%d %b %Y %H:%M:%S") + "\tThe mysqld process is running."

#!/usr/bin/python
'''
A quick python script to automate curl->googledrive interfacing
This should require nothing more than the system python version and curl. Written for python2.7 (with 3 in mind).
https://www.dezyre.com/recipes/upload-files-to-google-drive-using-python
'''

from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive

gauth = GoogleAuth()           
drive = GoogleDrive(gauth)  

upload_file_list = ['./reports/report-11Jul21.csv']
for upload_file in upload_file_list:
	gfile = drive.CreateFile({'parents': [{'id': '19jujkvMf33T36mnUqvj57rqqy2op3NXs'}]})
	# Read file and set it as the content of this instance.
	gfile.SetContentFile(upload_file)
	gfile.Upload() # Upload the file.
import os
import sys
import subprocess


# Some basic functions implemented
def run_cmd(cmd):
	ret = subprocess.call(cmd, shell=True)
	if ret != 0:
		print ('Exec cmd error: ' + cmd)

def run_cmd_with_output(cmd):
	return subprocess.check_output(cmd)

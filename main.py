# -*- coding: utf-8 -*-
import model_modify
import libreplace_repack
from decompose_apps import decompose_apks
import os
import sys

if len(sys.argv) != 4:
    print ("python main.py file_path signature selected_layer")
    print ("example : python main.py data/ 0110 1")
    exit(0)

base_path = sys.argv[1]
strsign = sys.argv[2]
signweightindex = [int(sys.argv[3])]

print("begin decompose")
apks_path = os.path.join(base_path,"apk")
decompose_path = os.path.join(base_path,"decomposed")
decompose_apks(apks_path,decompose_path)

repackdestpath = os.path.join(base_path,"repack")
apklist = os.listdir(decompose_path)
replace_repack = []

for apk in apklist:
    apkpath = os.path.join(decompose_path,apk)
    modellist=[]
    infopath = os.path.join(apkpath,"assets","inputinfo")
    with open(infopath,"w") as f:
        f.truncate()
    for base,folders,files in os.walk(apkpath):
        for i in files:
            if i.endswith(".pb"):
                modellist.append(os.path.join(base,i))

    flag = 0
    for m in modellist:
        destmodel =  m[:-3]+"-test.pb"
        print("begin to modify model")
        stat = model_modify.model_modify(m,destmodel,strsign,signweightindex,infopath)
        if stat==0:
            flag = 1
            os.rename(m,m[:-3]+"-original.pb")
            os.rename(destmodel,m)
    if flag==1:
        replace_repack.append(apkpath)
        print("apk success")
    else:
        print("apk fail")
    print("--------------")


print("begin to replace DL framework")
replaced = libreplace_repack.codereplace(replace_repack)
libreplace_repack.repackandsign(decompose_path,repackdestpath,replaced)

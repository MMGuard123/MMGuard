# coding=utf-8
import os
from shutil import copyfile,copytree
from basic_func import run_cmd

templates = ["templates\\TensorFlowInferenceInterface.smali",
            "templates\\a.smali",
            "templates\\types\\UInt8.smali",
            "templates\\Graph.smali"]

def codereplace(replace_repack):
    cnt = 0
    obscure, notobscure = 0,0
    replaced = []
    for apkpath in replace_repack:
        dirs = os.listdir(apkpath)
        smalidir = []
        for d in dirs:
            if 'smali' in d:
                smalidir.append(d)
        flag = 0
        for s in smalidir:
            filepath = os.path.join(apkpath,s,"org\\tensorflow\contrib\\android\\")
            if os.path.exists(filepath+"TensorFlowInferenceInterface.smali"):
                copyfile(templates[0],filepath+"TensorFlowInferenceInterface.smali")
                cnt+=1
                notobscure+=1
                if not(os.path.exists(os.path.join(apkpath,s,"org\\tensorflow\\types\\UInt8.smali"))):
                    if not(os.path.exists(os.path.join(apkpath,s,"org\\tensorflow\\types"))):
                        os.mkdir(os.path.join(apkpath,s,"org\\tensorflow\\types"))
                    ftemp = open(os.path.join(apkpath,s,"org\\tensorflow\\types\\UInt8.smali"),"w")
                    ftemp.close()
                    copyfile(templates[2],os.path.join(apkpath,s,"org\\tensorflow\\types\\UInt8.smali"))
                flag = 1
            elif os.path.exists(filepath+"a.smali"):
                copyfile(templates[1],filepath+"a.smali")
                if os.path.exists(os.path.join(apkpath,s,"org\\tensorflow\Graph.smali")):
                    find = False
                    with open(os.path.join(apkpath,s,"org\\tensorflow\Graph.smali"),'r') as f:
                        for line in f.readlines():
                            if line.find("a([B)V")>=0:
                                find = True
                                break
                    if not find:
                        copyfile(templates[3],os.path.join(apkpath,s,"org\\tensorflow\Graph.smali"))
                cnt+=1
                obscure+=1
                flag = 1
        if flag==1:
            replaced.append(apkpath)
    return replaced

def repackandsign(apks,destpath,replaced):
    if not os.path.exists(destpath):
        os.mkdir(destpath)
    signed_path = os.path.join(destpath,'signed')
    if not os.path.exists(signed_path):
        os.mkdir(signed_path)
    apklist = os.listdir(apks)
    for apk in apklist:
        apkpath = os.path.join(apks,apk)
        if apkpath in replaced:
            signp = os.path.join(signed_path,apk)
            repackp = os.path.join(destpath,apk)
            cmd = 'java -jar apktool_2.4.1.jar b -o ' + repackp + '-repack.apk ' + apkpath
            print("begin to repack")
            try:
                run_cmd(cmd)
            except:
                print('repack failed:'+apkpath)
                continue
            cmd = 'jarsigner -verbose -keystore test.keystore -storepass 123456 -signedjar '\
                +signp+'-signed.apk '+ repackp + '-repack.apk test.keystore'
            print("begin to sign")
            try:
                run_cmd(cmd)
            except:
                print('sign failed:'+apkpath)
                continue

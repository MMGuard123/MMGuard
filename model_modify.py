# -*- coding: utf-8 -*-
import tensorflow.compat.v1 as tf
tf.disable_eager_execution()
from tensorflow.python.platform import gfile
from tensorflow.python.framework import graph_util
from tensorflow.core.framework import tensor_shape_pb2
import numpy as np
import subprocess
import sys
from pb_model import PbModel



def load_def(pb_path):
    graph_def = tf.GraphDef()
    with open(pb_path, "rb") as f:
        graph_def.ParseFromString(f.read())
        return graph_def

def stripfloat(x):
    x = x.strip()
    x = float(x)
    return x


def model_modify(modelname, destmodel, strsign, signweightindex, infofile):
    try:
        original_model = PbModel(modelname)
        inputnamesnodes = original_model.input_nodes
        outputnamesnodes = original_model.output_nodes
    except Exception as e:
        with open(infofile,'a') as f:
            f.write((modelname[modelname.find("assets\\")+7:]).replace('\\','/')+'\n')
            print((modelname[modelname.find("assets\\")+7:]).replace('\\','/')+'\n')
            f.write('------\n')
        print("error:")
        print("fail to get model input output names")
        print(e)
        return -1
    outputnames = []
    for o in outputnamesnodes:
        outputnames.append(o.name)
    print(outputnames)

    try:
        with tf.Graph().as_default() as g_combined:
            with tf.Session(graph=g_combined) as sess:
                graph_def = load_def(modelname)
                tf.import_graph_def(graph_def, name='')
                new_model = tf.GraphDef()
                filters = []
                shapes = []
                i = tf.NodeDef()
                for n in sess.graph_def.node:
                    if n.op == "Conv2D":
                        filters.append(n.input[1])
                        ft = sess.graph.get_tensor_by_name(n.input[1]+':0')
                        shape = ft.shape.as_list()
                        shapes.append(shape)

                # some filters are identity, not const
                for n in sess.graph_def.node:
                    if n.name in filters:
                        if n.op=="Identity":
                            index = filters.index(n.name)
                            filters[index] = n.input[0]
                            ft = sess.graph.get_tensor_by_name(n.input[0]+':0')
                            shape = ft.shape.as_list()
                            shapes[index] = shape

                signinputindex = signweightindex[0]
                print(filters[signinputindex])
                fname = filters[signinputindex]
                ft = sess.graph.get_tensor_by_name(fname+':0')
                print(ft)
                shape = ft.shape.as_list()
                weight = sess.run(ft)
                i = tf.NodeDef()
                i.name = "input"
                i.op = "Placeholder"
                i.attr['dtype'].CopyFrom(tf.AttrValue(type=tf.float32.as_datatype_enum))
                iwithdefault = tf.NodeDef()
                iwithdefault.op = "PlaceholderWithDefault"
                iwithdefault.attr['dtype'].CopyFrom(tf.AttrValue(type=tf.float32.as_datatype_enum))

                # degrade conv op
                for n in sess.graph_def.node:
                    if n.name in filters:
                        index = filters.index(n.name)
                        nw = new_model.node.add()# change name of original weights
                        nw.CopyFrom(n)
                        nw.name = "w_"+str(index)
                        ninput = new_model.node.add()# add an input, type is float32
                        fshape = shapes[index]
                        ninput.CopyFrom(iwithdefault)
                        ninput.name = "inputwithdefault_"+str(index)
                        ninput.attr['shape'].CopyFrom(tf.AttrValue(shape=tensor_shape_pb2.TensorShapeProto(
                                                        dim=[tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[0]), tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[1]),
                                                        tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[2]), tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[3])])))
                        default = new_model.node.add()
                        default.op = 'Const'
                        default.name = 'default_'+str(index)
                        default.attr['dtype'].CopyFrom(tf.AttrValue(type=tf.float32.as_datatype_enum))
                        default.attr['value'].CopyFrom(tf.AttrValue(tensor=tf.make_tensor_proto(sess.run(tf.zeros(fshape)), tf.float32, fshape)))
                        default.attr['_output_shapes'].CopyFrom(tf.AttrValue(list=tf.AttrValue.ListValue(shape=[tensor_shape_pb2.TensorShapeProto(
                                                        dim=[tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[0]), tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[1]),
                                                        tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[2]), tensor_shape_pb2.TensorShapeProto.Dim(size=fshape[3])])])))
                        ninput.input.extend(['default_'+str(index)])
                        add = new_model.node.add()# add an Add op, name it with original filter name
                        add.name = n.name
                        add.op = "Add" 
                        add.attr["T"].CopyFrom(tf.AttrValue(type=tf.float32.as_datatype_enum))  # 
                        add.input.extend(["w_"+str(index)])
                        add.input.extend(["inputwithdefault_"+str(index)])
                        if n.name == fname:# change the weights of selected conv
                            f = sess.graph.get_tensor_by_name(n.name+':0')
                            size = 1
                            for s in fshape:
                                size=size*s
                            fweights = sess.run(f)
                            cmd = ['java', 'random',strsign,str(size)]
                            outputinfo = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT).decode().strip().split('\r\n')
                            content = list(map(stripfloat,outputinfo))
                            tmp = tf.constant(content, dtype=tf.float32,shape = fshape)
                            addres = tf.add(tmp,fweights)
                            nw.attr["value"].CopyFrom(tf.AttrValue(tensor=tf.make_tensor_proto(sess.run(addres), tf.float32, fshape)))
                    elif n.op == "Conv2D":#degrade
                        nn = new_model.node.add()
                        nn.op = 'Conv2D'
                        nn.name = n.name
                        for input_name in n.input:
                            nn.input.extend([input_name])
                        nn.attr["T"].CopyFrom(n.attr["T"])
                        nn.attr["use_cudnn_on_gpu"].CopyFrom(n.attr["use_cudnn_on_gpu"])
                        nn.attr["strides"].CopyFrom(n.attr["strides"]) 
                        nn.attr["padding"].CopyFrom(n.attr["padding"]) 
                    elif n.op == "ResizeBilinear":#degrade
                        nn = new_model.node.add()
                        nn.op = "ResizeBilinear"
                        nn.name = n.name
                        for input_name in n.input:
                            nn.input.extend([input_name])
                        nn.attr["T"].CopyFrom(n.attr["T"])
                        nn.attr["align_corners"].CopyFrom(n.attr["align_corners"])
                    elif n.op == "Conv2DBackpropInput":#degrade
                        nn = new_model.node.add()
                        nn.op = "Conv2DBackpropInput"
                        nn.name = n.name
                        for input_name in n.input:
                            nn.input.extend([input_name])
                        nn.attr["data_format"].CopyFrom(n.attr["data_format"])
                        nn.attr["dilations"].CopyFrom(n.attr["dilations"])
                        nn.attr["padding"].CopyFrom(n.attr["padding"])
                        nn.attr["strides"].CopyFrom(n.attr["strides"])
                        nn.attr["T"].CopyFrom(n.attr["T"])
                        nn.attr["use_cudnn_on_gpu"].CopyFrom(n.attr["use_cudnn_on_gpu"])
                    elif n.op == "DepthwiseConv2dNative":#degrade
                        nn = new_model.node.add()
                        nn.op = "DepthwiseConv2dNative"
                        nn.name = n.name
                        for input_name in n.input:
                            nn.input.extend([input_name])
                        nn.attr["data_format"].CopyFrom(n.attr["data_format"])
                        nn.attr["padding"].CopyFrom(n.attr["padding"])
                        nn.attr["strides"].CopyFrom(n.attr["strides"])
                        nn.attr["T"].CopyFrom(n.attr["T"])
                    elif n.op=="Cast":#degrade
                        nn = new_model.node.add()
                        nn.op = "Cast"
                        nn.name = n.name
                        for input_name in n.input:
                            nn.input.extend([input_name])
                        nn.attr["DstT"].CopyFrom(n.attr["DstT"])
                        nn.attr["SrcT"].CopyFrom(n.attr["SrcT"])
                    elif n.op=="Equal":#degrade
                        nn = new_model.node.add()
                        nn.op = "Equal"
                        nn.name = n.name
                        for input_name in n.input:
                            nn.input.extend([input_name])
                        nn.attr["T"].CopyFrom(n.attr["T"])
                    else:
                        nn = new_model.node.add()
                        nn.CopyFrom(n)
                g_combined_def = graph_util.convert_variables_to_constants(sess, new_model, outputnames) 
                model_f = tf.gfile.GFile(destmodel,"wb")
                model_f.write(g_combined_def.SerializeToString())

    except Exception as e:
        with open(infofile,'a') as f:
            f.write((modelname[modelname.find("assets\\")+7:]).replace('\\','/')+'\n')
            print((modelname[modelname.find("assets\\")+7:]).replace('\\','/')+'\n')
            f.write('------\n')
        print("error:")
        print("fail to modify model")
        print(e)
        return -1
            

    cmd = ['java', 'MD5',destmodel]
    outputinfo = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT).decode().split('\r\n')
    print(outputinfo)
    with open(infofile,'a') as f:
        f.write((modelname[modelname.find("assets\\")+7:]).replace('\\','/')+'\n')
        f.write(outputinfo[0]+'\n')
        f.write(strsign+'\n')
        f.write(str(signinputindex)+'\n')
        for shape in shapes:
            strshape = []
            for i in shape:
                strshape.append(str(i))
            f.write(','.join(strshape)+'\n')
        f.write('------\n')
    return 0


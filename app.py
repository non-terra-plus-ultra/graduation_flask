import io
import logging
import os
import shutil
import json
from PIL import Image
from flask_sqlalchemy import SQLAlchemy
from matplotlib import pyplot as plt
from sqlalchemy import text
from sqlalchemy.dialects.mysql import pymysql
from sqlalchemy.engine import cursor
import pymysql
# 后端画布
plt.switch_backend('agg')
from ultralytics import YOLO
from flask import Flask, Response, stream_with_context, send_from_directory
import cv2
from cv2 import getTickCount, getTickFrequency
#跨域请求问题
from flask_cors import CORS
app = Flask(__name__)
#跨域
CORS(app)


# 动态追踪修改设置，如未设置只会提示警告, 不建议开启
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# # 查询时会显示原始SQL语句
# app.config['SQLALCHEMY_ECHO'] = True
# conn = pymysql.Connect(
#         host = '127.0.0.1',
#         port = 3306,
#         user = 'root',
#         passwd = '1234',
#         db = 'graproject',
#         charset = 'utf8')
#
# cursor = conn.cursor()
# sql = "select * from user"
# sql2 = "insert into user values('2020','2020')"
# cursor.execute(sql)
# results = cursor.fetchall()
# for row in results:
#     username = row[0]
#     email = row[1]
#     print("emial=%s, username=%s" % (email, username))
# cursor.close()
# conn.close()
# 打开数据库连接

db = pymysql.connect(host='127.0.0.1',
                     user='root',
                     password='1234',
                     database='graproject')

# 使用 cursor() 方法创建一个游标对象 cursor
cursor = db.cursor()

# # 使用 execute() 方法执行 SQL，如果表存在则删除
# cursor.execute("DROP TABLE IF EXISTS EMPLOYEE")
#
# # 使用预处理语句创建表
# sql = """CREATE TABLE EMPLOYEE (
#          FIRST_NAME  CHAR(20) NOT NULL,
#          LAST_NAME  CHAR(20),
#          AGE INT,
#          SEX CHAR(1),
#          INCOME FLOAT )"""
#
# cursor.execute(sql)
#
# # 关闭数据库连接
# db.close()


from flask import request, jsonify
from werkzeug.utils import secure_filename


# @app.route('/api/upload', methods=['POST'])
# def upload_files():
#     UPLOAD_FOLDER = "C:/Users/20885/Desktop/test"
#     if not os.path.exists(UPLOAD_FOLDER):
#         os.makedirs(UPLOAD_FOLDER)
#
#     files = request.files.getlist(1)  # 获取所有名为 'file' 的文件
#     results = []
#     print(1)
#     print(files)
#     i=0
#     for file in files:
#         i=+1
#         if file.filename == '':
#             continue
#
#         filename = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
#         file.save(filename)
#
#         # 在这里调用你的Python脚本处理图片
#         # ...
#
#         # 将处理结果或相关信息添加到 results 列表中
#         results.append({'filename': file.filename, 'status': 'uploaded'})
#         print()
#     return jsonify(results), 200

UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


@app.route('/detect/<path:filename>')
def send_static1(filename):
    static_folder1 = os.path.join(app.root_path, 'detect')
    return send_from_directory(static_folder1, filename)
@app.route('/segment/<path:filename>')
def private_files(filename):
    static_folder1 = os.path.join(app.root_path, 'segment')
    return send_from_directory(static_folder1, filename)


# 覆冰检测
@app.route('/api/segment', methods=['POST'])
def segment():
    user_no = request.form.get('user_no')
    print(user_no)
    # UPLOAD_FOLDER = os.path.join(app.config['UPLOAD_FOLDER'],request.form.get('user_no'))
    UPLOAD_FOLDER = 'uploads'+'/'+request.form.get('user_no')
    file_path = os.path.join("D:/pythonProject/graflask/uploads/", request.form.get('user_no'))
    if os.path.exists(UPLOAD_FOLDER):
        shutil.rmtree(file_path)

    os.makedirs(UPLOAD_FOLDER)
    results = []
    files = request.files.getlist('file')
    print(files)
    for file in files:
        filename = file.filename
        filename = os.path.join(app.config['UPLOAD_FOLDER'],request.form.get('user_no'), filename)
        file.save(os.path.join(app.root_path, filename))

    sql1 = "select max(number) from result where pno = %s and result_describe = 'segment'"
    cursor.execute(sql1, user_no)
    result = cursor.fetchone()
    max_value = result[0]
    print(result)
    if max_value == None:
        max_value =1
    else:
        max_value = max_value + 1
    print(max_value)

    # 模型预测
    model = YOLO('D:/pythonProject/ultralytics-8.1.0/runs/segment/train10/weights/best.pt')
    source = 'D:/pythonProject/graflask/uploads/'+request.form.get('user_no')+'/'
    results = model(source, save=True, name="D:/pythonProject/graflask/segment/"+request.form.get('user_no')+'/'+'result%s/'%(max_value))



    folder_path = "D:/pythonProject/graflask/segment/"+request.form.get('user_no')+'/'+'result%s/'%(max_value)
    filedata = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            # 获取文件的创建时间（注意：在某些操作系统上可能不准确）
            try:
                creation_time = datetime.fromtimestamp(os.path.getctime(file_path)).strftime("%Y-%m-%d %H:%M:%S")
            except OSError as e:
                print(f"Error getting creation time for {file_path}: {e}")
                continue
            print(file + ',,' + file_path + ',,' + str(creation_time))
            filedata.append((file, file_path, str(creation_time), 'segment', request.form.get('user_no'),max_value  ))

    print(filedata)
    sql = "INSERT INTO result (result_name, result_path, result_time,result_describe,pno,number) VALUES (%s, %s, %s, %s, %s ,%s)"
    # sql = "INSERT INTO user (pno, pwd) VALUES (%d, %s)" % (20202020,'20202020')
    # mydata={
    #     "result_name": file,
    #     "result_path": file_path,
    #     "result_time": creation_time
    # }
    # sql = "update user set pwd='20202021' where pno = 20202384"
    # sql = "select * from user"
    try:
        db.begin()
        cursor.executemany(sql, filedata)
        db.commit()
    except Exception as e:
        db.rollback()
        print(e)

    x = list()
    y = list()

    for m in results:
        confs = m.boxes.conf.tolist();
        for conf in confs:
            x.append(conf)
    x.sort()
    flag = 0
    for i in x:
        flag = flag + 1
        y.append(flag)

    print(x, y)
    plt.figure()  # 声明一个新画布#
    plt.plot(y, x, color="blue", label="icicle")
    plt.xlabel("x")
    plt.ylabel("confidence")
    plt.title("Segemnt Result")
    plt.legend()
    plt.savefig( "D:/pythonProject/graflask/segment/"+request.form.get('user_no')+'/'+'result%s/'%(max_value)+ "statistics.png")


    # 文件的完整路径
    file_path = "D:/pythonProject/graflask/segment/"+request.form.get('user_no')+'/'+'result%s/'%(max_value)+ "statistics.png"

    # 获取文件名
    file_name = os.path.basename(file_path)
    print(file_name)

    try:
        creation_time = datetime.fromtimestamp(os.path.getctime(file_path)).strftime("%Y-%m-%d %H:%M:%S")
    except OSError as e:
        print(f"Error getting creation time for {file_path}: {e}")
    print(creation_time)
    sql = "INSERT INTO statistics (sta_name, sta_path, sta_time,sta_describe,pno,number) VALUES (%s, %s, %s, %s, %s ,%s)"

    fileda=[file_name, file_path, str(creation_time), 'segment', request.form.get('user_no'), max_value]
    try:
        db.begin()
        cursor.execute(sql,fileda)
        db.commit()
    except Exception as e:
        db.rollback()
        print(e)
    # return jsonify(results), 200
    return "success"


#异物检测
@app.route('/api/upload', methods=['POST'])
def upload_files():
    user_no = request.form.get('user_no')
    print(user_no)
    # UPLOAD_FOLDER = os.path.join(app.config['UPLOAD_FOLDER'],request.form.get('user_no'))
    UPLOAD_FOLDER = 'uploads'+'/'+request.form.get('user_no')
    file_path = os.path.join("D:/pythonProject/graflask/uploads/", request.form.get('user_no'))
    if os.path.exists(UPLOAD_FOLDER):
        shutil.rmtree(file_path)

    os.makedirs(UPLOAD_FOLDER)
    results = []
    files = request.files.getlist('file')
    print(files)
    for file in files:
        filename = file.filename
        filename = os.path.join(app.config['UPLOAD_FOLDER'],request.form.get('user_no'), filename)
        file.save(os.path.join(app.root_path, filename))

    sql1 = "select max(number) from result where pno = %s and result_describe = 'detect'"
    cursor.execute(sql1, user_no)
    result = cursor.fetchone()
    max_value = result[0]
    print(result)
    if max_value == None:
        max_value =1
    else:
        max_value = max_value + 1
    print(max_value)

    # 模型预测
    model = YOLO('D:/pythonProject/ultralytics-8.1.0/runs/detect/train6/weights/best.pt')
    source = 'D:/pythonProject/graflask/uploads/'+request.form.get('user_no')+'/'
    results = model(source, save=True, name="D:/pythonProject/graflask/detect/"+request.form.get('user_no')+'/'+'result%s/'%(max_value))



    folder_path = "D:/pythonProject/graflask/detect/"+request.form.get('user_no')+'/'+'result%s/'%(max_value)
    filedata = []
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            # 获取文件的创建时间（注意：在某些操作系统上可能不准确）
            try:
                creation_time = datetime.fromtimestamp(os.path.getctime(file_path)).strftime("%Y-%m-%d %H:%M:%S")
            except OSError as e:
                print(f"Error getting creation time for {file_path}: {e}")
                continue
            print(file + ',,' + file_path + ',,' + str(creation_time))
            filedata.append((file, file_path, str(creation_time), 'detect', request.form.get('user_no'),max_value  ))

    print(filedata)
    sql = "INSERT INTO result (result_name, result_path, result_time,result_describe,pno,number) VALUES (%s, %s, %s, %s, %s ,%s)"
    # sql = "INSERT INTO user (pno, pwd) VALUES (%d, %s)" % (20202020,'20202020')
    # mydata={
    #     "result_name": file,
    #     "result_path": file_path,
    #     "result_time": creation_time
    # }
    # sql = "update user set pwd='20202021' where pno = 20202384"
    # sql = "select * from user"
    try:
        db.begin()
        cursor.executemany(sql, filedata)
        db.commit()
    except Exception as e:
        db.rollback()
        print(e)

    x = [0, 0, 0]
    y = ["kite", "bulloon", "nest"]
    conf_kite = list()
    conf_bullon = list()
    conf_nest = list()
    x1 = list()
    x2 = list()
    x3 = list()
    m = list()
    for m in results:
        confs = m.boxes.conf.tolist();
        clses = m.boxes.cls.tolist();

        for cls, conf in zip(clses, confs):
            if cls == 0.0:
                x[0] = x[0] + 1
                conf_kite.append(conf)
            elif cls == 2.0:
                x[1] = x[1] + 1
                conf_bullon.append(conf)
            elif cls == 3.0:
                x[2] = x[2] + 1
                conf_nest.append(conf)
    conf_kite.sort()
    conf_bullon.sort()
    conf_nest.sort()
    flag = 0
    for i in conf_kite:
        flag = flag + 1
        x1.append(flag)
    flag = 0
    for i in conf_bullon:
        flag = flag + 1
        x2.append(flag)
    flag = 0
    for i in conf_nest:
        flag = flag + 1
        x3.append(flag)
    print(conf_kite, x1, conf_bullon, x2, conf_nest, x3)

    # plot1
    plt.figure()  # 声明一个新画布
    plt.subplot(1, 2, 1)
    plt.plot(x1, conf_kite, color="red", label="kite")
    plt.plot(x2, conf_bullon, color="green", label="bulloon")
    plt.plot(x3, conf_nest, color="blue", label="nest")
    plt.xlabel("x")
    plt.ylabel("confidence")
    plt.legend()
    plt.title("analysis")

    # plot2
    plt.subplot(1, 2, 2)
    plt.bar(y, x)
    plt.xlabel("class")
    plt.ylabel("number")
    plt.title("statistics")
    plt.legend()
    plt.suptitle("Detect evaluation")
    plt.savefig( "D:/pythonProject/graflask/detect/"+request.form.get('user_no')+'/'+'result%s/'%(max_value)+ "statistics.png")


    # 文件的完整路径
    file_path = "D:/pythonProject/graflask/detect/"+request.form.get('user_no')+'/'+'result%s/'%(max_value)+ "statistics.png"

    # 获取文件名
    file_name = os.path.basename(file_path)
    print(file_name)

    try:
        creation_time = datetime.fromtimestamp(os.path.getctime(file_path)).strftime("%Y-%m-%d %H:%M:%S")
    except OSError as e:
        print(f"Error getting creation time for {file_path}: {e}")
    print(creation_time)
    sql = "INSERT INTO statistics (sta_name, sta_path, sta_time,sta_describe,pno,number) VALUES (%s, %s, %s, %s, %s ,%s)"

    fileda=[file_name, file_path, str(creation_time), 'detect', request.form.get('user_no'), max_value]
    try:
        db.begin()
        cursor.execute(sql,fileda)
        db.commit()
    except Exception as e:
        db.rollback()
        print(e)
    # return jsonify(results), 200
    return "success"

@app.route('/testData/inputDB', methods=['GET', 'POST'])
def inputDB():
    print(1)
    data = request.data
    print(type(data))
    data_str = eval(data.decode('UTF-8'))
    print(data_str)
    print(type(data_str))
    print(data_str["fileList"])
    # print(data.dict("fileF"))
    print(2)

    return "success"
# # -*- coding: utf-8 -*-
# import os
# from urllib.parse import urljoin
#
# from flask import Flask, request, send_from_directory
# from flask_cors import CORS
# import uuid
#
# app = Flask(__name__)
# CORS(app, supports_credentials=True)
#
# ######################
# # 配置文件
# ######################
# UPLOAD_FOLDER = 'uploads'
# if not os.path.isdir(UPLOAD_FOLDER):
#     os.mkdir(UPLOAD_FOLDER)
#
# app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
#
# # 允许的扩展名
# ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}
#
# # 1M
# app.config['MAX_CONTENT_LENGTH'] = 1 * 1024 * 1024
#
#
# # 检查后缀名是否为允许的文件
# def allowed_file(filename):
#     return '.' in filename and \
#            filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
#
#
# # 获取文件名
# def random_filename(filename):
#     ext = os.path.splitext(filename)[-1]
#     return uuid.uuid4().hex + ext
#
#
# # 上传文件
# @app.route("/upload", methods=['POST'])
# def upload():
#     file = request.files.get('file')
#
#     if file and allowed_file(file.filename):
#         print(file.filename)
#
#         filename = random_filename(file.filename)

#         filepath = os.path.join(UPLOAD_FOLDER, filename)
#         file.save(os.path.join(app.root_path, filepath))
#
#         file_url = urljoin(request.host_url, filepath)
#         print(filename,filepath ,file_url,app.root_path, filepath)
#         return file_url
#     return "not allow ext"
#
#
# # 获取文件
# @app.route('/uploads/<path:filename>')
# def get_file(filename):
#     return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

# 直接读本地图片的post
# 项目的根目录 起服务后，相对路径可能会改变
basedir = os.path.abspath(os.path.dirname(__file__))

@app.route('/getPic',methods=['GET', 'POST'])
def findpic():
    data = request.args.get('result_path')
    # data = 'D:/pythonProject/graflask/detect/20202020/result16/statistics.png'
    print(data)
    img_url = data
    with open(img_url, 'rb') as f:
        a = f.read()
    '''对读取的图片进行处理'''
    img_stream = io.BytesIO(a)
    img = Image.open(img_stream)


    imgByteArr = io.BytesIO()
    img.save(imgByteArr,format='PNG')
    imgByteArr = imgByteArr.getvalue()
    # print(imgByteArr)
    return imgByteArr


@app.route('/getDetectAll', methods=['GET'])
def getDetectAll():
    images = []
    path = request.args.get('result_path')
    print(path)
    # "D:\pythonProject\graflask\segment\20200001\result1\1_ice502.jpg"
    fdir = os.path.dirname(path)
    # D:\pythonProject\graflask\segment\20200001\result1"
    # 获取当前工作目录的目录名（即文件夹名）
    current_dir_name = os.path.basename(fdir)
    gdir = os.path.dirname(fdir)
    g_dir_name = os.path.basename(gdir)



    folder_path = os.path.join(app.root_path, 'detect',g_dir_name, current_dir_name)
    print(folder_path)
    for filename in os.listdir(folder_path):
        if filename.endswith(('.jpg', '.jpeg', '.gif', '.bmp')):
            images.append(os.path.join('http://127.0.0.1:8801/detect',g_dir_name, current_dir_name, filename))
    return jsonify(images)

@app.route('/getSegmentAll', methods=['GET'])
def getSegmentAll():
    images = []
    path = request.args.get('result_path')
    print(path)
    # "D:\pythonProject\graflask\segment\20200001\result1\1_ice502.jpg"
    fdir = os.path.dirname(path)
    # D:\pythonProject\graflask\segment\20200001\result1"
    # 获取当前工作目录的目录名（即文件夹名）
    current_dir_name = os.path.basename(fdir)
    gdir = os.path.dirname(fdir)
    g_dir_name = os.path.basename(gdir)



    folder_path = os.path.join(app.root_path, 'segment',g_dir_name, current_dir_name)
    print(folder_path)
    for filename in os.listdir(folder_path):
        if filename.endswith(('.jpg', '.jpeg', '.gif', '.bmp')):
            images.append(os.path.join('http://127.0.0.1:8801/segment',g_dir_name, current_dir_name, filename))
    return jsonify(images)


@app.route('/getSta',methods=['GET', 'POST'])
def findSta():
    data = request.args.get('sta_path')
    # data = 'D:/pythonProject/graflask/detect/20202020/result16/statistics.png'
    print(data)
    img_url = data
    with open(img_url, 'rb') as f:
        a = f.read()
    '''对读取的图片进行处理'''
    img_stream = io.BytesIO(a)
    img = Image.open(img_stream)


    imgByteArr = io.BytesIO()
    img.save(imgByteArr,format='PNG')
    imgByteArr = imgByteArr.getvalue()
    # print(imgByteArr)
    return imgByteArr

from datetime import datetime
@app.route('/insertResult',methods=['GET', 'POST'])
def insertResult():
    folder_path = 'D:/pythonProject/ultralytics-8.1.0/datasets/detect_test'
    filedata=[]
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            file_path = os.path.join(root, file)
            # 获取文件的创建时间（注意：在某些操作系统上可能不准确）
            try:
                creation_time = datetime.fromtimestamp(os.path.getctime(file_path)).strftime("%Y-%m-%d %H:%M:%S")
            except OSError as e:
                print(f"Error getting creation time for {file_path}: {e}")
                continue
            print(file+',,'+file_path+',,'+str(creation_time))
            filedata.append((file, file_path, str(creation_time), 'detect', 20202384, 1))

    print(filedata)
    sql = "INSERT INTO result (result_name, result_path, result_time,result_describe,pno,number) VALUES (%s, %s, %s, %s, %s ,%s)"
    #sql = "INSERT INTO user (pno, pwd) VALUES (%d, %s)" % (20202020,'20202020')
    # mydata={
    #     "result_name": file,
    #     "result_path": file_path,
    #     "result_time": creation_time
    # }
    #sql = "update user set pwd='20202021' where pno = 20202384"
    #sql = "select * from user"
    try:
        db.begin()
        cursor.executemany(sql,filedata)
        db.commit()
    except Exception as e:
        db.rollback()
        print(e)




    return "success"


@app.route('/user/login',methods=['GET', 'POST'])
def login():
    id = request.form.get('id_st')
    print(type(id))
    pwd = request.form.get('pwd_st')
    sql = "SELECT * FROM user WHERE pno = %s AND pwd = %s"
    cursor.execute(sql, (id, pwd))
    result = cursor.fetchone()


    if result:
        # 登录成功

        return "Login success" # 重定向到仪表盘或其他受保护的页面
    else:
        # 登录失败
        return "Login fail"

@app.route('/manager/malogin',methods=['GET', 'POST'])
def malogin():
    id = request.form.get('id_st')
    print(type(id))
    pwd = request.form.get('pwd_st')
    sql = "SELECT * FROM manager WHERE ma_pno = %s AND ma_pwd = %s"
    cursor.execute(sql, (id, pwd))
    result = cursor.fetchone()


    if result:
        # 登录成功

        return "Login success" # 重定向到仪表盘或其他受保护的页面
    else:
        # 登录失败
        return "Login fail"

@app.route('/user/register',methods=['GET', 'POST'])
def register():
    id = request.form.get('id_st')

    print(type(id))
    pwd = request.form.get('pwd_st')
    name_st = request.form.get('name_st')
    sql = "SELECT * FROM user WHERE pno = %s"
    cursor.execute(sql, id)
    result = cursor.fetchone()

    if result:
        # 注册
        return "Fail register"

    else:
        sql1 = "insert into user(pno,pwd) values(%s,%s)"
        try:
            db.begin()
            cursor.execute(sql1, [id ,pwd])
            db.commit()
        except Exception as e:
            db.rollback()
            print(e)
        sql2 = "insert into user_info(pno,name) values(%s,%s)"
        try:
            db.begin()
            cursor.execute(sql2, [id ,name_st])
            db.commit()
        except Exception as e:
            db.rollback()
            print(e)
        return "Register success" # 重定向到仪表盘或其他受保护的页面



@app.route('/user/getResult',methods=['GET', 'POST'])
def getResult():
    # pno = request.args.get('id_st')
    pno = request.form.get('id_st')
    print(type(pno))
    print(pno)
    sql = "SELECT * FROM result WHERE pno = %s and result_describe='detect' order by number desc"
    cursor.execute(sql, pno)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)

@app.route('/user/userInfoList',methods=['GET', 'POST'])
def userInfoList():
    sql = "SELECT * FROM user_info"
    cursor.execute(sql)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)

@app.route('/user/getResult3',methods=['GET', 'POST'])
def getResult3():
    # pno = request.args.get('id_st')

    sql = "SELECT * FROM result WHERE result_describe='detect'"
    cursor.execute(sql)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)

@app.route('/user/getResult4',methods=['GET', 'POST'])
def getResult4():
    sql = "SELECT * FROM result where result_describe='segment'"
    cursor.execute(sql)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)

@app.route('/manager/getSearch2',methods=['GET', 'POST'])
def getSearch2():
    number = request.form.get('input')
    pno = request.form.get('input1')
    print("ws" + pno)

    # if number:
    #     print(number)
    #     sql = "SELECT * FROM result where result_describe='segment' and number = %s and result_time like %s"
    # else:
    #     number = '%'
    #     sql = "SELECT * FROM result where result_describe='segment' and number like %s and result_time like %s"
    # value = request.form.get('value')
    if number and pno:
        print(number)
        print(pno)
        sql = "SELECT * FROM result where result_describe='segment' and number = %s and result_time like %s and pno=%s"
    elif number and not pno:
        pno = '%'
        sql = "SELECT * FROM result where result_describe='segment' and number = %s and result_time like %s and pno like %s"
    elif not number and pno:
        number = '%'
        sql = "SELECT * FROM result where result_describe='segment' and number like %s and result_time like %s and pno = %s"
    else:
        number = '%'
        pno = '%'
        sql = "SELECT * FROM result where result_describe='segment' and number like %s and result_time like %s and pno like %s"
    value = request.form.get('value')

    if value:
        value = value[:10] + "%"
        print(value)
    else:
        value = '%'
    print(type(pno))
    print(pno)
    cursor.execute(sql, (number, value, pno))
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)
@app.route('/manager/getSearch',methods=['GET', 'POST'])
def getSearch():

    number = request.form.get('input')
    pno = request.form.get('input1')
    print("ws"+pno)

    # if number:
    #     print(number)
    #     sql = "SELECT * FROM result where result_describe='segment' and number = %s and result_time like %s"
    # else:
    #     number = '%'
    #     sql = "SELECT * FROM result where result_describe='segment' and number like %s and result_time like %s"
    # value = request.form.get('value')
    if number and pno:
        print(number)
        print(pno)
        sql = "SELECT * FROM result where result_describe='detect' and number = %s and result_time like %s and pno=%s"
    elif number and not pno:
        pno = '%'
        sql = "SELECT * FROM result where result_describe='detect' and number = %s and result_time like %s and pno like %s"
    elif not number and pno:
        number = '%'
        sql = "SELECT * FROM result where result_describe='detect' and number like %s and result_time like %s and pno = %s"
    else:
        number = '%'
        pno = '%'
        sql = "SELECT * FROM result where result_describe='detect' and number like %s and result_time like %s and pno like %s"
    value = request.form.get('value')

    if value:
        value = value[:10]+"%"
        print(value)
    else:
        value = '%'
    print(type(pno))
    print(pno)
    cursor.execute(sql,(number,value,pno))
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)

@app.route('/manager/getRound',methods=['GET', 'POST'])
def getRound():

    sql = "SELECT * FROM result where result_describe='segment'"
    cursor.execute(sql)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)


@app.route('/user/getUserInfo2', methods=['GET', 'POST'])
def getUserInfo2():
    # pno = request.args.get('pno')
    pno = request.form.get('pno')
    # sql = "SELECT * FROM user_info WHERE pno = %s"

    sql = "SELECT * FROM user_info WHERE pno = %s"

    cursor.execute(sql, pno)

    results = cursor.fetchone()

    print(results)
    data_dict = {
        'loc': results[0],
        'sex': results[1],
        'name': results[2],
        'pno': results[3],
        'mail': results[4]
    }

    # 将结果转换成字典列表，方便转换为 JSON
    data = json.dumps(data_dict)
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应

    return jsonify(data)

@app.route('/user/getUserInfo',methods=['GET', 'POST'])
def getUserInfo():

    # pno = request.args.get('pno')
    pno = request.form.get('pno')


    # data_dict = json.loads(pno)
    # pno = data_dict['pno']
    # print(pno)
    # sql = "SELECT * FROM user_info WHERE pno = %s"

    sql = "SELECT * FROM user_info WHERE pno = %s"

    cursor.execute(sql,pno)

    results = cursor.fetchone()

    print(results)
    data_dict = {
        'loc': results[0],
        'sex': results[1],
        'name': results[2],
        'pno':results[3],
        'mail':results[4]
    }

    # 将结果转换成字典列表，方便转换为 JSON
    data = json.dumps(data_dict)
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应

    return jsonify(data)

@app.route('/user/updateUserPwd',methods=['GET', 'POST'])
def updateUserPwd():
    pno = request.form.get('pno')
    print(pno)
    sql = "Update user set pwd = '1234' where pno = %s"

    try:
        db.begin()
        cursor.execute(sql, (pno,))
        db.commit()
    except Exception as e:
        db.rollback()
        print(e)
        return "Fail update"

    return "Success update"
@app.route('/user/updateUserInfo',methods=['GET', 'POST'])
def updateUserInfo():
    # pno = request.args.get('pno')
    pno = request.data

    print(type(pno))
    print(pno)
    print(type(pno))

    data_dict = json.loads(pno)
    pno = data_dict['pno']
    name = data_dict['name']
    sex = data_dict['sex']
    mail = data_dict['mail']
    loc = data_dict['loc']
    print(pno)
    print(name)
    print(sex)
    print(mail)
    print(loc)
    if not name:
        name = ''
    if not sex:
        sex = ''
    if not mail:
        mail=''
    if not loc:
        loc=''
    # sql = "SELECT * FROM user_info WHERE pno = %s"
    sql = "Update user_info set name=%s , sex = %s , mail = %s , loc = %s where pno = %s"

    try:
        db.begin()
        cursor.execute(sql, (name, sex, mail, loc, pno))
        db.commit()
    except Exception as e:
        db.rollback()
        print(e)
        return "Fail update"

    return "Success update"

@app.route('/user/getSegment',methods=['GET', 'POST'])
def getSegment():
    # pno = request.args.get('id_st')
    pno = request.form.get('id_st')
    print(type(pno))
    print(pno)
    sql = "SELECT * FROM result WHERE pno = %s and result_describe='segment' order by number desc"
    cursor.execute(sql, pno)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)

@app.route('/user/getStatistics',methods=['GET', 'POST'])
def getStatistics():
    # pno = request.args.get('id_st')
    pno = request.form.get('id_st')
    print(type(pno))
    print(pno)
    sql = "SELECT * FROM statistics WHERE pno = %s and sta_describe='detect'"
    cursor.execute(sql, pno)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)

@app.route('/user/getStaSegment',methods=['GET', 'POST'])
def getStaSegment():
    print('1')
    # pno = request.args.get('id_st')
    pno = request.form.get('id_st')
    print(type(pno))
    print(pno)
    sql = "SELECT * FROM statistics WHERE pno = %s and sta_describe='segment'"
    cursor.execute(sql, pno)
    results = cursor.fetchall()
    # 将结果转换成字典列表，方便转换为 JSON
    data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in results]
    print(data)
    # 使用 jsonify 将数据转换成 JSON 格式的响应
    return jsonify(data)


def generate_frames():
    # 打开摄像头，这里使用0表示使用第一个摄像头
    cap = cv2.VideoCapture(0)
    width = 1240
    height = 520
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, width)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, height)
    model = YOLO("D:/pythonProject/ultralytics-8.1.0/runs/detect/train18/weights/best.pt")
    while True:
        # 读取一帧图像
        success, frame = cap.read()
        if not success:
            break
        loop_start = getTickCount()
        results = model.predict(source=frame)
        annotated_frame = results[0].plot()

        for m in results:
            confs = m.boxes.conf.tolist();
            clses = m.boxes.cls.tolist();
            kite = 0
            balloon = 0
            nest = 0
            for cls, conf in zip(clses, confs):
                if cls == 0.0:
                    kite = kite+1
                elif cls == 2.0:
                    balloon = balloon+1
                elif cls == 3.0:
                    nest =nest+1
        # 中间放自己的显示程序
        loop_time = getTickCount() - loop_start
        total_time = loop_time / (getTickFrequency())
        FPS = int(1 / total_time)
        # 在图像左上角添加FPS文本
        fps_text = f"FPS: {FPS:.2f}"
        font = cv2.FONT_HERSHEY_SIMPLEX
        font_scale = 0.5
        font_thickness = 2
        text_color = (0, 191, 255)  #
        text_position = (10, 30)  # 左上角位置
        cv2.putText(annotated_frame, fps_text, text_position, font, font_scale, text_color, font_thickness)

        fps_text = f"kite: {kite:.2f}"
        font = cv2.FONT_HERSHEY_SIMPLEX
        font_scale = 0.5
        font_thickness = 2
        text_color = (0, 191, 255)  # 红色
        text_position = (10, 60)  # 左上角位置
        cv2.putText(annotated_frame, fps_text, text_position, font, font_scale, text_color, font_thickness)

        fps_text = f"balloon: {balloon:.2f}"
        font = cv2.FONT_HERSHEY_SIMPLEX
        font_scale = 0.5
        font_thickness = 2
        text_color = (0, 191, 255)  # 红色
        text_position = (10, 90)  # 左上角位置
        cv2.putText(annotated_frame, fps_text, text_position, font, font_scale, text_color, font_thickness)

        fps_text = f"nest: {nest:.2f}"
        font = cv2.FONT_HERSHEY_SIMPLEX
        font_scale = 0.5
        font_thickness = 2
        text_color = (0, 191, 255)  # 红色
        text_position = (10, 120)  # 左上角位置
        cv2.putText(annotated_frame, fps_text, text_position, font, font_scale, text_color, font_thickness)

            # OpenCV读取的图像是BGR格式的，但JPEG是RGB格式的，所以需要转换
        # 注意：这里为了简单起见没有处理色彩空间转换，你可能需要添加cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

        # 将图像帧编码为JPEG格式
        # 这里使用`cv2.imencode`来编码图像为JPEG，并获取其字节数据
        _, jpeg = cv2.imencode('.jpg', annotated_frame)

        # 将字节数据转换为Flask可以发送的响应格式
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + jpeg.tobytes() + b'\r\n')

        # 释放摄像头资源
    cap.release()


@app.route('/video_feed')
def video_feed():
    """Video streaming route. Put this in the src attribute of an img tag."""
    return Response(stream_with_context(generate_frames()),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8801)

import pandas as pd
import numpy as np

class_info = pd.read_excel('./class_info.xlsx', header=None)
# 设置列名
class_info.columns = ['学号', '姓名','性别','专业','班级']
print(class_info.head())

def createBirth():
    # 生成随机出生日期
    year = np.random.randint(2002, 2003, 1)[0]
    month = np.random.randint(1, 12, 1)[0]
    day = np.random.randint(1, 28, 1)[0]
    return "%d-%d-%d" % (year, month, day)

def createBirthPlace():
    # 生成随机出生地
    birthPlace = ['北京', '上海', '广州', '深圳', '杭州', '成都', '武汉', '南京', '西安', '长沙']
    return birthPlace[np.random.randint(0, 10, 1)[0]]

def createAge():
    # 生成随机年龄
    return np.random.randint(18, 22, 1)[0]

# 构造sql数据
sql = "insert into Student values \n"
for student in class_info.values:
    sql += "('%s','%s','%s',%i,'%s', '%s', '%s') \n" % \
    (student[0], student[1], student[2], createAge(), student[4]+"-"+student[3], createBirthPlace(), createBirth())

# 保存sql txt
with open('./student.txt', 'w') as f:
    f.write(sql)

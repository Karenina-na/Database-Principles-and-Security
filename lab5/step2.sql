-- 使用数据库
use MY_DBMS;

-- 准备数据
-- 学生表
insert into Student(Sno,Sname,Ssex,Sage,Sdept,Sbirth) values
('001', '张三', '男', 18, 'CS', '2000-01-01'), 
('002', '李四', '女', 19, 'MA', '1999-02-02'),
('003', '薛宝五', '男', 20, 'AC', '1998-03-03'),
('004', '欧六', '女', 21, 'CS', '1997-04-04'),
('005', '欧阳七', '男', 22, 'MA', '1996-05-05'),
('006', '杨八', '女', 23, 'AC', '1995-06-06'),
('007', '周九', '男', 24, 'CS', '1994-07-07'),
('008', '胡十', '女', 18, 'MA', '2000-08-08'),
('009', '郑十一', '男', 19, 'AC', '1999-09-09'), 
('010', '蒋十二', '女', 20, 'CS', '1998-10-10'), 
('011', '陈十三', '男', 21, 'MA', '1997-11-11'),
('012', '黄十四', '女', 22, 'AC', '1996-12-12'),
('013', '姜十五', '男', 23, 'CS', '1995-01-13'),
('014', '王十六', '女', 24, 'MA', '1994-02-14'),
('015', '冯十七', '男', 18, 'AC', '2000-03-15'),
('016', '钱十八', '女', 19, 'CS', '1999-04-16'),
('017', '孙十九', '男', 20, 'MA', '1998-05-17'), 
('018', '吴二十', '女', 21, 'AC', '1997-06-18'),
('019', '朱二十一', '男', 22, 'CS', '1996-07-19'),
('020', '许二十二', '女', 23, 'MA', '1995-08-20'),
('021', '何二十三', '男', 24, 'AC', '1994-09-21');

-- 课程表
insert into Course (Cno,Cname,CCredit,Cpno,CRemark) values
('C001', '数学', 3.0, NULL, 'Introduction to Mathematics'), 
('C002', '物理', 4.5, NULL, 'Advanced Physics'),
('C003', '化学', 3.5, NULL, 'Basic Chemistry'),
('C004', '计算机', 4.0, NULL, 'Advanced Biology '),
('C005', '数据库', 3.0, NULL, 'Introduction to Computer Science'),
('C006', '英语', 2.0, NULL, 'English Composition'),
('C007', '汉语', 3.0, NULL, 'Chinese Language'),
('C008', '日语', 4.0, NULL, 'Beginner Japanese'),
('C009', '法语', 3.5, NULL, 'French Language'),
('C010', '西班牙语',2.0, NULL, 'Spanish 101'),
('C011', '德语', 4.5, NULL,'German 101'),
('C012', '俄语', 3.0, NULL, 'Russian 101'),
('C013', '意大利语', 2.5, NULL, 'Italian 101'),
('C014', '国际关系', 2.0, NULL, 'Introduction to International Relations'), 
('C015', '经济学', 3.0, NULL, 'Principles of Economics'),
('C016', '商业管理', 3.5, NULL, 'Introduction to Business Administration'),
('C017', '法律', 4.0, NULL, 'Introduction to Law'),
('C018', '社会学', 4.5, NULL, 'Introduction to Sociology'),
('C019', '心理学', 2.0, NULL, 'Introduction to Psychology'),
('C020', '人类学', 3.0, NULL, 'Introduction to Anthropology'), 
('C021', '历史', 4.0, NULL, 'Modern World History') ,
('C022', 'math', 4.5, NULL, 'Introduction to Mathematics'), 
('C023', 'DB_security', 3.0, NULL, 'Introduction to Computer Science'),
('C024', 'BASys', 3.0, NULL, 'Course BASys'),
('C025', 'BSys', 3.0, NULL, 'Course BSys'),
('C026', 'T_CM',  4.0, NULL, 'Course T_CM'),   
('C027', 'M_TC', 4.5, NULL, 'Course M_TC'),
('C028', 'MCTC', 4.5, '数学', 'Course MCTC'),
('C029', 'MEAF', 4.5, '数学', 'Course MEAF');


-- 选课表，注意这里的Sno和Cno必须在Student和Course表中存在数据
insert into SC(Sno,Cno,Grade) values
('001', 'C001', 76),
('001', 'C007', 82),
('001', 'C015', 58),
('002', 'C002', 64), 
('002', 'C006', 91), 
('002', 'C017', 88),
('003', 'C003', 83),
('003', 'C008', 77),
('003', 'C018', 55),
('004', 'C004', 72),
('004', 'C009', 84),
('004', 'C019', 93),
('005', 'C005', 89),
('005', 'C014', 78),  
('005', 'C020', 46),
('006', 'C001', 86),
('006', 'C010', 81),
('006', 'C021', 94),
('007', 'C002', 80),
('007', 'C011', 85),
('007', 'C017', 59),  
('008', 'C003', 87),
('008', 'C012', 76),
('008', 'C018', 52),
('009', 'C004', 90),
('009', 'C013', 84),
('009', 'C019', 47),  
('010', 'C005', 81),
('010', 'C014', 86), 
('010', 'C020', 100),
('011', 'C006', 83),
('011', 'C015', 89), 
('011', 'C021', 99),
('012', 'C007', 99),
('012', 'C016', 88),
('012', 'C018', 42),
('013', 'C008', 90), 
('013', 'C017', 87),
('013', 'C019', 33),
('014', 'C009', 78), 
('014', 'C018', 80),
('014', 'C020', 84),
('015', 'C010', 47),
('015', 'C016', 52),
('015', 'C021', 55),
('016', 'C011', 84),
('016', 'C017', 81),
('016', 'C001', 49),
('017', 'C012', 90),
('017', 'C013', 86),
('017', 'C002', 43),
('018', 'C013', 40),
('018', 'C014', 48), 
('018', 'C003', 45),
('019', 'C015', 92),
('019', 'C016', 91),  
('019', 'C004', 87),
('020', 'C017', 93),
('020', 'C018', 94),  
('020', 'C005', 84),
('021', 'C019', 95),
('021', 'C020', 96),  
('021', 'C006', 37)
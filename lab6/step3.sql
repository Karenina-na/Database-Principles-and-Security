use MY_DBMS;

-- 学生表: ...

-- 课程表
insert into Course (Cno,Cname,CCredit,Cpno,CRemark) values
('C001', '数学', 3.0, NULL, 'Introduction to Mathematics'), 
('C002', '物理', 4.5, '数学', 'Advanced Physics'),
('C003', '化学', 3.5, '物理', 'Basic Chemistry'),
('C004', '计算机', 4.0, '数学', 'Advanced Biology '),
('C005', '数据库', 3.0, '数学', 'Introduction to Computer Science'),
('C006', '英语', 2.0, NULL, 'English Composition'),
('C007', '汉语', 3.0, NULL, 'Chinese Language'),
('C008', '日语', 4.0, '英语', 'Beginner Japanese'),
('C009', '法语', 3.5, '英语', 'French Language'),
('C010', '西班牙语',2.0, '英语', 'Spanish 101'),
('C011', '德语', 4.5, '英语','German 101'),
('C012', '俄语', 3.0, '英语', 'Russian 101'),
('C013', '意大利语', 2.5, '法语', 'Italian 101')

-- 选课表: ...
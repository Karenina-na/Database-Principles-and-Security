-- 使用数据库
use MY_DBMS;

-- 学生
insert into Student (StudentID, Name, Gender, BirthDate, Address, PhoneNumber, Email, Height, Weight, Photo, Introduction, Memo, Money, CreditCard) values 
(1, '张三', '男', '2000-01-01', '北京市朝阳区', '13812345678', 'zhangsan@example.com', 175.0, 70.0, 0x0123456789abcdef, '这是张三的简介', N'这是张三的备忘录', 100.50, 500.00);

-- 课程
insert into Course (CourseID, Name, Credit, Teacher, Description, Time, EndTime, ContinueTime, Type, Memo) values
(1, '数据库原理', 3, '张老师', '本课程介绍数据库的基本概念、数据模型、关系代数、SQL语言以及数据库管理系统的实现原理。', '2022-09-01 08:30:00', '2022-12-31 16:30:00', '01:30:00.000', 0x0123456789abcdef, N'本课程的授课计划如下：\n第1周：数据库基本概念和体系结构\n第2周：关系代数和SQL语言\n第3周：数据模型和设计\n第4周：数据库管理系统和实现原理\n');

-- 选课表
insert into SC (StudentID, CourseID, ScoreNormal, ScoreExam, ExamDate, Type) values
(1234567890, 1, 88.5, 90.0, '2022-12-18 09:00:00.000', 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
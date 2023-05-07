-- 如果数据库存在则删除数据库
drop database if exists lab2;

-- 创建数据库
create database lab2;

-- 使用数据库
use lab2;

-- 创建表
/* Student (Sno(char(5))、Sname(Varchar(8))、Ssex(bit)、SbirthDay(smalldatetime)、Sdept(Varchar(30))、SBirthPlace(Varchar(50))))*/
create table Student (
	Sno char(5) primary key, -- 学号
	Sname Varchar(8), -- 姓名
	Ssex bit, -- 性别
	SbirthDay smalldatetime, -- 生日
	Sdept Varchar(30), -- 所在系
	SBirthPlace Varchar(50), -- 籍贯
);

/* Course Cno(char(2))、Cname(Varchar(30))、 Cpno(char(2))、 Ccredt(tinyint) Primary Key: Cno */
create table Course (
	Cno char(2) primary key, -- 课程号
	Cname Varchar(30), -- 课程名
	Cpno char(2), -- 先修课号
	Credit tinyint, -- 学分
);

/*  SC Sno(char(5)、Cno(char(2)、Grade(decimal(4,1))  */
create table SC (
	primary key(Sno,Cno), -- 复合主键
	Sno char(5), -- 学号
	Cno char(2), -- 课程号
	Grade decimal(4,1), --成绩
);
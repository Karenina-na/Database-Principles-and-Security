-- 如果数据库存在则删除数据库
drop database if exists SchoolManager;

-- 创建数据库
create database SchoolManager;

use SchoolManager;

-- 创建表
create table Student (
   Sno nchar(10) primary key not null,
   Sname nchar(10) null,
   Ssex nvarchar(1) null,
   Sage smallint null,
   Sdept nvarchar(50) null,
   Scholarship nvarchar(50) null,
);

create table Course (
	Cno nvarchar(50) primary key not null,
	Cname nvarchar(50) null,
	CCredit numeric(3,1) null,
	Cpno nvarchar(10) null,
);

create table SC (
	Sno nchar(10) not null,
	Cno nvarchar(50) not null,
	Grade numeric(4,1) null,
	primary key (Sno,Cno),
	constraint fk_Student foreign key (Sno) references Student(Sno),
	constraint fk_Course foreign key (Cno) references Course(Cno),
);

create table Course_Plan(
	课程号 varchar(10) null,
	专业学级 varchar(4) null,
	专业代码 varchar(10) null,
	学年 varchar(4) null,
	开课学期 nvarchar(3) null,
	学生数 int null
);

create table Course_Teacher(
	教师编号 varchar(10) null,
	课程号 varchar(10) null,
	专业学级 varchar(4) null,
	专业代码 varchar(10) null,
	学年 varchar(4) null,
	学期 nvarchar(4) null,
	学生数 int null
);
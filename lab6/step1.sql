-- 如果数据库存在则删除数据库
drop database if exists MY_DBMS;

-- 创建数据库
create database MY_DBMS;

use MY_DBMS;

-- 创建表
create table Student (
   Sno nchar(10) primary key not null, -- 主键，不允许空值
   Sname nchar(10),
   Ssex nvarchar(1),
   Sage smallint,
   Sdept nvarchar(50),
   Sbirth date not null, --不允许空值
);

create table Course (
	Cno nvarchar(50) primary key not null, -- 主键，不允许空值
	Cname nvarchar(50),
	CCredit numeric(3,1), -- 三位的数据，小数为一位[dbo].[SC]
	Cpno nvarchar(10),
	CRemark ntext,
);

create table SC (
	Sno nchar(10) not null,
	Cno nvarchar(50) not null,
	primary key (Sno,Cno), -- 设置联合主键
	Grade numeric(4,1), -- 四位的数据，小数为一位
	-- 定义外键
	constraint fk_Student foreign key (Sno) references Student(Sno), -- 定义外键约束fk_Student，将表中属性Sno引用Student表中的Sno属性列
	constraint fk_Course foreign key (Cno) references Course(Cno), -- 定义外键约束fk_Course，将表中属性Cno引用Course表中的Cno属性列
);
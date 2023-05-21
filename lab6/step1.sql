-- 如果数据库存在则删除数据库
drop database if exists MY_DBMS;

-- 创建数据库
create database MY_DBMS;

use MY_DBMS;

-- 创建表
create table Student (
   Sno nchar(10) primary key not null,
   Sname nchar(10) not null,
   Ssex nvarchar(1) not null,
   Sage smallint not null,
   Sdept nvarchar(50) not null,
   Sbirthplace nvarchar(50) not null,
   Sbirthdate date,
);

create table Course (
	Cno nvarchar(50) primary key not null,
	Cname nvarchar(50) not null,
	CCredit numeric(3,1) not null,
	Cpno nvarchar(10),
	CRemark ntext,
);

create table SC (
	Sno nchar(10) not null,
	Cno nvarchar(50) not null,
	primary key (Sno,Cno),
	Grade numeric(4,1),
	constraint fk_Student foreign key (Sno) references Student(Sno),
	constraint fk_Course foreign key (Cno) references Course(Cno),
);
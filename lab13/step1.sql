-- 如果数据库存在则删除数据库
drop database if exists SchoolManagement;

-- 创建数据库
create database SchoolManagement;

use SchoolManagement;

-- 创建表
create table S (
   Sno nchar(10) primary key not null,
   Sname nchar(10) not null,
   Ssex nvarchar(1) not null,
   Sage smallint not null,
   Sdept nvarchar(50) not null,
   BirthPlace nvarchar(50) null,
);

create table C (
	Cno nvarchar(50) primary key not null,
	Cname nvarchar(50) not null,
	Cpno nvarchar(50) null,	
	CCredit int not null,
	constraint fk_C foreign key (Cpno) references C(Cno)
);

create table SC (
	Sno nchar(10) not null,
	Cno nvarchar(50) not null,
	Grade numeric(5,2) not null,
	primary key (Sno,Cno),
	constraint fk_Student foreign key (Sno) references S(Sno),
	constraint fk_Course foreign key (Cno) references C(Cno),
);
-- 如果数据库存在则删除数据库
drop database if exists Study;

-- 创建数据库
create database Study;

use Study;

-- 创建表
create table S (
   Sno nchar(10) primary key not null,
   Sname nchar(10) null,
   Ssex nvarchar(1) null,
   Sage smallint null,
   Sdept nvarchar(50) null,
   Scholarship nvarchar(50) null,
);

create table C (
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
	constraint fk_Student foreign key (Sno) references S(Sno),
	constraint fk_Course foreign key (Cno) references C(Cno),
);

create table BankCard (
	BID nchar(20) primary key not null,
	Sno nchar(10) not null,
	Money decimal(10,2) not null,
)

create table TranFlowIn (
	TFINID int primary key identity(1,1),
	InID nchar(20),
	FromID nchar(20),
	TranMoney decimal(10,2) not null,
	Time datetime
)

create table TranFlowOut(
	TFINID int primary key identity(1,1),
	OnID nchar(20),
	ToID nchar(20),
	TranMoney decimal(10,2) not null,
	Time datetime
)
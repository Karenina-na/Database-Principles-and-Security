-- ������ݿ������ɾ�����ݿ�
drop database if exists SchoolManager;

-- �������ݿ�
create database SchoolManager;

use SchoolManager;

-- ������
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
	�γ̺� varchar(10) null,
	רҵѧ�� varchar(4) null,
	רҵ���� varchar(10) null,
	ѧ�� varchar(4) null,
	����ѧ�� nvarchar(3) null,
	ѧ���� int null
);

create table Course_Teacher(
	��ʦ��� varchar(10) null,
	�γ̺� varchar(10) null,
	רҵѧ�� varchar(4) null,
	רҵ���� varchar(10) null,
	ѧ�� varchar(4) null,
	ѧ�� nvarchar(4) null,
	ѧ���� int null
);
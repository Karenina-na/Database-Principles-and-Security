-- ������ݿ������ɾ�����ݿ�
drop database if exists MY_DBMS;

-- �������ݿ�
create database MY_DBMS;

use MY_DBMS;

-- ������
create table Student (
   Sno nchar(10) primary key not null, -- �������������ֵ
   Sname nchar(10),
   Ssex nvarchar(1),
   Sage smallint,
   Sdept nvarchar(50),
   Sbirth date not null, --�������ֵ
);

create table Course (
	Cno nvarchar(50) primary key not null, -- �������������ֵ
	Cname nvarchar(50),
	CCredit numeric(3,1), -- ��λ�����ݣ�С��Ϊһλ[dbo].[SC]
	Cpno nvarchar(10),
	CRemark ntext,
);

create table SC (
	Sno nchar(10) not null,
	Cno nvarchar(50) not null,
	primary key (Sno,Cno), -- ������������
	Grade numeric(4,1), -- ��λ�����ݣ�С��Ϊһλ
	-- �������
	constraint fk_Student foreign key (Sno) references Student(Sno), -- �������Լ��fk_Student������������Sno����Student���е�Sno������
	constraint fk_Course foreign key (Cno) references Course(Cno), -- �������Լ��fk_Course������������Cno����Course���е�Cno������
);
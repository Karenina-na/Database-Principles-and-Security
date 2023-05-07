-- ������ݿ������ɾ�����ݿ�
drop database if exists lab2;

-- �������ݿ�
create database lab2;

-- ʹ�����ݿ�
use lab2;

-- ������
/* Student (Sno(char(5))��Sname(Varchar(8))��Ssex(bit)��SbirthDay(smalldatetime)��Sdept(Varchar(30))��SBirthPlace(Varchar(50))))*/
create table Student (
	Sno char(5) primary key, -- ѧ��
	Sname Varchar(8), -- ����
	Ssex bit, -- �Ա�
	SbirthDay smalldatetime, -- ����
	Sdept Varchar(30), -- ����ϵ
	SBirthPlace Varchar(50), -- ����
);

/* Course Cno(char(2))��Cname(Varchar(30))�� Cpno(char(2))�� Ccredt(tinyint) Primary Key: Cno */
create table Course (
	Cno char(2) primary key, -- �γ̺�
	Cname Varchar(30), -- �γ���
	Cpno char(2), -- ���޿κ�
	Credit tinyint, -- ѧ��
);

/*  SC Sno(char(5)��Cno(char(2)��Grade(decimal(4,1))  */
create table SC (
	primary key(Sno,Cno), -- ��������
	Sno char(5), -- ѧ��
	Cno char(2), -- �γ̺�
	Grade decimal(4,1), --�ɼ�
);
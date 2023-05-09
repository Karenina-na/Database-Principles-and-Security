-- ������ݿ������ɾ�����ݿ�
drop database if exists MY_DBMS;

-- �������ݿ�
create database MY_DBMS;

-- ʹ�����ݿ�
use MY_DBMS;

/*
�ַ�������
char(n): �̶����ȵ��ַ���nΪ1~8000֮�����������󳤶�Ϊ8000��
varchar(n): �ɱ䳤�ȵ��ַ���nΪ1~8000֮�����������󳤶�Ϊ8000��
nchar(n): �̶����ȵ�Unicode�ַ���nΪ1~4000֮�����������󳤶�Ϊ4000��
nvarchar(n): �ɱ䳤�ȵ�Unicode�ַ���nΪ1~4000֮�����������󳤶�Ϊ4000��
text: �洢�����ı����ݵķ�Unicode�ַ�����󳤶�Ϊ2^31-1�ֽڡ�
ntext: �洢�����ı����ݵ�Unicode�ַ�����󳤶�Ϊ2^30-1�ֽڡ�

������������
bigint: 8�ֽ���������ΧΪ-2^63��2^63-1��
int: 4�ֽ���������ΧΪ-2^31��2^31-1��
smallint: 2�ֽ���������ΧΪ-2^15��2^15-1��
tinyint: 1�ֽ���������ΧΪ0��255��

��������������
bit: 1λ���������ݣ������ڴ洢����ֵ��
binary(n): �̶����ȵĶ��������ݣ�nΪ1~8000֮�����������󳤶�Ϊ8000��
varbinary(n): �ɱ䳤�ȵĶ��������ݣ�nΪ1~8000֮�����������󳤶�Ϊ8000��
image: �洢�������������ݣ���󳤶�Ϊ2^31-1�ֽڡ�

��ȷ��������
decimal(p, s): �̶����Ⱥ�С��λ������ֵ���ͣ�pΪ��λ����sΪС��λ����p�ķ�ΧΪ138��s�ķ�ΧΪ0-p��
numeric(p, s): �� decimal ��ͬ����ͬ���� numeric �� SQL-92 ��׼�ж�������ơ�

������������
float(n): ��������nΪ���ȣ�ȡֵΪ1~53�����nδָ����Ĭ��Ϊ53��ռ8�ֽڡ�
real: �����ȸ�������ռ4�ֽڡ�

������������
money: �з��ŵĻ����������ͣ�ռ8�ֽڣ���ΧΪ-922,337,203,685,477.5808��922,337,203,685,477.5807��
smallmoney: �з��ŵĻ����������ͣ�ռ4�ֽڣ���ΧΪ-214,748.3648��214,748.3647��

����ʱ����������
date: �洢���ڣ�ռ3�ֽڣ���ΧΪ0001-01-01��9999-12-31��
time(p): �洢ʱ�䣬ռ5-8�ֽڣ�pΪС��λ����ȡֵΪ07�����pδָ����Ĭ��Ϊ7��
datetime: �洢���ں�ʱ�䣬ռ8�ֽڣ���ΧΪ1753-01-01��9999-12-31��
datetime2(p): �洢���ں�ʱ�䣬ռ68�ֽڣ�pΪС��λ����ȡֵΪ0-7�����pδָ����Ĭ��Ϊ7��
smalldatetime: �洢���ں�ʱ�䣬ռ4�ֽڣ���ΧΪ1900-01-01��2079-06-06������Ϊ1���ӡ�
*/

-- ������
create table Student (
    StudentID bigint primary key,	-- bigint 64bit
    Name nvarchar(50),	--	�䳤�ַ��� Unicode����	50B
    Gender nchar(1),	-- char���� Unicode����	1�ַ�
    BirthDate date,	-- ���� ��2021-05-10'
    Address nvarchar(100),	-- �䳤�ַ��� Unicode����	100B
    PhoneNumber nvarchar(20),	-- �䳤�ַ��� Unicode����	20���ַ�
    Email varchar(50), -- �䳤�ַ��� 50�ֽ�
    Height float,	-- ������������ 64bit
    Weight real,	-- ������������ 32bit
    Photo image,	-- �ɱ䳤���������� 
    Introduction text,	-- �����ƿɱ䳤�ı����� 
    Memo ntext,	-- �ɱ䳤�ı����� Unicode����
	Money smallmoney,	--	4�ֽ�	����Ϊ���ҵ�λ��ǧ��֮ʮ
	CreditCard money,	--	8�ֽ�	����Ϊ���ҵ�λ��ǧ��֮ʮ
);

create table Course (
    CourseID smallint primary key,	--	���� 16bit
    Name nvarchar(50),	-- �䳤�ַ��� Unicode���� 50B
    Credit tinyint,	-- ���� 8bit
    Teacher nvarchar(50),	-- �䳤�ַ��� Unicode���� 50B
    Description text,	-- �����ƿɱ䳤�ı�����
	Time datetime,	--	����ʱ�� 8B '2021-05-10 10:30:00' ��
	EndTime smalldatetime, -- ����ʱ�� 4B '2022-05-10 10:30' ����
	ContinueTime time(3), -- ʱ�侫ȷ��3λ���룬'10:30:00.123' ָ������ 
	Type varbinary(20), --  �����Ʊ䳤���� 20B
    Memo ntext,	-- �ɱ䳤�ı����� Unicode����
);

create table SC (
    StudentID bigint,	--	���� 64bit
    CourseID int,	--	���� 32bit
    ScoreNormal decimal(10, 2),	--	ȷ��������ֵ ��һλΪ��λ�����ڶ�λΪС��λ 10λ����2λС�� ������numeric��ͬ
	ScoreExam numeric(10, 2), -- ȷ��������ֵ ��һλΪ��λ�����ڶ�λΪС��λ 10λ����2λС�� ������decimal��ͬ
    ExamDate datetime2,	--	����ʱ�� ��datetime���ȸ� 6-8B '2021-05-10 10:30:00.123'
	Type binary(100), -- �����ƶ������� 100B
);
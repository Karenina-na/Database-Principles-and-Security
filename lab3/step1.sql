-- 如果数据库存在则删除数据库
drop database if exists MY_DBMS;

-- 创建数据库
create database MY_DBMS;

-- 使用数据库
use MY_DBMS;

/*
字符型数据
char(n): 固定长度的字符，n为1~8000之间的整数，最大长度为8000。
varchar(n): 可变长度的字符，n为1~8000之间的整数，最大长度为8000。
nchar(n): 固定长度的Unicode字符，n为1~4000之间的整数，最大长度为4000。
nvarchar(n): 可变长度的Unicode字符，n为1~4000之间的整数，最大长度为4000。
text: 存储大量文本数据的非Unicode字符，最大长度为2^31-1字节。
ntext: 存储大量文本数据的Unicode字符，最大长度为2^30-1字节。

整型数据类型
bigint: 8字节整数，范围为-2^63到2^63-1。
int: 4字节整数，范围为-2^31到2^31-1。
smallint: 2字节整数，范围为-2^15到2^15-1。
tinyint: 1字节整数，范围为0到255。

二进制数据类型
bit: 1位二进制数据，可用于存储布尔值。
binary(n): 固定长度的二进制数据，n为1~8000之间的整数，最大长度为8000。
varbinary(n): 可变长度的二进制数据，n为1~8000之间的整数，最大长度为8000。
image: 存储大量二进制数据，最大长度为2^31-1字节。

精确数据类型
decimal(p, s): 固定精度和小数位数的数值类型，p为总位数，s为小数位数，p的范围为138，s的范围为0-p。
numeric(p, s): 与 decimal 相同，不同的是 numeric 是 SQL-92 标准中定义的名称。

浮点数据类型
float(n): 浮点数，n为精度，取值为1~53，如果n未指定，默认为53，占8字节。
real: 单精度浮点数，占4字节。

货币数据类型
money: 有符号的货币数据类型，占8字节，范围为-922,337,203,685,477.5808到922,337,203,685,477.5807。
smallmoney: 有符号的货币数据类型，占4字节，范围为-214,748.3648到214,748.3647。

日期时间数据类型
date: 存储日期，占3字节，范围为0001-01-01到9999-12-31。
time(p): 存储时间，占5-8字节，p为小数位数，取值为07，如果p未指定，默认为7。
datetime: 存储日期和时间，占8字节，范围为1753-01-01到9999-12-31。
datetime2(p): 存储日期和时间，占68字节，p为小数位数，取值为0-7，如果p未指定，默认为7。
smalldatetime: 存储日期和时间，占4字节，范围为1900-01-01到2079-06-06，精度为1分钟。
*/

-- 创建表
create table Student (
    StudentID bigint primary key,	-- bigint 64bit
    Name nvarchar(50),	--	变长字符串 Unicode编码	50B
    Gender nchar(1),	-- char类型 Unicode编码	1字符
    BirthDate date,	-- 日期 ‘2021-05-10'
    Address nvarchar(100),	-- 变长字符串 Unicode编码	100B
    PhoneNumber nvarchar(20),	-- 变长字符串 Unicode编码	20个字符
    Email varchar(50), -- 变长字符串 50字节
    Height float,	-- 近似数据类型 64bit
    Weight real,	-- 近似数据类型 32bit
    Photo image,	-- 可变长二进制数据 
    Introduction text,	-- 二进制可变长文本数据 
    Memo ntext,	-- 可变长文本数据 Unicode编码
	Money smallmoney,	--	4字节	精度为货币单位的千分之十
	CreditCard money,	--	8字节	精度为货币单位的千分之十
);

create table Course (
    CourseID smallint primary key,	--	整数 16bit
    Name nvarchar(50),	-- 变长字符串 Unicode编码 50B
    Credit tinyint,	-- 整数 8bit
    Teacher nvarchar(50),	-- 变长字符串 Unicode编码 50B
    Description text,	-- 二进制可变长文本数据
	Time datetime,	--	日期时间 8B '2021-05-10 10:30:00' 秒
	EndTime smalldatetime, -- 日期时间 4B '2022-05-10 10:30' 分钟
	ContinueTime time(3), -- 时间精确到3位毫秒，'10:30:00.123' 指定精度 
	Type varbinary(20), --  二进制变长数据 20B
    Memo ntext,	-- 可变长文本数据 Unicode编码
);

create table SC (
    StudentID bigint,	--	整数 64bit
    CourseID int,	--	整数 32bit
    ScoreNormal decimal(10, 2),	--	确定精度数值 第一位为总位数，第二位为小数位 10位数，2位小数 功能与numeric相同
	ScoreExam numeric(10, 2), -- 确定精度数值 第一位为总位数，第二位为小数位 10位数，2位小数 功能与decimal相同
    ExamDate datetime2,	--	日期时间 比datetime精度高 6-8B '2021-05-10 10:30:00.123'
	Type binary(100), -- 二进制定长数据 100B
);
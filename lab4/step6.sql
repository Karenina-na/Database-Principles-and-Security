-- 使用数据库
use MY_DBMS;

-- 复制Student的表框架到Student_update新表中，会自动创建一个表，这里的where为忽略源表内的所有数据进行复制。
-- select * into Student_update from Student where 1=2;
-- select * from Student_update;

-- 创建WZX_DBMS数据库
-- create database WZX_DBMS;
-- 复制MY_DBMS的表Student框架到WZX_DBMS的Student_update新数据库的新表中，这里的where为忽略源表内的所有数据进行复制。
-- select * into WZX_DBMS.dbo.Student_update from MY_DBMS.dbo.Student where 1=2;
-- use WZX_DBMS;
-- select * from Student_update;

-- 复制Student的表框架和内容到Student_update_info新表中，会自动创建一个表。
-- select * into Student_update_info from Student;
-- select * from Student_update_info;

-- 复制MY_DBMS的表Student框架和内容到WZX_DBMS的Student_update_info新数据库的新表中。
-- select * into WZX_DBMS.dbo.Student_update_info from MY_DBMS.dbo.Student
-- use WZX_DBMS;
-- select * from Student_update_info;
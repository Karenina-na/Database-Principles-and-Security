-- ʹ�����ݿ�
use MY_DBMS;

-- ����Student�ı��ܵ�Student_update�±��У����Զ�����һ���������whereΪ����Դ���ڵ��������ݽ��и��ơ�
-- select * into Student_update from Student where 1=2;
-- select * from Student_update;

-- ����WZX_DBMS���ݿ�
-- create database WZX_DBMS;
-- ����MY_DBMS�ı�Student��ܵ�WZX_DBMS��Student_update�����ݿ���±��У������whereΪ����Դ���ڵ��������ݽ��и��ơ�
-- select * into WZX_DBMS.dbo.Student_update from MY_DBMS.dbo.Student where 1=2;
-- use WZX_DBMS;
-- select * from Student_update;

-- ����Student�ı��ܺ����ݵ�Student_update_info�±��У����Զ�����һ����
-- select * into Student_update_info from Student;
-- select * from Student_update_info;

-- ����MY_DBMS�ı�Student��ܺ����ݵ�WZX_DBMS��Student_update_info�����ݿ���±��С�
-- select * into WZX_DBMS.dbo.Student_update_info from MY_DBMS.dbo.Student
-- use WZX_DBMS;
-- select * from Student_update_info;
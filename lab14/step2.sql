--use master;

-- 创建审核对象 Audit1，将审核操作对象保存在指定文件夹 SQLAudit 中
--create server audit Audit1 to file (filepath='C:\Users\15399\Desktop\数据库原理与安全\Database-Principles-and-Security\lab14\SQLAudit')

--alter server audit Audit1 with(state=on);

-- 服务器级审计
-- 为Auditl 创建服务器级审核规范 ServerAuditSpecification1，对以下事件进行审计:
  -- 使用系统存储过程创建或删除登录名
  -- 登录名登录成功
  -- 登录名登录失败
  -- 创建、更改或删除任何数据库
--create server audit specification ServerAuditSpecification1 for server audit audit1
--add (server_principal_change_group),
--add (successful_login_group),
--add (failed_login_group),
--add (database_change_group)

-- 然后启用审核规范 ServerAuditSpecification1。
--alter server audit specification ServerAuditSpecification1 with(state = on);

-- 执行 (1) 题中的 ~ 操作，然后查看审核对象 Auditl 中相应的审计记录。语法格式如下:
 --exec sp_addlogin U1;
-- 清除进程
--select * from sys.dm_exec_sessions where login_name = 'U1';
--exec sp_droplogin U1;

--create database database1;
--drop database database1;
--declare @filename nvarchar(100) = 'Audit1_E51337B0-990D-48C3-BC9B-8A085513E40F_0_133318836972920000.sqlaudit';
--select event_time,succeeded,session_server_principal_name,server_principal_name,statement from sys.fn_get_audit_file('C:\Users\15399\Desktop\数据库原理与安全\Database-Principles-and-Security\lab14\SQLAudit\'+@filename,NULL,NULL)

-- 修改审核规范 ServerAuditSpecification1，不再对4事件进行审计，但增加对“用户名更改登录密码”事件的审计(修改前先禁用该审核规范，修改完成后再启动)，并验证是否修改成功 (通过查看审核记录)
--alter server audit specification ServerAuditSpecification1 with(state = off);
--alter server audit specification ServerAuditSpecification1 drop (database_change_group);
--alter server audit specification ServerAuditSpecification1 add (login_change_password_group);
--alter server audit specification ServerAuditSpecification1 with(state = on);

--exec sp_addlogin U1;
--exec sp_password @old='',@new='123',@loginame='U1';
--exec sp_droplogin U1;

-- 删除审计
--alter server audit specification ServerAuditSpecification1 with(state = off);
--drop server audit specification ServerAuditSpecification1;

-- 数据库级审计
-- 为 Auditl 创建数据库级审核规范 DatabaseAuditSpecification2，对 STUDY 数据库中以下事件进行审计:
  -- 对 STUDY 数据库备份或还原操作
  -- 在 STUDY 数据库创建或删除用户操作
  -- 对 STUDY 数据库某一表中数据的增、删、改、查操作
  -- 对 STUDY 数据库某一存储过程的执行操作

--use Study;

--create database audit specification DatabaseAuditSpecification2 for server audit audit1
--add (backup_restore_group),
--add (database_principal_change_group),
--add (insert on schema::[dbo] by public),
--add (delete on schema::[dbo] by public), 
--add (select on schema::[dbo] by public), 
--add (update on schema::[dbo] by public),
--add (execute on schema::[dbo] by public);

-- 然后启用审核规范 ServerAuditSpecification2

--alter database audit specification DatabaseAuditSpecification2 with(state = on);

-- 对 Study 数据库执行 (1) 题中的O ~操作，然后查看审核对象 Audit1 中关于Study 数据库的审计记录。语法格式如下:

--declare @filename nvarchar(100) = 'Audit1_E51337B0-990D-48C3-BC9B-8A085513E40F_0_133318836972920000.sqlaudit';
--select event_time,succeeded,session_server_principal_name,server_principal_name,statement from sys.fn_get_audit_file ('C:\Users\15399\Desktop\数据库原理与安全\Database-Principles-and-Security\lab14\SQLAudit\'+ @filename,NULL,NULL) where database_name ='Study';

--insert into S(Sno,Sname) values ('123','张三');
--update S set Sname='李四' where Sno='123';
--select * from S;
--delete from S where S.Sno='123';

--backup database Study to disk='C:\Users\15399\Desktop\数据库原理与安全\test\data.bak';
--backup log Study to disk='C:\Users\15399\Desktop\数据库原理与安全\test\dataLog.bak'

use master;

-- 检查数据库使用过状态 ONLINE才能还原
--select state_desc from sys.databases where name = 'Study';
-- 检查 其他连接和进程 为空才能还原
--select session_id, login_name, status from sys.dm_exec_sessions where database_id = DB_ID('Study');

--restore database Study from disk='C:\Users\15399\Desktop\数据库原理与安全\test\data.bak' with norecovery, replace;
--restore log Study from disk='C:\Users\15399\Desktop\数据库原理与安全\test\dataLog.bak' with recovery;

use Study;

-- 修改审核规范 ServerAuditSpecification2，仅对3类事件进行审计，但另外增加对“对 STUDY 数据库中特定角色架构中所有对象的 DML(创建、修改、删除)操作”事件的审计(修改前先禁用该审核规范，修改完成后再启动) ，并验证是否修改成功 (通过查看审核记录)。
--alter database audit specification DatabaseAuditSpecification2 with(state = off);
--alter database audit specification DatabaseAuditSpecification2 drop (backup_restore_group);
--alter database audit specification DatabaseAuditSpecification2 drop (database_principal_change_group);
--alter database audit specification DatabaseAuditSpecification2 drop (execute on schema::[dbo] by public);
--alter database audit specification DatabaseAuditSpecification2 add (insert,update,delete on schema::[dbo] by dbo);
--alter database audit specification DatabaseAuditSpecification2 with(state = on);

--insert into S(Sno,Sname) values ('C02','李四');
--delete from S where S.Sname='李四';
--select * from S;
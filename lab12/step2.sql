--use Study;

-- 备份

-- 备份数据库
-- 创建备份设备
-- exec sp_addumpdevice 'disk' , 'MyDBdevice' , 'C:\Users\15399\Desktop\数据库原理与安全\test\MyDbbackup.bak'
-- backup database Study to MyDBdevice;

-- 直接指定备份
-- backup database Study to disk='C:\Users\15399\Desktop\数据库原理与安全\test\MyDbbackup.bak';

-- 备份数据库日志
-- 创建备份设备
-- exec sp_addumpdevice 'disk' , 'MyDbLogbackup' , 'C:\Users\15399\Desktop\数据库原理与安全\test\MyDbLogbackup.bak'
-- backup log Study to MyDbLogbackup;

-- 直接指定备份
-- backup log Study to disk='C:\Users\15399\Desktop\数据库原理与安全\test\MyDbLogbackup.bak';


-- 恢复
-- 更新数据库
--insert into S values
--('123','张三','男',18,'信息','三等奖');

--create table new1(
--	newID int primary key
--)

--use master;

-- 检查数据库使用过状态 ONLINE才能还原
--select state_desc from sys.databases where name = 'Study';
-- 检查 其他连接和进程 为空才能还原
--select session_id, login_name, status from sys.dm_exec_sessions where database_id = DB_ID('Study');

-- 恢复数据库 第一个还原需要 with norecovery，此时数据库还处于还原序列中
-- 通过备份设备
--restore database Study from MyDBdevice with norecovery , replace;

-- 直接指定
-- restore database Study from disk='C:\Users\15399\Desktop\数据库原理与安全\test\MyDbbackup.bak' with norecovery , replace;

-- 恢复日志 最后一个还原需要recovery，表示数据库恢复正常使用
-- 通过备份设备
--use master;
--restore log Study from MyDbLogbackup with recovery;

-- 直接指定
-- restore log Study from disk='C:\Users\15399\Desktop\数据库原理与安全\test\MyDbLogbackup.bak' with recovery , replace;

--use Study;
--select * from S;

-- 删除备份设备
 --exec sp_dropdevice MyDBdevice , 'delfile';
 --exec sp_dropdevice MyDbLogbackup , 'delfile';


-- 使用数据库
use MY_DBMS;

-- 删除Student表的Sdept列

-- alter table Student drop column Sdept;

-- 添加Student表的Sdept列
-- alter table Student add Sdept nvarchar(50);

-- 修改Student表的Sdept列名为Sdept_change
-- EXEC sp_rename 'Student.Sdept', 'Sdept_change', 'COLUMN';

--重新定义Student表的Ssex属性为nchar(1)
-- alter table Student alter column Ssex nchar(1);

-- 删除SC表，由于SC中两个外键引用了Student和Course表，因此不能直接删除Student或Course表。
-- drop table SC;
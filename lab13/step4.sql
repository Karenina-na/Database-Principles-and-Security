-- 创建登录名、数据库用户，实现对数据库的访问
-- 创建登录名 dlm1，dlm2，dlm3，dlm4，dlm5 并赋予固定服务器角色。
--create login dlm1 with password='123';
--create login dlm2 with password='123';
--create login dlm3 with password='123';
--create login dlm4 with password='123';
--create login dlm5 with password='123';

-- 针对 SchoolManagement 数据库，创建数据库用户 U1，U2，U3，U4，U5。
-- 分别将所创建的各数据库用户关联到各登录名 (一个登录名可以作为不同用户映射到不同的数据库，但在每个数据库中只能作为一个用户进行映射。
--use SchoolManagement;
--create user U1 for login dlm1;
--create user U2 for login dlm2;
--create user U3 for login dlm3;
--create user U4 for login dlm4;
--create user U5 for login dlm5;

-- 通过登录名与数据库用户，实现对数据的访问。

-- 要求分别使用 SSMS 和T SQL 语，对以上 (1) ~ (4) 加以实现

use SchoolManagement;
-- 授权、回收权限
-- 把查询 S 表权限授给用户 U1。
--grant select on S to U1;

-- 把对 S 表和 C表的全部权限授予用户 U2 和 U3
--grant all privileges on S to U2,U3;
--grant all privileges on C to U2,U3;

-- 把对表 SC 的查询权限授予所有用户。
--grant select on SC to public;

-- 把查询 S 表和修改学生姓名的权限授给用户 U4。
--grant select,update(Sname) on S to U4;

-- 把对表 SC 的 INSERT 权限授予 U5 用户，并允许他再将此权限授予其他用户5
--grant insert on SC to U5 with grant option;

-- 把用户 U4 修改学生学号的权限收回。
--revoke update(Sname) on S from U4;

-- 收回所有用户对表 SC 的查询权限
--revoke select on SC from public;

-- 把用户U5 对 SC 表的 INSERT 权限收回    cascade -- 该选项将确保所有依赖于被撤销权限的授权也被一并撤销。
--revoke insert on SC from U5 cascade;

-- 权限验证
-- 以上所有的授权，均须通过相应的 SQL 语句予以验证(2) 权限验证要求: 比如针对用户 U1 查询学生表 S:a、授权前用户时候可以查询?
-- 如果不可以查询，授权后是否可以查询?
-- 如果可以查询，回收权限后是不是不能再查询?

-- 删除用户名
--use SchoolManagement;
--drop user U1;
--drop user U2;
--drop user U3;
--drop user U4;
--drop user U5;

-- 删除登录名
--drop login dlm1;
--drop login dlm2;
--drop login dlm3;
--drop login dlm4;
--drop login dlm5;
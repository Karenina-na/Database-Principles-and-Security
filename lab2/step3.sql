-- 使用数据库
use lab2;

/* 传统集合运算 */
-- 并集 
select S.Sno from Student as S union select SC.Sno from SC; -- 自动去除重复的行 20条数据
select SC.Cno from SC union all select C.Cno from Course as C; -- 不去除重复的行 40条数据

-- 交集
select S.Sno from Student as S intersect select SC.Sno from SC; -- 自动去除重复的行 7条数据

-- 差
select S.Sno from Student as S except select SC.Sno from SC; -- 自动去除重复的行 13条数据

-- 广义笛卡尔积
select * from Student,SC,Course;

/* 专门关系运算 */

-- 选择
select S.Sname from Student as S where S.Sno=10001; -- 选择学生表中学号为10001的学生的名字

-- 投影
select S.Sno,S.Sname from Student as S; -- 选择学生表中的学号列和名字列

-- 自然连接
select distinct S.Sno,S.Sname,S.Ssex,S.SbirthDay,S.Sdept,S.SBirthPlace,SC.Cno,SC.Grade from Student as S inner join SC on S.Sno=SC.Sno; -- 使用inner join on模拟自然连接 distinct去重

-- 等值连接
select * from Student as S inner join SC on S.Sno=SC.Sno;

-- 一般连接

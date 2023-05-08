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

-- 广义笛卡尔积 两式等价
select * from Student cross join Course cross join SC;
-- select * from Student,SC,Course;

/* 专门关系运算 */

-- 选择
select * from Student as S where S.Sno=10001; -- 选择学生表中学号为10001的学生的信息

-- 投影
select S.Sno,S.Sname from Student as S; -- 选择学生表中的学号列和名字列

-- 自然连接
select distinct S.Sno,S.Sname,S.Ssex,S.SbirthDay,S.Sdept,S.SBirthPlace,SC.Cno,SC.Grade from Student as S inner join SC on S.Sno=SC.Sno; -- 使用inner join on模拟自然连接 distinct去重

-- 等值连接
select * from Student as S inner join SC on S.Sno=SC.Sno;	-- 选择学生表和选课表中相同学号学生的信息

-- 一般连接
select S.Sno from Student as S inner join SC on S.Sno=SC.Sno; -- 有条件的连接 选择学生表和选课表中相同学号学生的姓名

-- 左外连接
select * from Student as S left join SC on S.Sno=SC.Sno; -- 连接学生表和选课表，学生表中的悬浮元组保存

-- 右外连接
select * from SC right join Course as C on SC.Cno=C.Cno; -- 连接选课表和课程表，课程表中的悬浮元组保存

-- 全连接
select * from Student as S full join Course as C on S.Sno=C.Cno; -- 连接学生表和选课表，两者的悬浮元组均保存，这里二者连接条件可知两表均全为悬浮元组


/* 广义笛卡尔积和连接的概念 */
-- 广义笛卡尔积下列两式等价
select * from Student,Course,SC; -- 无条件多表查询
select * from Student cross join Course cross join SC; -- 无条件全连接

/*
广义笛卡尔积为无条件的排列组合，一般连接为有条件的多表连接，无条件的全连接得到的结果与广义笛卡尔积相同
在 SQL 中，广义笛卡尔积和连接都是用于联结多个表格的操作，但它们的实现方式和结果略有不同。
广义笛卡尔积是一种无条件的联结操作，它会返回所有表格之间的排列组合，不需要指定任何条件。在 SQL 中，可以使用逗号分隔多个表格，或者使用 CROSS JOIN 关键字来表示广义笛卡尔积。
连接是一种有条件的联结操作，它会根据指定的联结条件，从多个表格中筛选出满足条件的行。在 SQL 中，可以使用 INNER JOIN、LEFT JOIN、RIGHT JOIN 等关键字来表示连接。
需要注意的是，全连接是连接的一种特殊情况，它会返回两个表格中的所有行，不论是否满足联结条件。当连接条件为空时，全连接可以看作是无条件连接，结果等同于广义笛卡尔积。但在实际的应用中，全连接和广义笛卡尔积的使用场景和语义是有区别的。
*/
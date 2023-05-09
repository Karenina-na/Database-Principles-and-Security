-- 使用数据库
use MY_DBMS;

-- 测试数据
select * from Student;
select * from Course;
select * from SC;

-- 字符型转换为int
select cast('100' as int);

-- int型转为float
select cast(100 as float) + 0.54;

-- datetime转为datetime2 精度自动补齐
select cast('2021-05-10 10:30:00' as datetime2);

-- nvarchar(10) 转为 varchar(10) 需要考虑Unicode编码字符问题
select cast(cast('你好, world!' as  nvarchar(10)) as varchar(10)); -- 会导致字符截断
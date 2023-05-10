-- 字符型转换为int
select cast('100' as int);

-- int型转为float
select cast(100 as float) + 0.54;

-- datetime转为datetime2 精度自动补齐
select cast('2021-05-10 10:30:00' as datetime2);

-- nvarchar(10) 转为 varchar(10) 需要考虑Unicode编码字符问题
select cast(cast('你好, world!' as  nvarchar(10)) as varchar(10)); -- 会导致字符截断

-- 将当前日期时间转换成字符串类型，并且使用了 120 格式码，表示将日期时间格式化为“年-月-日”的形式。
select convert(varchar(10), getdate(), 120)

-- nvarchar(10) 转为 varchar(10) 需要考虑Unicode编码字符截断问题
select convert(varchar(10),cast('你好, world!' as  nvarchar(10)))
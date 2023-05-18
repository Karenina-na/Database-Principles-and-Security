use MY_DBMS;

-- cross join 实现两个表广义笛卡尔积运算，这里运算Student和Course表
select * from Student cross join course;

-- 选择运算，选择学号为'012'的选课表信息
select * from SC where Sno='012';

-- 投影运算，查看所有学生的姓名
select Sname from Student;

-- 连接运算，这里连接查询所有选了课程编号为C001的学生信息
select * from Student as S left join SC on S.Sno=SC.Sno where SC.Cno='C001';
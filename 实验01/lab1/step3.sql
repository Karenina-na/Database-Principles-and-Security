-- 查询全部课程
select * from Course;

-- 查询全部学生
select * from Student;

-- 查询全部选课信息
select * from SC;

-- 通过选课信息查询所有学生的选课表
select S.*,C.* from Student as S,Course as C,SC where S.Sno=SC.Sno and SC.Cno=C.Cno;

-- 通过选课信息查询所有学生的选课表 连接查询模式
select S.*, C.* from Student as S inner join SC on S.Sno = SC.Sno inner join Course as C on SC.Cno = C.Cno;

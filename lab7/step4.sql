
-- use MY_DBMS;
-- 注意，视图操作必须是批处理仅有的语句

-- 定义视图
-- 建立计算机系学生的视图 CS_Stud1 (Sno，Sname，Sage)
-- create view CS_Stud1 as select Sno,Sname,Sage from Student where Student.Sdept='计算机系';

-- 建立计算机系学生的视图，并要求透过该视图所进行的更新操作，只涉及计算机系学生 CS_Stud_2 (Sno，Sname，Sage)
-- create view CS_Stud_2 as select Sno,Sname,Sage from Student where Student.Sdept='计算机系';

-- 建立数学系选修了 CO2 号课程的学生视图 MA_Stud1(Sno，Sname，Grade)
-- create view MA_Stud1 as select S.Sno,S.Sname,SC.Grade from Student as S join SC on S.Sno=SC.Sno where SC.Cno='C002' and S.Sdept='数学系';

-- 建立数学系选修了 C02 号课程且成绩在 90 分以上的学生的视图MA_Stud_90(Sno,Sname，Grade)
-- create view MA_Stud_90 as select S.Sno,S.Sname,SC.Grade from Student as S join SC on S.Sno=SC.Sno where SC.Cno='C002' and S.Sdept='数学系' and SC.Grade>90;

-- 将学生的学号及其平均成绩定义为一个视图。S_Gavgl(Sno，SGavg)
-- create view S_Gavg1 as select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno;

-- 将平均成绩>=90 分的学生及其平均成绩定义为一个视图。S_Gavg2(Sno,SGavg)
-- create view S_Gavg2 as select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno having avg(SC.Grade)>=90;

-- 将平均成绩>=90 分，选修课程累计达到 30 学分，且选修课程数达到 10 门以上的学生定义为一个视图。S_Gavg3(Sno，SumCredit，SumCourse，SGavg)
-- create view S_Gavg3 as select SC.Sno,sum(C.CCredit) as SumCredit,count(SC.Cno) as SumCourse,avg(SC.Grade) as SGavg from SC join Course as C on SC.Cno=C.Cno group by SC.Sno having avg(SC.Grade)>=90 and count(SC.Cno)>10 and sum(C.CCredit)>30

-- 选修学生所覆盖的系别达到 3 个以上，且将选修人数最多的课程，定义为一个视图。C_Surveyl (Cno，SumDept，MaxSumStud)
-- create view C_Survey1 as select SubQ.Cno,SubQ.SumDept,SubQ.SumStud as MaxSumStud from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ where SubQ.SumStud=(select max(SubQ.SumStud) from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ)

-- 将平均成绩介于 80~90 分，选修人数达到 15 人以上，且选修学生所覆盖的系别达到3个以上的课程,定义为一个视图。C_Survey2 (Cno，SumStud，SumDept,CGavg)
-- create view C_Survey2 as select SC.Cno,count(SC.Sno) as SumStud,count(distinct S.Sdept) as SumDept,avg(SC.Grade) as CGavg from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having avg(SC.Grade)>80 and avg(SC.Grade)<90 and count(SC.Sno)>15 and count(distinct S.Sdept)>=3

-- 将平均成绩介于 80~90 分，选修人数达到 20 人以上，不及格学生不超过 3 人，且选修学生所覆盖的系别超过 3 个以上的课程，定义为一个视图。C_Survey3(Cno, SumStud，SumDept, CGavg)
-- create view C_Survey3 as select SC.Cno,count(SC.Sno) as SumStud,count(distinct S.Sdept) as SumDept,avg(SC.Grade) as CGavg from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having avg(SC.Grade)>80 and avg(SC.Grade)<90 and count(SC.Sno)>20 and count(distinct S.Sdept)>=3 and (select count(SC_E.Sno) from SC as SC_E where SC.Cno=SC_E.Cno and SC_E.Grade<60)<=3

-- 将选修人数超过 30 以上，且课程选修学生覆盖的系别最多的课程，定义为一个视图。C_Survey4 (Cno，MaxSumStud，SumDept)
-- create view C_Survey4 as select SC.Cno,count(S.Sno) as MaxSumStud,count(distinct S.Sdept) as SumDept from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(SC.Sno)>20 and count(distinct S.Sdept)=(select max(SubQ.SumDept) from (select SC.Cno,count(distinct S.Sdept) as SumDept from SC join Student as S on SC.Sno=S.Sno group by SC.Cno) as SubQ)


-- 查询视图
-- 利用计算机系学生的视图 CS_Stud1 中查询:
  -- 年龄小于 20 岁的学生
--  select * from CS_Stud1 as CS where CS.Sage<20

  -- 选修了 CO2 号课程的学生学号和姓名
--  select CS.Sno,CS.Sname from CS_Stud1 as CS join SC on CS.Sno=SC.Sno where SC.Cno='C002'

-- 利用数学系学生的视图 MA_Stud1 中查询:
  -- 成绩不及格的人数
--  select count(MA.Sno) from MA_Stud1 as MA where MA.Grade<60

  -- C02 号课程的:课程号、课程名、平均成绩、最高分、最高分的学生学号和姓名、最低分，最低分的学生学号和姓名
--  select C.Cno,C.Cname,avg(SC.Grade) as AvgGrade,max(SC.Grade) as MaxGrade,min(SC.Grade) as MinGrade from MA_Stud1 as MA join SC join Course as C on SC.Cno=C.Cno on MA.Sno=SC.Sno group by C.Cno,C.Cname having C.Cno='C002'
 
-- 利用 S_Gavgl 视图中查询
  -- 平均成绩在 90 分以上的学生学号和平均成绩
--  select * from S_Gavg1 as SG where SG.SGavg>90

  -- 平均成绩在 90 分以上的学生的选课情况，包括: 学号、姓名、课程名、成绩
--  select SG.Sno,S.Sname,C.Cname,SC.Grade from S_Gavg1 as SG join Student as S on SG.Sno=S.Sno join SC join Course as C on SC.Cno=C.Cno on SG.Sno=SC.Sno where SG.SGavg>90

-- 利用 S_Gavg3 视图中查询:
  -- 平均成绩在 95 分以上的学生学号和平均成绩
--  select SG.Sno,SG.SGavg from S_Gavg3 as SG where SG.SGavg>90

  -- 平均成绩在 95 分以上的学生的选课情况，包括: 学号、姓名、课程名、成绩(隐含: 选修课程累计达到 30 学分，且选修课程数达到 10 门以上)
--  select S.Sno,S.Sname,C.Cname,SC.Grade from S_Gavg3 as SG join Student as S join SC on S.Sno=SC.Sno join Course as C on SC.Cno=C.Cno on SG.Sno=S.Sno where SG.SGavg>90

-- 利用 C_Surveyl 视图中查询:
  -- 课程的选课情况，包括: 课号、课程名、学号、姓名、成绩(隐含: 选修人数最多，且选修学生所覆盖的系别达到 3 个以上)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from C_Survey1 as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno

-- 利用 C_Survey3 视图中查询:
  -- 课程的选修情况，包括: 课号、课程名、学号、姓名、成绩(隐含:平均成绩介于 80~90 分，选修人数达到 20 人以上，不及格学生不超过 3 人，且选修学生所覆盖的系别超过 3 个以上)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from C_Survey3 as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno

-- 利用视图消解法，将上述视图 (3) ~ (6) 中，基于视图的查询，转化为基于基表的查询。
-- 利用 S_Gavgl 视图中查询
  -- 平均成绩在 90 分以上的学生学号和平均成绩
--  select * from (select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno) as SG where SG.SGavg>90

  -- 平均成绩在 90 分以上的学生的选课情况，包括: 学号、姓名、课程名、成绩
--  select SG.Sno,S.Sname,C.Cname,SC.Grade from (select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno) as SG join Student as S on SG.Sno=S.Sno join SC join Course as C on SC.Cno=C.Cno on SG.Sno=SC.Sno where SG.SGavg>90

-- 利用 S_Gavg3 视图中查询:
  -- 平均成绩在 95 分以上的学生学号和平均成绩
--  select SG.Sno,SG.SGavg from (select SC.Sno,sum(C.CCredit) as SumCredit,count(SC.Cno) as SumCourse,avg(SC.Grade) as SGavg from SC join Course as C on SC.Cno=C.Cno group by SC.Sno having avg(SC.Grade)>=90 and count(SC.Cno)>10 and sum(C.CCredit)>30) as SG where SG.SGavg>90

  -- 平均成绩在 95 分以上的学生的选课情况，包括: 学号、姓名、课程名、成绩(隐含: 选修课程累计达到 30 学分，且选修课程数达到 10 门以上)
--  select S.Sno,S.Sname,C.Cname,SC.Grade from (select SC.Sno,sum(C.CCredit) as SumCredit,count(SC.Cno) as SumCourse,avg(SC.Grade) as SGavg from SC join Course as C on SC.Cno=C.Cno group by SC.Sno having avg(SC.Grade)>=90 and count(SC.Cno)>10 and sum(C.CCredit)>30) as SG join Student as S join SC on S.Sno=SC.Sno join Course as C on SC.Cno=C.Cno on SG.Sno=S.Sno where SG.SGavg>90

-- 利用 C_Surveyl 视图中查询:
  -- 课程的选课情况，包括: 课号、课程名、学号、姓名、成绩(隐含: 选修人数最多，且选修学生所覆盖的系别达到 3 个以上)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from (select SubQ.Cno,SubQ.SumDept,SubQ.SumStud as MaxSumStud from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ where SubQ.SumStud=(select max(SubQ.SumStud) from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ)) as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno

-- 利用 C_Survey3 视图中查询:
  -- 课程的选修情况，包括: 课号、课程名、学号、姓名、成绩(隐含:平均成绩介于 80~90 分，选修人数达到 20 人以上，不及格学生不超过 3 人，且选修学生所覆盖的系别超过 3 个以上)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from (select SC.Cno,count(SC.Sno) as SumStud,count(distinct S.Sdept) as SumDept,avg(SC.Grade) as CGavg from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having avg(SC.Grade)>80 and avg(SC.Grade)<90 and count(SC.Sno)>20 and count(distinct S.Sdept)>=3 and (select count(SC_E.Sno) from SC as SC_E where SC.Cno=SC_E.Cno and SC_E.Grade<60)<=3) as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno


-- 更新视图
-- 利用计算机系学生视图 CS_Stud1 (Sno，Sage) 中，将学号为“2021S001”，的学生姓名更改为“则天女皇”(假设学生表 S 中，存在学号为“SO1”的学生且学生的系别是“CS”)
-- update CS_Stud1 set Sname='则天女皇' where Sno='2021S001'

-- 利用计算机系学生视图 CS_Stud1 (Sno，Sname，Sage) 中，将学号为“2021S002”的学生姓名更改为“仁杰宰相”(假设学生表 S 中，存在学号为“SO2”的学生且学生的系别是“MA”)。
-- update CS_Stud1 set Sname='仁杰宰相' where Sno='2021S002'

-- 利用计算机系学生视图 CS_Stud1 (Sno，Sname，Sage)中，将学号为“2021S001”的学生记录删除(假设学生表 S 中，存在学号为“SO1”的学生，且学生的系别是6CS”)
-- delete from CS_Stud1 where Sno='2021S001' -- 外键约束

-- 利用计算机系学生视图 CS_Studl (Sno，Sname，Sage) 中，将学号为“2021S001”的学生记录删除(假设学生表 S 中，存在学号为“SO2”的学生，且学生的系别是MA)
-- delete from CS_Stud1 where Sno='2021S002' -- 外键约束

-- 向计算机系学生视图 CS_Stud1 (Sno，Sname，Sage) 中，插入一条新的学生记5录，其中学号为“S51”，姓名为“如燕”。如果能插入，插入后视图是否可以查询该记录?
-- insert into CS_Stud1 values ('S51','如燕','18'); -- not null 约束

-- 向计算机系学生视图 CS_Stud1 (Sno，Sname，Sage) 中，插入一条新的学生记录，其中学号为“S52”，姓名为“姚崇”，年龄为 60 岁。如果能插入，插入后视图是否可以查询该记录?
-- insert into CS_Stud1 values ('S52','姚崇','60'); -- not null 约束

-- 利用计算机系学生视图 CS_Stud_2 (Sno，Sname，Sage) ，将学号为“S61”记录的年龄更改为 43 岁(假设学生表中，存在学号为“S61”的学生，且学生的系别是“CS”) 。如不能修改，为什么?
-- update CS_Stud_2 set Sage='43' where Sno='2021S006' -- 可以更改

-- 利用计算机系学生视图 CS_Stud_2 (Sno，Sname，Sage) ，将学号为“S62”学生的年龄更改为 54 岁(假设学生表中，存在学号为“S62”的学生，且学生的系别是“MA”) 。如不能修改，为什么?
-- update CS_Stud_2 set Sage='43' where Sno='2021S008' -- 可以更改

-- 向计算机系学生视图 CS_Stud_2 (Sno，Sname，Sage) 中，插入一新的学生记录，其中学号为“S63”姓名为“宋景”
-- insert CS_Stud_2 values ('S63','宋景','19') -- not null 约束

-- 利用计算机系学生视图 CS_Stud_2 (Sno，Sname，Sage) ，将学号为“S65记录删除(假设学生表中,存在学号为“S65”的学生，且学生的系别是“CS”)如不能删除，为什么?
-- delete from CS_Stud_2 where Sno='2021S006' -- 外键约束

-- 利用计算机系学生视图 CS_Stud_2 (Sno，Sname，Sage) ，将学号为“S66记录删除(假设学生表中,存在学号为“S66”的学生，且学生的系别是“MA”)如不能删除，为什么?
-- delete from CS_Stud_2 where Sno='2021SM006' -- 外键约束
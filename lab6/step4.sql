use MY_DBMS;

-- 连接查询
-- 等值与非等值连接查询
-- 查询选择了所选课程中含有学分大于 3 分的课程的学生的基本信息
select distinct S.Sno,S.Sname,Ssex,Ssex,Sage,Sdept,Sbirthplace,Sbirthdate from Student as S join SC join Course as C on SC.Cno=C.Cno and C.CCredit>3 on S.Sno=SC.Sno;

-- 查询课程成绩含有未及格 (<60 分) 的课程信息
select distinct C.Cno,C.Cname,C.CCredit,C.Cpno from Course as C join SC on SC.Grade<60 and SC.Cno=C.Cno;

-- 查询每个学生的学号、姓名，以及选修的课号、课名及成绩
select S.Sno,S.Sname,C.Cno,C.Cname,SC.Grade from Student as S join SC left join Course as C on SC.Cno=C.Cno on S.Sno=SC.Sno;

--自身连接
-- 查询具有间接先行课的课程
select C1.Cno,C1.Cname,C2.Cno as Cpno_Cno,C2.Cname as Cpno_Cname from Course as C1 join Course as C2 on C1.Cpno=C2.Cname;

-- 查询所有与学号为“SO1”学生为同一系的学生的学号和姓名
select S2.Sno,S2.Sname from Student as S1 join Student as S2 on S1.Sdept=S2.Sdept where S1.Sno='2021S001';

-- 外连接 (左外连接、右外连接、全外连接)
-- 解释说明外连接定义和种类,并且以学生表和课程表进行各种外连接的验复合条件连接
select * from Student left join Course on 1=1;
select * from Student right join Course on 1=1;
select * from Student full join Course on 1=1;

-- 查找“高等数学”成绩大于 90 分的陕西籍女生的学号、姓名、分数。
select S.Sno,S.Sname,SC.Grade from Student as S right join SC right join Course as C on SC.Cno=C.Cno on S.Sno=SC.Sno where C.Cname='数学' and SC.Grade>90 and S.Sbirthplace='西安';

-- 嵌套查询
-- 带 IN 谓词的子查询
-- 查询数学系学生高等数学的成绩
select SC.Grade from SC join Course as C on SC.Cno=C.Cno where C.Cname='数学' and SC.Sno in (select S.Sno from Student as S where S.Sdept='数学系')

-- 查询选修了“SO2”号课程的学生姓名
select S.Sname from Student as S where S.Sno in (select SC.Sno from SC where SC.Cno='C002');

-- 查询与“张柬之”在同一个系学习的学生。
select * from Student as S where S.Sdept in (select SP.Sdept from Student as SP where SP.Sname='张柬之')

-- 查询出生日期和陕西籍学生出生日期相同的学生信息。
select * from Student as S where S.Sbirthdate in (select SP.Sbirthdate from Student as SP where SP.Sbirthplace='西安') and S.Sbirthplace<>'西安';

-- 查询选修了课程名为“信息系统”的学生学号和姓名。
select S.Sno,S.Sname from Student as S where S.Sno in (select SC.Sno from SC where SC.Cno in (select C.Cno from Course as C where C.Cname='信息系统'))

-- 查询未被“太平公主”选修的其他课程的选修情况。
select * from SC where SC.Cno not in (select SC_ex.Cno from SC as SC_ex join Student as S on SC_ex.Sno=S.Sno where S.Sname='太平公主')

-- 带比较运算符的子查询
-- 假设一个学生只可能在一个系学习，并且必须属于一个系。查询与“上官婉儿”在同一个系学习的学生。
select * from Student as S where S.Sdept = (select S_on.Sdept from Student as S_on where S_on.Sname='上官婉儿')

-- 查询学号为“SO1”的学生所选课程中超过选修课平均成绩的课程信息。
select C.Cno,C.Cname,C.CCredit,C.Cpno,C.CRemark from SC as SC_S01 join Course as C on SC_S01.Cno=C.Cno where SC_S01.Sno='2021S001' and SC_S01.Grade > (select avg(SC_ALL.Grade) from SC as SC_ALL where SC_ALL.Cno=SC_S01.Cno);

-- 带 ANY/ALL 谓词的子查询(*)
-- 查询非陕西籍的学生中比陕西籍任意一个学生年龄小的学生学号和姓名
select S_NO.Sno,S_NO.Sname from Student as S_NO where S_NO.Sdept<>'西安' and S_NO.Sage < all (select S_IS.Sage from Student as S_IS where S_IS.Sbirthplace='西安');

-- 查询其他系中比“自控系”某一学生年龄小的学生学号、姓名和年龄。
select S_NO.Sno,S_NO.Sname,S_NO.Sage from Student as S_NO where S_NO.Sdept<>'自控系' and S_NO.Sage < any (select S_IS.Sage from Student as S_IS where S_IS.Sdept='自控系')

-- 查询其他系中比“自控系”所有学生年龄都小的学生学号、姓名及年龄。
select S_NO.Sno,S_NO.Sname,S_NO.Sage from Student as S_NO where S_NO.Sdept<>'自控系' and S_NO.Sage < all (select S_IS.Sage from Student as S_IS where S_IS.Sdept='自控系')

-- 查询选课关系中所选课程平均成绩最高的学生的基本信息。
select * from Student as S where (select avg(SC_ONE.Grade) from SC as SC_ONE where SC_ONE.Sno=S.Sno) > all (select avg(S_ALL.Grade) from SC as S_ALL where S.Sno<>S_ALL.Sno group by S_ALL.Sno);

-- 带有 EXISTS 谓词的子查询
-- 查询选修了课程的学生姓名。
select S.Sname from Student as S where exists (select * from SC where SC.Sno=S.Sno)

-- 查询选修了全部课程的学生姓名，
select S.Sno from Student as S where not exists (select S_NO.Sno,C.Cno from Student as S_NO,Course as C where S_NO.Sno=S.Sno and not exists (select * from Student as S_ALL join SC as SC_ALL on S_ALL.Sno=SC_ALL.Sno where S_NO.Sno=S_ALL.Sno and C.Cno=SC_ALL.Cno))

-- 查询至少选修了学号为 SO1 学生选修的全部课程的学生号码。
select SC.Sno from SC where exists (select SC_01.Cno from SC as SC_01 where SC_01.Sno='2021SM001' and SC.Cno=SC_01.Cno) group by SC.Sno having count(SC.Cno)=(select count(SC.Cno) from SC where SC.Sno='2021SM001')


-- 查询所有存在不及格情况 (<60) 的学生的学号和姓名。
select S.Sno,S.Sname from Student as S where exists (select * from SC where S.Sno=SC.Sno and  SC.Grade<60)

-- 集合查询
-- 并操作
-- 查询学生关系表中，学号以 8 结尾和以 0 结尾的学生的基本信息。
select * from Student as S where S.Sno like '%8' union select * from Student as S where S.Sno like '%0'

-- 查询选课关系表中，成绩是 100 分或者成绩是 0分的记录。
select * from SC where SC.Grade=100 union select * from SC where SC.Grade=0

-- 交操作
-- 查询系别为自动化学院信息安全系的姓张的所有男性同学的基本信息。
select * from Student as S where S.Sdept='SC012102-信息安全' intersect select * from Student as S where S.Sname like '张%' intersect select * from Student as S where S.Ssex='男';

-- 查询课程表中学分大于 3 分并且课号是以 0 结尾的课程。
select C.Cno,C.Cname,C.CCredit,C.Cpno from Course as C where C.CCredit>3 intersect select C.Cno,C.Cname,C.CCredit,C.Cpno from Course as C where C.Cno like '%0'

-- 差操作
-- 查询“网络空间安全学院”所有除去陕西出生地的学生的基本信息。
select * from Student as S where S.Sdept='SC012102-信息安全' except select * from Student as S where S.Sbirthplace='西安';

-- 查询选课关系表中成绩未及格 (<60 分) 的学生学号。
select distinct R.Sno  from (select * from SC except select * from SC where SC.Grade>60) as R
use MY_DBMS;

-- 查询数学系 (MA) 全体学生的名单。
select S.Sname from Student as S,SC right join Course as C on SC.Cno=C.Cno and C.Cname='数学' where S.Sno=SC.Sno;

-- 查询考试成绩有不及格的学生的学号，且结果按学号降序排列。
select distinct Sno from SC where Grade<60 order by Sno desc;

-- 查询所有学生考试成绩有不及格的课程的情况，输出结果包括学号，课号和成绩。查询结果按学号降序排列，同一学生多门不及格课程的，按分数降序排列。
select distinct S.Sno,SC.Cno,SC.Grade from Student as S,SC where S.Sno=SC.Sno and SC.Grade<60 order by S.Sno desc,SC.Grade desc;

-- 查询所有年龄在 20 岁以下的学生姓名及其年龄。查询结果按年龄降序排列，同一年龄有多个学生的，按学号降序排列。
select S.Sno,S.Sname,S.Sage from Student as S where S.Sage<20 order by S.Sage desc,S.Sno desc;

-- 查询年龄在 20~23 岁(包括 20 岁和 23 岁)之间的学生的姓名、系别和年龄
select S.Sname,S.Sdept,S.Sage from Student as S where S.Sage>=20 and S.Sage<=23;

-- 查询年龄不在 18~23 岁(包括 18 岁和 23 岁)之间的学生的姓名、系别和年龄且查询结果按年龄降序排列，年龄相同的按性别降序排列，性别相同的按序号降序排列，女在前男在后。
select S.Sno,S.Sdept,S.Sage from Student as S where S.Sage>=18 and S.Sage<=23 order by S.Sage desc,S.Ssex desc,S.Sno desc;

-- 查询数学系 (MA) 和计算机科学系 (CS) 学生的姓名和性别。且查询结果先按性别升序排列，性别相同的按学号降序排列。
select Sname,Ssex from Student order by Ssex,Sno desc;

-- 查询既不是数学系，也不是计算机科学系的学生的姓名和性别。
select Sname,Ssex from Student where Sdept<>'CS' and Sdept<>'MA'

-- 查询所有姓“薛”，且全名为三个汉字的学生的姓名、学号和性别。
select Sname,Sno,Ssex from Student where Sname like '薛%' and len(Sname)=3;

-- 查询所有姓“欧”，第二个字不是“阳”，且全名为四个汉字的学生的姓名。
select Sname,Sno,Ssex from Student where Sname like '欧%' and Sname not like '欧阳%' and len(Sname)=4;

-- 查询“数据库”课程的课程号和学分。
select Cno,CCredit from Course where Cname='数据库'

-- 查询课程名以“DB_”开头，且倒数第 3 个字符为“%”的课程的详细情况。
select * from Course where Cname like 'DB_%'

-- 查询课程名以字符串“Sys”结尾、以从 “B”到“G”的任何单个字母开头的所有课程情况。
select * from Course where Cname like '[B-G]%Sys'

-- 查询课程名中，所有以字符串:“C”、“M”和“T”开头，且倒数第三个字母为“_”的课程情况。查询结果先以课程名降序排列。
select * from Course where Cname like 'C%\___' escape '\' or Cname like 'T%\___' escape '\' or Cname like 'M%\___' escape '\' order by Cno desc;

-- 查询课程名中，以字母“M”开头，并且第二个字母不是“a”，且有先修课的所有课程情况，且先按课程名降序排列。
select * from Course where Cname like 'M%' and Cname not like 'Ma%' and Cpno<>'' order by Cno desc;

-- 查询自控系 (AC) 、数学系 (MA) 和计算机科学系 (CS) 学生的姓名和性别。
select Sname,Ssex from Student where Sdept='AC' or Sdept='MA' or Sdept='CS';

-- 查询选修了“CO3”号课程的学生的学号及其成绩，查询结果按分数降序排列。
select S.Sno,SC.Grade from Student as S,SC right join Course as C on SC.Cno=C.Cno and C.Cno='C003' where S.Sno=SC.Sno order by SC.Grade desc;

-- 查询全体学生情况，查询结果按所在系的系号升序排列，同一系中的学生按年龄降序排列。
select * from Student order by Sdept,Sage desc;

-- 查询学生总人数
select count(Sno) from Student;

-- 查询选修了课程的学生总人数。
select count(distinct S.Sno) from Student as S left join SC on S.Sno=SC.Sno where SC.Sno<>'';

-- 计算“CO2”号课程的学生平均成绩。
select avg(Grade) from SC where SC.Cno='C002';

-- 查询选修了“CO2”号课程的学生最高分数。如果最高分有多个学生，按学号降序排列
select SC.Sno,SC.Cno,SC.Grade from SC where SC.Cno='C002' group by SC.Sno,SC.Cno,SC.Grade having SC.Grade = (select max(SC.Grade) from SC where SC.Cno='C002') order by SC.Sno desc;

-- 求各个课程号及相应的选课人数。查询结果按选课人数降序排列。如果课程的选课人数有相同的情况，按平均成绩降序排列。
select SC.Cno,count(Sno) as num,avg(Grade) as avg from SC group by SC.Cno order by num desc,avg desc;

-- 求各个课程成绩在 90 分以上的学生人数。查询结果按人数降序排列。如果人数有相同情况的，按平均成绩降序排列。
select SC.Cno,count(Sno) as num from SC group by SC.Cno order by num desc,avg(SC.Grade) desc

-- 查询选修了 2 门以上课程的学生学号。查询结果按所选课程数降序排列。如果有课程数相同的，按平均成绩升序排列。
select SC.Sno,count(SC.Cno),avg(SC.Grade) from SC group by SC.Sno having count(SC.Cno)>2 order by count(SC.Cno) desc,avg(SC.Grade);

-- 查询有 2 门以上课程在 80 分以上的学生的学号及 80 分以上的课程数。查询结果按 80 分以上的课程数降序排列。如果有课程数相同的，按所选全部课程数升序排列。
select SC.Sno,count(SC.Cno) as num from SC group by SC.Sno;

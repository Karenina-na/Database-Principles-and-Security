
-- use MY_DBMS;
-- ע�⣬��ͼ������������������е����

-- ������ͼ
-- ���������ϵѧ������ͼ CS_Stud1 (Sno��Sname��Sage)
-- create view CS_Stud1 as select Sno,Sname,Sage from Student where Student.Sdept='�����ϵ';

-- ���������ϵѧ������ͼ����Ҫ��͸������ͼ�����еĸ��²�����ֻ�漰�����ϵѧ�� CS_Stud_2 (Sno��Sname��Sage)
-- create view CS_Stud_2 as select Sno,Sname,Sage from Student where Student.Sdept='�����ϵ';

-- ������ѧϵѡ���� CO2 �ſγ̵�ѧ����ͼ MA_Stud1(Sno��Sname��Grade)
-- create view MA_Stud1 as select S.Sno,S.Sname,SC.Grade from Student as S join SC on S.Sno=SC.Sno where SC.Cno='C002' and S.Sdept='��ѧϵ';

-- ������ѧϵѡ���� C02 �ſγ��ҳɼ��� 90 �����ϵ�ѧ������ͼMA_Stud_90(Sno,Sname��Grade)
-- create view MA_Stud_90 as select S.Sno,S.Sname,SC.Grade from Student as S join SC on S.Sno=SC.Sno where SC.Cno='C002' and S.Sdept='��ѧϵ' and SC.Grade>90;

-- ��ѧ����ѧ�ż���ƽ���ɼ�����Ϊһ����ͼ��S_Gavgl(Sno��SGavg)
-- create view S_Gavg1 as select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno;

-- ��ƽ���ɼ�>=90 �ֵ�ѧ������ƽ���ɼ�����Ϊһ����ͼ��S_Gavg2(Sno,SGavg)
-- create view S_Gavg2 as select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno having avg(SC.Grade)>=90;

-- ��ƽ���ɼ�>=90 �֣�ѡ�޿γ��ۼƴﵽ 30 ѧ�֣���ѡ�޿γ����ﵽ 10 �����ϵ�ѧ������Ϊһ����ͼ��S_Gavg3(Sno��SumCredit��SumCourse��SGavg)
-- create view S_Gavg3 as select SC.Sno,sum(C.CCredit) as SumCredit,count(SC.Cno) as SumCourse,avg(SC.Grade) as SGavg from SC join Course as C on SC.Cno=C.Cno group by SC.Sno having avg(SC.Grade)>=90 and count(SC.Cno)>10 and sum(C.CCredit)>30

-- ѡ��ѧ�������ǵ�ϵ��ﵽ 3 �����ϣ��ҽ�ѡ���������Ŀγ̣�����Ϊһ����ͼ��C_Surveyl (Cno��SumDept��MaxSumStud)
-- create view C_Survey1 as select SubQ.Cno,SubQ.SumDept,SubQ.SumStud as MaxSumStud from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ where SubQ.SumStud=(select max(SubQ.SumStud) from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ)

-- ��ƽ���ɼ����� 80~90 �֣�ѡ�������ﵽ 15 �����ϣ���ѡ��ѧ�������ǵ�ϵ��ﵽ3�����ϵĿγ�,����Ϊһ����ͼ��C_Survey2 (Cno��SumStud��SumDept,CGavg)
-- create view C_Survey2 as select SC.Cno,count(SC.Sno) as SumStud,count(distinct S.Sdept) as SumDept,avg(SC.Grade) as CGavg from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having avg(SC.Grade)>80 and avg(SC.Grade)<90 and count(SC.Sno)>15 and count(distinct S.Sdept)>=3

-- ��ƽ���ɼ����� 80~90 �֣�ѡ�������ﵽ 20 �����ϣ�������ѧ�������� 3 �ˣ���ѡ��ѧ�������ǵ�ϵ�𳬹� 3 �����ϵĿγ̣�����Ϊһ����ͼ��C_Survey3(Cno, SumStud��SumDept, CGavg)
-- create view C_Survey3 as select SC.Cno,count(SC.Sno) as SumStud,count(distinct S.Sdept) as SumDept,avg(SC.Grade) as CGavg from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having avg(SC.Grade)>80 and avg(SC.Grade)<90 and count(SC.Sno)>20 and count(distinct S.Sdept)>=3 and (select count(SC_E.Sno) from SC as SC_E where SC.Cno=SC_E.Cno and SC_E.Grade<60)<=3

-- ��ѡ���������� 30 ���ϣ��ҿγ�ѡ��ѧ�����ǵ�ϵ�����Ŀγ̣�����Ϊһ����ͼ��C_Survey4 (Cno��MaxSumStud��SumDept)
-- create view C_Survey4 as select SC.Cno,count(S.Sno) as MaxSumStud,count(distinct S.Sdept) as SumDept from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(SC.Sno)>20 and count(distinct S.Sdept)=(select max(SubQ.SumDept) from (select SC.Cno,count(distinct S.Sdept) as SumDept from SC join Student as S on SC.Sno=S.Sno group by SC.Cno) as SubQ)


-- ��ѯ��ͼ
-- ���ü����ϵѧ������ͼ CS_Stud1 �в�ѯ:
  -- ����С�� 20 ���ѧ��
--  select * from CS_Stud1 as CS where CS.Sage<20

  -- ѡ���� CO2 �ſγ̵�ѧ��ѧ�ź�����
--  select CS.Sno,CS.Sname from CS_Stud1 as CS join SC on CS.Sno=SC.Sno where SC.Cno='C002'

-- ������ѧϵѧ������ͼ MA_Stud1 �в�ѯ:
  -- �ɼ������������
--  select count(MA.Sno) from MA_Stud1 as MA where MA.Grade<60

  -- C02 �ſγ̵�:�γ̺š��γ�����ƽ���ɼ�����߷֡���߷ֵ�ѧ��ѧ�ź���������ͷ֣���ͷֵ�ѧ��ѧ�ź�����
--  select C.Cno,C.Cname,avg(SC.Grade) as AvgGrade,max(SC.Grade) as MaxGrade,min(SC.Grade) as MinGrade from MA_Stud1 as MA join SC join Course as C on SC.Cno=C.Cno on MA.Sno=SC.Sno group by C.Cno,C.Cname having C.Cno='C002'
 
-- ���� S_Gavgl ��ͼ�в�ѯ
  -- ƽ���ɼ��� 90 �����ϵ�ѧ��ѧ�ź�ƽ���ɼ�
--  select * from S_Gavg1 as SG where SG.SGavg>90

  -- ƽ���ɼ��� 90 �����ϵ�ѧ����ѡ�����������: ѧ�š��������γ������ɼ�
--  select SG.Sno,S.Sname,C.Cname,SC.Grade from S_Gavg1 as SG join Student as S on SG.Sno=S.Sno join SC join Course as C on SC.Cno=C.Cno on SG.Sno=SC.Sno where SG.SGavg>90

-- ���� S_Gavg3 ��ͼ�в�ѯ:
  -- ƽ���ɼ��� 95 �����ϵ�ѧ��ѧ�ź�ƽ���ɼ�
--  select SG.Sno,SG.SGavg from S_Gavg3 as SG where SG.SGavg>90

  -- ƽ���ɼ��� 95 �����ϵ�ѧ����ѡ�����������: ѧ�š��������γ������ɼ�(����: ѡ�޿γ��ۼƴﵽ 30 ѧ�֣���ѡ�޿γ����ﵽ 10 ������)
--  select S.Sno,S.Sname,C.Cname,SC.Grade from S_Gavg3 as SG join Student as S join SC on S.Sno=SC.Sno join Course as C on SC.Cno=C.Cno on SG.Sno=S.Sno where SG.SGavg>90

-- ���� C_Surveyl ��ͼ�в�ѯ:
  -- �γ̵�ѡ�����������: �κš��γ�����ѧ�š��������ɼ�(����: ѡ��������࣬��ѡ��ѧ�������ǵ�ϵ��ﵽ 3 ������)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from C_Survey1 as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno

-- ���� C_Survey3 ��ͼ�в�ѯ:
  -- �γ̵�ѡ�����������: �κš��γ�����ѧ�š��������ɼ�(����:ƽ���ɼ����� 80~90 �֣�ѡ�������ﵽ 20 �����ϣ�������ѧ�������� 3 �ˣ���ѡ��ѧ�������ǵ�ϵ�𳬹� 3 ������)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from C_Survey3 as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno

-- ������ͼ���ⷨ����������ͼ (3) ~ (6) �У�������ͼ�Ĳ�ѯ��ת��Ϊ���ڻ���Ĳ�ѯ��
-- ���� S_Gavgl ��ͼ�в�ѯ
  -- ƽ���ɼ��� 90 �����ϵ�ѧ��ѧ�ź�ƽ���ɼ�
--  select * from (select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno) as SG where SG.SGavg>90

  -- ƽ���ɼ��� 90 �����ϵ�ѧ����ѡ�����������: ѧ�š��������γ������ɼ�
--  select SG.Sno,S.Sname,C.Cname,SC.Grade from (select SC.Sno,avg(SC.Grade) as SGavg from SC group by SC.Sno) as SG join Student as S on SG.Sno=S.Sno join SC join Course as C on SC.Cno=C.Cno on SG.Sno=SC.Sno where SG.SGavg>90

-- ���� S_Gavg3 ��ͼ�в�ѯ:
  -- ƽ���ɼ��� 95 �����ϵ�ѧ��ѧ�ź�ƽ���ɼ�
--  select SG.Sno,SG.SGavg from (select SC.Sno,sum(C.CCredit) as SumCredit,count(SC.Cno) as SumCourse,avg(SC.Grade) as SGavg from SC join Course as C on SC.Cno=C.Cno group by SC.Sno having avg(SC.Grade)>=90 and count(SC.Cno)>10 and sum(C.CCredit)>30) as SG where SG.SGavg>90

  -- ƽ���ɼ��� 95 �����ϵ�ѧ����ѡ�����������: ѧ�š��������γ������ɼ�(����: ѡ�޿γ��ۼƴﵽ 30 ѧ�֣���ѡ�޿γ����ﵽ 10 ������)
--  select S.Sno,S.Sname,C.Cname,SC.Grade from (select SC.Sno,sum(C.CCredit) as SumCredit,count(SC.Cno) as SumCourse,avg(SC.Grade) as SGavg from SC join Course as C on SC.Cno=C.Cno group by SC.Sno having avg(SC.Grade)>=90 and count(SC.Cno)>10 and sum(C.CCredit)>30) as SG join Student as S join SC on S.Sno=SC.Sno join Course as C on SC.Cno=C.Cno on SG.Sno=S.Sno where SG.SGavg>90

-- ���� C_Surveyl ��ͼ�в�ѯ:
  -- �γ̵�ѡ�����������: �κš��γ�����ѧ�š��������ɼ�(����: ѡ��������࣬��ѡ��ѧ�������ǵ�ϵ��ﵽ 3 ������)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from (select SubQ.Cno,SubQ.SumDept,SubQ.SumStud as MaxSumStud from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ where SubQ.SumStud=(select max(SubQ.SumStud) from (select SC.Cno,count(distinct S.Sdept) as SumDept,count(S.Sno) as SumStud from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having count(distinct S.Sdept)>=3) as SubQ)) as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno

-- ���� C_Survey3 ��ͼ�в�ѯ:
  -- �γ̵�ѡ�����������: �κš��γ�����ѧ�š��������ɼ�(����:ƽ���ɼ����� 80~90 �֣�ѡ�������ﵽ 20 �����ϣ�������ѧ�������� 3 �ˣ���ѡ��ѧ�������ǵ�ϵ�𳬹� 3 ������)
--  select C.Cno,C.Cname,S.Sno,S.Sname,SC.Grade from (select SC.Cno,count(SC.Sno) as SumStud,count(distinct S.Sdept) as SumDept,avg(SC.Grade) as CGavg from SC join Student as S on SC.Sno=S.Sno group by SC.Cno having avg(SC.Grade)>80 and avg(SC.Grade)<90 and count(SC.Sno)>20 and count(distinct S.Sdept)>=3 and (select count(SC_E.Sno) from SC as SC_E where SC.Cno=SC_E.Cno and SC_E.Grade<60)<=3) as CS join SC join Student as S on SC.Sno=S.Sno join Course as C on SC.Cno=C.Cno on CS.Cno=SC.Cno


-- ������ͼ
-- ���ü����ϵѧ����ͼ CS_Stud1 (Sno��Sage) �У���ѧ��Ϊ��2021S001������ѧ����������Ϊ������Ů�ʡ�(����ѧ���� S �У�����ѧ��Ϊ��SO1����ѧ����ѧ����ϵ���ǡ�CS��)
-- update CS_Stud1 set Sname='����Ů��' where Sno='2021S001'

-- ���ü����ϵѧ����ͼ CS_Stud1 (Sno��Sname��Sage) �У���ѧ��Ϊ��2021S002����ѧ����������Ϊ���ʽ����ࡱ(����ѧ���� S �У�����ѧ��Ϊ��SO2����ѧ����ѧ����ϵ���ǡ�MA��)��
-- update CS_Stud1 set Sname='�ʽ�����' where Sno='2021S002'

-- ���ü����ϵѧ����ͼ CS_Stud1 (Sno��Sname��Sage)�У���ѧ��Ϊ��2021S001����ѧ����¼ɾ��(����ѧ���� S �У�����ѧ��Ϊ��SO1����ѧ������ѧ����ϵ����6CS��)
-- delete from CS_Stud1 where Sno='2021S001' -- ���Լ��

-- ���ü����ϵѧ����ͼ CS_Studl (Sno��Sname��Sage) �У���ѧ��Ϊ��2021S001����ѧ����¼ɾ��(����ѧ���� S �У�����ѧ��Ϊ��SO2����ѧ������ѧ����ϵ����MA)
-- delete from CS_Stud1 where Sno='2021S002' -- ���Լ��

-- ������ϵѧ����ͼ CS_Stud1 (Sno��Sname��Sage) �У�����һ���µ�ѧ����5¼������ѧ��Ϊ��S51��������Ϊ�����ࡱ������ܲ��룬�������ͼ�Ƿ���Բ�ѯ�ü�¼?
-- insert into CS_Stud1 values ('S51','����','18'); -- not null Լ��

-- ������ϵѧ����ͼ CS_Stud1 (Sno��Sname��Sage) �У�����һ���µ�ѧ����¼������ѧ��Ϊ��S52��������Ϊ��Ҧ�硱������Ϊ 60 �ꡣ����ܲ��룬�������ͼ�Ƿ���Բ�ѯ�ü�¼?
-- insert into CS_Stud1 values ('S52','Ҧ��','60'); -- not null Լ��

-- ���ü����ϵѧ����ͼ CS_Stud_2 (Sno��Sname��Sage) ����ѧ��Ϊ��S61����¼���������Ϊ 43 ��(����ѧ�����У�����ѧ��Ϊ��S61����ѧ������ѧ����ϵ���ǡ�CS��) ���粻���޸ģ�Ϊʲô?
-- update CS_Stud_2 set Sage='43' where Sno='2021S006' -- ���Ը���

-- ���ü����ϵѧ����ͼ CS_Stud_2 (Sno��Sname��Sage) ����ѧ��Ϊ��S62��ѧ�����������Ϊ 54 ��(����ѧ�����У�����ѧ��Ϊ��S62����ѧ������ѧ����ϵ���ǡ�MA��) ���粻���޸ģ�Ϊʲô?
-- update CS_Stud_2 set Sage='43' where Sno='2021S008' -- ���Ը���

-- ������ϵѧ����ͼ CS_Stud_2 (Sno��Sname��Sage) �У�����һ�µ�ѧ����¼������ѧ��Ϊ��S63������Ϊ���ξ���
-- insert CS_Stud_2 values ('S63','�ξ�','19') -- not null Լ��

-- ���ü����ϵѧ����ͼ CS_Stud_2 (Sno��Sname��Sage) ����ѧ��Ϊ��S65��¼ɾ��(����ѧ������,����ѧ��Ϊ��S65����ѧ������ѧ����ϵ���ǡ�CS��)�粻��ɾ����Ϊʲô?
-- delete from CS_Stud_2 where Sno='2021S006' -- ���Լ��

-- ���ü����ϵѧ����ͼ CS_Stud_2 (Sno��Sname��Sage) ����ѧ��Ϊ��S66��¼ɾ��(����ѧ������,����ѧ��Ϊ��S66����ѧ������ѧ����ϵ���ǡ�MA��)�粻��ɾ����Ϊʲô?
-- delete from CS_Stud_2 where Sno='2021SM006' -- ���Լ��
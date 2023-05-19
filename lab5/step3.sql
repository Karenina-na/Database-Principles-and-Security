use MY_DBMS;

-- ��ѯ��ѧϵ (MA) ȫ��ѧ����������
select S.Sname from Student as S,SC right join Course as C on SC.Cno=C.Cno and C.Cname='��ѧ' where S.Sno=SC.Sno;

-- ��ѯ���Գɼ��в������ѧ����ѧ�ţ��ҽ����ѧ�Ž������С�
select distinct Sno from SC where Grade<60 order by Sno desc;

-- ��ѯ����ѧ�����Գɼ��в�����Ŀγ̵����������������ѧ�ţ��κźͳɼ�����ѯ�����ѧ�Ž������У�ͬһѧ�����Ų�����γ̵ģ��������������С�
select distinct S.Sno,SC.Cno,SC.Grade from Student as S,SC where S.Sno=SC.Sno and SC.Grade<60 order by S.Sno desc,SC.Grade desc;

-- ��ѯ���������� 20 �����µ�ѧ�������������䡣��ѯ��������併�����У�ͬһ�����ж��ѧ���ģ���ѧ�Ž������С�
select S.Sno,S.Sname,S.Sage from Student as S where S.Sage<20 order by S.Sage desc,S.Sno desc;

-- ��ѯ������ 20~23 ��(���� 20 ��� 23 ��)֮���ѧ����������ϵ�������
select S.Sname,S.Sdept,S.Sage from Student as S where S.Sage>=20 and S.Sage<=23;

-- ��ѯ���䲻�� 18~23 ��(���� 18 ��� 23 ��)֮���ѧ����������ϵ��������Ҳ�ѯ��������併�����У�������ͬ�İ��Ա������У��Ա���ͬ�İ���Ž������У�Ů��ǰ���ں�
select S.Sno,S.Sdept,S.Sage from Student as S where S.Sage>=18 and S.Sage<=23 order by S.Sage desc,S.Ssex desc,S.Sno desc;

-- ��ѯ��ѧϵ (MA) �ͼ������ѧϵ (CS) ѧ�����������Ա��Ҳ�ѯ����Ȱ��Ա��������У��Ա���ͬ�İ�ѧ�Ž������С�
select Sname,Ssex from Student order by Ssex,Sno desc;

-- ��ѯ�Ȳ�����ѧϵ��Ҳ���Ǽ������ѧϵ��ѧ�����������Ա�
select Sname,Ssex from Student where Sdept<>'CS' and Sdept<>'MA'

-- ��ѯ�����ա�Ѧ������ȫ��Ϊ�������ֵ�ѧ����������ѧ�ź��Ա�
select Sname,Sno,Ssex from Student where Sname like 'Ѧ%' and len(Sname)=3;

-- ��ѯ�����ա�ŷ�����ڶ����ֲ��ǡ���������ȫ��Ϊ�ĸ����ֵ�ѧ����������
select Sname,Sno,Ssex from Student where Sname like 'ŷ%' and Sname not like 'ŷ��%' and len(Sname)=4;

-- ��ѯ�����ݿ⡱�γ̵Ŀγ̺ź�ѧ�֡�
select Cno,CCredit from Course where Cname='���ݿ�'

-- ��ѯ�γ����ԡ�DB_����ͷ���ҵ����� 3 ���ַ�Ϊ��%���Ŀγ̵���ϸ�����
select * from Course where Cname like 'DB_%'

-- ��ѯ�γ������ַ�����Sys����β���Դ� ��B������G�����κε�����ĸ��ͷ�����пγ������
select * from Course where Cname like '[B-G]%Sys'

-- ��ѯ�γ����У��������ַ���:��C������M���͡�T����ͷ���ҵ�����������ĸΪ��_���Ŀγ��������ѯ������Կγ����������С�
select * from Course where Cname like 'C%\___' escape '\' or Cname like 'T%\___' escape '\' or Cname like 'M%\___' escape '\' order by Cno desc;

-- ��ѯ�γ����У�����ĸ��M����ͷ�����ҵڶ�����ĸ���ǡ�a�����������޿ε����пγ���������Ȱ��γ����������С�
select * from Course where Cname like 'M%' and Cname not like 'Ma%' and Cpno<>'' order by Cno desc;

-- ��ѯ�Կ�ϵ (AC) ����ѧϵ (MA) �ͼ������ѧϵ (CS) ѧ�����������Ա�
select Sname,Ssex from Student where Sdept='AC' or Sdept='MA' or Sdept='CS';

-- ��ѯѡ���ˡ�CO3���ſγ̵�ѧ����ѧ�ż���ɼ�����ѯ����������������С�
select S.Sno,SC.Grade from Student as S,SC right join Course as C on SC.Cno=C.Cno and C.Cno='C003' where S.Sno=SC.Sno order by SC.Grade desc;

-- ��ѯȫ��ѧ���������ѯ���������ϵ��ϵ���������У�ͬһϵ�е�ѧ�������併�����С�
select * from Student order by Sdept,Sage desc;

-- ��ѯѧ��������
select count(Sno) from Student;

-- ��ѯѡ���˿γ̵�ѧ����������
select count(distinct S.Sno) from Student as S left join SC on S.Sno=SC.Sno where SC.Sno<>'';

-- ���㡰CO2���ſγ̵�ѧ��ƽ���ɼ���
select avg(Grade) from SC where SC.Cno='C002';

-- ��ѯѡ���ˡ�CO2���ſγ̵�ѧ����߷����������߷��ж��ѧ������ѧ�Ž�������
select SC.Sno,SC.Cno,SC.Grade from SC where SC.Cno='C002' group by SC.Sno,SC.Cno,SC.Grade having SC.Grade = (select max(SC.Grade) from SC where SC.Cno='C002') order by SC.Sno desc;

-- ������γ̺ż���Ӧ��ѡ����������ѯ�����ѡ�������������С�����γ̵�ѡ����������ͬ���������ƽ���ɼ��������С�
select SC.Cno,count(Sno) as num,avg(Grade) as avg from SC group by SC.Cno order by num desc,avg desc;

-- ������γ̳ɼ��� 90 �����ϵ�ѧ����������ѯ����������������С������������ͬ����ģ���ƽ���ɼ��������С�
select SC.Cno,count(Sno) as num from SC group by SC.Cno order by num desc,avg(SC.Grade) desc

-- ��ѯѡ���� 2 �����Ͽγ̵�ѧ��ѧ�š���ѯ�������ѡ�γ����������С�����пγ�����ͬ�ģ���ƽ���ɼ��������С�
select SC.Sno,count(SC.Cno),avg(SC.Grade) from SC group by SC.Sno having count(SC.Cno)>2 order by count(SC.Cno) desc,avg(SC.Grade);

-- ��ѯ�� 2 �����Ͽγ��� 80 �����ϵ�ѧ����ѧ�ż� 80 �����ϵĿγ�������ѯ����� 80 �����ϵĿγ����������С�����пγ�����ͬ�ģ�����ѡȫ���γ����������С�
select SC.Sno,count(SC.Cno) as num from SC group by SC.Sno;

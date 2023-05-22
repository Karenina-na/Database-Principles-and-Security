use MY_DBMS;

-- ���Ӳ�ѯ
-- ��ֵ��ǵ�ֵ���Ӳ�ѯ
-- ��ѯѡ������ѡ�γ��к���ѧ�ִ��� 3 �ֵĿγ̵�ѧ���Ļ�����Ϣ
select distinct S.Sno,S.Sname,Ssex,Ssex,Sage,Sdept,Sbirthplace,Sbirthdate from Student as S join SC join Course as C on SC.Cno=C.Cno and C.CCredit>3 on S.Sno=SC.Sno;

-- ��ѯ�γ̳ɼ�����δ���� (<60 ��) �Ŀγ���Ϣ
select distinct C.Cno,C.Cname,C.CCredit,C.Cpno from Course as C join SC on SC.Grade<60 and SC.Cno=C.Cno;

-- ��ѯÿ��ѧ����ѧ�š��������Լ�ѡ�޵Ŀκš��������ɼ�
select S.Sno,S.Sname,C.Cno,C.Cname,SC.Grade from Student as S join SC left join Course as C on SC.Cno=C.Cno on S.Sno=SC.Sno;

--��������
-- ��ѯ���м�����пεĿγ�
select C1.Cno,C1.Cname,C2.Cno as Cpno_Cno,C2.Cname as Cpno_Cname from Course as C1 join Course as C2 on C1.Cpno=C2.Cname;

-- ��ѯ������ѧ��Ϊ��SO1��ѧ��Ϊͬһϵ��ѧ����ѧ�ź�����
select S2.Sno,S2.Sname from Student as S1 join Student as S2 on S1.Sdept=S2.Sdept where S1.Sno='2021S001';

-- ������ (�������ӡ��������ӡ�ȫ������)
-- ����˵�������Ӷ��������,������ѧ����Ϳγ̱���и��������ӵ��鸴����������
select * from Student left join Course on 1=1;
select * from Student right join Course on 1=1;
select * from Student full join Course on 1=1;

-- ���ҡ��ߵ���ѧ���ɼ����� 90 �ֵ�������Ů����ѧ�š�������������
select S.Sno,S.Sname,SC.Grade from Student as S right join SC right join Course as C on SC.Cno=C.Cno on S.Sno=SC.Sno where C.Cname='��ѧ' and SC.Grade>90 and S.Sbirthplace='����';

-- Ƕ�ײ�ѯ
-- �� IN ν�ʵ��Ӳ�ѯ
-- ��ѯ��ѧϵѧ���ߵ���ѧ�ĳɼ�
select SC.Grade from SC join Course as C on SC.Cno=C.Cno where C.Cname='��ѧ' and SC.Sno in (select S.Sno from Student as S where S.Sdept='��ѧϵ')

-- ��ѯѡ���ˡ�SO2���ſγ̵�ѧ������
select S.Sname from Student as S where S.Sno in (select SC.Sno from SC where SC.Cno='C002');

-- ��ѯ�롰�ż�֮����ͬһ��ϵѧϰ��ѧ����
select * from Student as S where S.Sdept in (select SP.Sdept from Student as SP where SP.Sname='�ż�֮')

-- ��ѯ�������ں�������ѧ������������ͬ��ѧ����Ϣ��
select * from Student as S where S.Sbirthdate in (select SP.Sbirthdate from Student as SP where SP.Sbirthplace='����') and S.Sbirthplace<>'����';

-- ��ѯѡ���˿γ���Ϊ����Ϣϵͳ����ѧ��ѧ�ź�������
select S.Sno,S.Sname from Student as S where S.Sno in (select SC.Sno from SC where SC.Cno in (select C.Cno from Course as C where C.Cname='��Ϣϵͳ'))

-- ��ѯδ����̫ƽ������ѡ�޵������γ̵�ѡ�������
select * from SC where SC.Cno not in (select SC_ex.Cno from SC as SC_ex join Student as S on SC_ex.Sno=S.Sno where S.Sname='̫ƽ����')

-- ���Ƚ���������Ӳ�ѯ
-- ����һ��ѧ��ֻ������һ��ϵѧϰ�����ұ�������һ��ϵ����ѯ�롰�Ϲ��������ͬһ��ϵѧϰ��ѧ����
select * from Student as S where S.Sdept = (select S_on.Sdept from Student as S_on where S_on.Sname='�Ϲ����')

-- ��ѯѧ��Ϊ��SO1����ѧ����ѡ�γ��г���ѡ�޿�ƽ���ɼ��Ŀγ���Ϣ��
select C.Cno,C.Cname,C.CCredit,C.Cpno,C.CRemark from SC as SC_S01 join Course as C on SC_S01.Cno=C.Cno where SC_S01.Sno='2021S001' and SC_S01.Grade > (select avg(SC_ALL.Grade) from SC as SC_ALL where SC_ALL.Cno=SC_S01.Cno);

-- �� ANY/ALL ν�ʵ��Ӳ�ѯ(*)
-- ��ѯ����������ѧ���б�����������һ��ѧ������С��ѧ��ѧ�ź�����
select S_NO.Sno,S_NO.Sname from Student as S_NO where S_NO.Sdept<>'����' and S_NO.Sage < all (select S_IS.Sage from Student as S_IS where S_IS.Sbirthplace='����');

-- ��ѯ����ϵ�бȡ��Կ�ϵ��ĳһѧ������С��ѧ��ѧ�š����������䡣
select S_NO.Sno,S_NO.Sname,S_NO.Sage from Student as S_NO where S_NO.Sdept<>'�Կ�ϵ' and S_NO.Sage < any (select S_IS.Sage from Student as S_IS where S_IS.Sdept='�Կ�ϵ')

-- ��ѯ����ϵ�бȡ��Կ�ϵ������ѧ�����䶼С��ѧ��ѧ�š����������䡣
select S_NO.Sno,S_NO.Sname,S_NO.Sage from Student as S_NO where S_NO.Sdept<>'�Կ�ϵ' and S_NO.Sage < all (select S_IS.Sage from Student as S_IS where S_IS.Sdept='�Կ�ϵ')

-- ��ѯѡ�ι�ϵ����ѡ�γ�ƽ���ɼ���ߵ�ѧ���Ļ�����Ϣ��
select * from Student as S where (select avg(SC_ONE.Grade) from SC as SC_ONE where SC_ONE.Sno=S.Sno) > all (select avg(S_ALL.Grade) from SC as S_ALL where S.Sno<>S_ALL.Sno group by S_ALL.Sno);

-- ���� EXISTS ν�ʵ��Ӳ�ѯ
-- ��ѯѡ���˿γ̵�ѧ��������
select S.Sname from Student as S where exists (select * from SC where SC.Sno=S.Sno)

-- ��ѯѡ����ȫ���γ̵�ѧ��������
select S.Sno from Student as S where not exists (select S_NO.Sno,C.Cno from Student as S_NO,Course as C where S_NO.Sno=S.Sno and not exists (select * from Student as S_ALL join SC as SC_ALL on S_ALL.Sno=SC_ALL.Sno where S_NO.Sno=S_ALL.Sno and C.Cno=SC_ALL.Cno))

-- ��ѯ����ѡ����ѧ��Ϊ SO1 ѧ��ѡ�޵�ȫ���γ̵�ѧ�����롣
select SC.Sno from SC where exists (select SC_01.Cno from SC as SC_01 where SC_01.Sno='2021SM001' and SC.Cno=SC_01.Cno) group by SC.Sno having count(SC.Cno)=(select count(SC.Cno) from SC where SC.Sno='2021SM001')


-- ��ѯ���д��ڲ�������� (<60) ��ѧ����ѧ�ź�������
select S.Sno,S.Sname from Student as S where exists (select * from SC where S.Sno=SC.Sno and  SC.Grade<60)

-- ���ϲ�ѯ
-- ������
-- ��ѯѧ����ϵ���У�ѧ���� 8 ��β���� 0 ��β��ѧ���Ļ�����Ϣ��
select * from Student as S where S.Sno like '%8' union select * from Student as S where S.Sno like '%0'

-- ��ѯѡ�ι�ϵ���У��ɼ��� 100 �ֻ��߳ɼ��� 0�ֵļ�¼��
select * from SC where SC.Grade=100 union select * from SC where SC.Grade=0

-- ������
-- ��ѯϵ��Ϊ�Զ���ѧԺ��Ϣ��ȫϵ�����ŵ���������ͬѧ�Ļ�����Ϣ��
select * from Student as S where S.Sdept='SC012102-��Ϣ��ȫ' intersect select * from Student as S where S.Sname like '��%' intersect select * from Student as S where S.Ssex='��';

-- ��ѯ�γ̱���ѧ�ִ��� 3 �ֲ��ҿκ����� 0 ��β�Ŀγ̡�
select C.Cno,C.Cname,C.CCredit,C.Cpno from Course as C where C.CCredit>3 intersect select C.Cno,C.Cname,C.CCredit,C.Cpno from Course as C where C.Cno like '%0'

-- �����
-- ��ѯ������ռ䰲ȫѧԺ�����г�ȥ���������ص�ѧ���Ļ�����Ϣ��
select * from Student as S where S.Sdept='SC012102-��Ϣ��ȫ' except select * from Student as S where S.Sbirthplace='����';

-- ��ѯѡ�ι�ϵ���гɼ�δ���� (<60 ��) ��ѧ��ѧ�š�
select distinct R.Sno  from (select * from SC except select * from SC where SC.Grade>60) as R
-- ʹ�����ݿ�
use lab2;

/* ��ͳ�������� */
-- ���� 
select S.Sno from Student as S union select SC.Sno from SC; -- �Զ�ȥ���ظ����� 20������
select SC.Cno from SC union all select C.Cno from Course as C; -- ��ȥ���ظ����� 40������

-- ����
select S.Sno from Student as S intersect select SC.Sno from SC; -- �Զ�ȥ���ظ����� 7������

-- ��
select S.Sno from Student as S except select SC.Sno from SC; -- �Զ�ȥ���ظ����� 13������

-- ����ѿ�����
select * from Student,SC,Course;

/* ר�Ź�ϵ���� */

-- ѡ��
select S.Sname from Student as S where S.Sno=10001; -- ѡ��ѧ������ѧ��Ϊ10001��ѧ��������

-- ͶӰ
select S.Sno,S.Sname from Student as S; -- ѡ��ѧ�����е�ѧ���к�������

-- ��Ȼ����
select distinct S.Sno,S.Sname,S.Ssex,S.SbirthDay,S.Sdept,S.SBirthPlace,SC.Cno,SC.Grade from Student as S inner join SC on S.Sno=SC.Sno; -- ʹ��inner join onģ����Ȼ���� distinctȥ��

-- ��ֵ����
select * from Student as S inner join SC on S.Sno=SC.Sno;

-- һ������

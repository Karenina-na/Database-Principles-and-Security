-- ʹ�����ݿ�
--use SchoolManager;

-- ʹ��Լ��ǿ�������ݵ������� (Ψһ��Լ����CHECK Լ����DEFAULT Լ��)
-- ����ѧ����ϵ�� S��ѧ�� Sno Ϊ������ͬʱΪ���� Sname �ֶν���Ψһ��Լ����
--create table S (
--   Sno nchar(10) primary key,
--   Sname nchar(10) constraint Sname_unique unique,
--   Ssex nvarchar(1),
--   Sage smallint,
--   Sdept nvarchar(50),
--   Scholarship nvarchar(50),
--);

-- ������S ���޸� S ��ȡ������ Sname ��Ψһ��Լ��
--alter table S drop constraint Sname_unique;

-- �ٴ��޸� S ���������� Sname ��Ψһ��Լ����
--alter table S add constraint Sname_unique unique(Sname);

-- �����γ̹�ϵ�� C,�γ̺� Cno Ϊ������ͬʱҪ��Ϊѧ�� Ccredit �ֶδ��� CHECKԼ����ʹ 15>=Ccredit>0��
--create table C (
--	Cno nvarchar(50) primary key,
--	Cname nvarchar(50),
--	CCredit numeric(3,1) constraint CCredit_check check(CCredit>=0 and CCredit<=15),
--	Cpno nvarchar(10),
--);

-- ������C ���޸� C����ֹѧ�� Ccredit �� CHECK Լ��
--alter table C nocheck constraint CCredit_check;

-- �ٴ��޸� C������ѧ�� Ccredit �� CHECK Լ����
--alter table C check constraint CCredit_check;

-- ����ѡ�޹�ϵ�� SC���γ̺� Cno ��ѧ�ֺ� Cno ��ͬ����������ͬʱҪ��Ϊ�ɼ� Grade �ֶδ��� Default Լ����ʹ�ɼ� Grade ��ȱʡĬ��ֵΪ 60 �֡�
--create table SC (
--	Sno nchar(10),
--	Cno nvarchar(50),
--	Grade numeric(4,1) constraint Grade_default default(60),
--	primary key (Sno,Cno),
--);

-- ������SC ���޸� SC ��ȡ���ɼ� Grade �� Default Լ����
--alter table SC drop constraint Grade_default;

-- �ٴ��޸� SC �����ӳɼ� Grade �� Default Լ����ʹ�ɼ� Grade ��ȱʡĬ��ֵiΪ0�֡�
--alter table SC add constraint Grade_default default (0) for Grade;

-- ʹ�ù���ʵʩ����������
-- �������� Grade Rule: ����ȡֵΪ0��100; �������� Ssex Rule: ����ȡֵΪ('M'��F'); 
-- �������� Sno Rule: �ܹ� 10 λ�֣����Ƶ� 1~2 λΪ��ĸ(a~z)���� 3 λȡ��ĸ-������Ϊ����(0-9);
--create rule Grade_Rule as @Grade between 0 and 100;
--create rule Ssex_Rule as @Ssex in ('M','F');
--create rule Sno_Rule as @Sno like '[a-z][a-z]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

-- �� Grade Rule ����󶨵� SC �� Grade ��; �� Ssex Rule ����󶨵� S ��� Ssex ��; �� Sno Rule �ֱ�󶨵� S ��� Sno �к� C��� Cno �С�
--exec sp_bindrule 'Grade_Rule' , 'SC.Grade';
--exec sp_bindrule 'Ssex_Rule' , 'S.Ssex';
--exec sp_bindrule 'Sno_Rule' , 'S.Sno';
--exec sp_bindrule 'Sno_Rule' , 'C.Cno';

-- ���ϰ󶨹���ĸ��У�����ڱ���ʱ�����Ѷ����� CHECK/DEFAULT ��Լ�����󶨹���������������? ���оٸ��ֿ��ܵ��������������֤������ʵ����.�ܽ���Ӧ��ʵ����ۡ�
-- ���󶨹���������е�Լ��ͬʱ����ʱ��������һ��ǿ��Լ���������ṩ��������������Ա���������֤��ʵ���У�Υ���˹����Լ���Ĳ����������ʧ�ܣ�ȷ�����ݵ������Ժ�һ���ԡ�

-- �󶨹���󣬷ֱ�������ݵĲ��룬��֤�󶨹������Ч��
--insert into SC (Sno,Cno,Grade) values('123','123',-1);
--insert into SC (Sno,Cno,Grade) values('123','123',101);
--insert into SC (Sno,Cno,Grade) values('1','1',50);
--insert into S (Sno,Ssex) values('a','M');
--insert into S (Sno,Ssex) values('ab-12','e');
--insert into S (Sno,Ssex) values('ab-1111111','M');

-- ���󶨵� SC �� grade �еĹ��� Grade Rule�������ɰ�
--exec sp_unbindrule 'SC.Grade' , 'Grade_Rule';

-- �����ɰ���ٴν������ݵĲ���������֤��
--insert into SC values ('123','123',-100);

-- ɾ�� Grade Rule ����
--drop rule Grade_Rule;

-- ʹ��Ĭ��ֵ��ʵʩ����������
-- ����Ĭ��ֵ Sage Default��ȡֵΪ 20������Ĭ��ֵ Ssex Default 1��ȡֵΪ'M'������Ĭ��ֵ Ssex Default 2��ȡֵΪ'��
--create default Sage_default as 20;
--create default Ssex_default_1 as 'M';
--create default Ssex_default_2 as '��';

-- �� Sage Default �󶨵� S ��Sage ��;�� Ssex Default 1 �󶨵� S�� Ssex �С�
--exec sp_bindefault 'Sage_default' , 'S.Sage';
--exec sp_bindefault 'Ssex_default_1' , 'S.Ssex';

-- ��Ĭ��ֵ֮�󣬷ֱ�������ݵĲ��룬��֤��Ĭ��ֵ����Ч�ԡ�
--insert into S(Sno) values ('ab-9999999');
--select * from S;

-- ���󶨵� S�� Ssex �е�Ĭ��ֵ Ssex Default 1�������ɰ�
--exec sp_unbindefault 'S.Ssex' , 'Ssex_default_1';

-- ɾ�� Ssex Default 1Ĭ��ֵ
--drop default Ssex_default_1;

-- �����Ž� Ssex Default 2 Ĭ��ֵ�󶨵� S ��Ssex ��(����ͬʱ���� Ssex Rule��)���۲���ʲô���?
--exec sp_bindefault 'Ssex_default_2' , 'S.Ssex';
--insert into S(Sno) values ('ab-9999999');
--select * from S;

-- ���ϰ�Ĭ�ϵĸ��У�����ڱ���ʱ�����Ѷ����� CHECK/DEFAULT ��Լ������Ĭ��ֵ�������������? ���оٸ��ֿ��ܵ��������������֤,����ʵ�����ܽ���Ӧ��ʵ����ۡ�
-- ���󶨹���������е�Լ��ͬʱ����ʱ��Լ����������ӣ��������ϸ��Լ������Ϊ׼��������Լ���������ǰ󶨵Ĺ���ֻҪ�������Υ����Լ�����������ᵼ�²���ʧ�ܣ��Ӷ���֤�����ݵ������Ժ�һ���ԡ�

-- ˼���ܽ�
-- ����:���е��У��ڱ���ʱ���Ȳ�����Լ��������ͨ����Ĭ��ֵ/������ʵaʩ���������ԡ�
-- ���:���޸ı��Ա�ĸ��н��������������UNIQUE��CHECK��DEFAULT��NOT6��NULL ��Լ���Ķ��壬��������������? ���оٸ��ֿ��ܵ��������������֤������ʵ�������ܽ���Ӧ��ʵ����ۡ�
-- ����ͨ����Ĭ��ֵ/������ʵʩ���������Ժ��ٶԱ���н��������������UNIQUE��CHECK��DEFAULT��NOT NULL��Լ���Ķ���ʱ����ЩԼ������Ĭ��ֵ/����ͬ�����á����������ͬʱ�ܵ�Լ����Ĭ��ֵ/��������ƣ�ȷ�����ݵ������Ժ�һ���ԡ�
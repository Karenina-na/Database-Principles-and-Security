-- ʹ�����ݿ�
use MY_DBMS;

-- ��������
select * from Student;
select * from Course;
select * from SC;

-- �ַ���ת��Ϊint
select cast('100' as int);

-- int��תΪfloat
select cast(100 as float) + 0.54;

-- datetimeתΪdatetime2 �����Զ�����
select cast('2021-05-10 10:30:00' as datetime2);

-- nvarchar(10) תΪ varchar(10) ��Ҫ����Unicode�����ַ�����
select cast(cast('���, world!' as  nvarchar(10)) as varchar(10)); -- �ᵼ���ַ��ض�
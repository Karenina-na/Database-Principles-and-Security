-- �ַ���ת��Ϊint
select cast('100' as int);

-- int��תΪfloat
select cast(100 as float) + 0.54;

-- datetimeתΪdatetime2 �����Զ�����
select cast('2021-05-10 10:30:00' as datetime2);

-- nvarchar(10) תΪ varchar(10) ��Ҫ����Unicode�����ַ�����
select cast(cast('���, world!' as  nvarchar(10)) as varchar(10)); -- �ᵼ���ַ��ض�

-- ����ǰ����ʱ��ת�����ַ������ͣ�����ʹ���� 120 ��ʽ�룬��ʾ������ʱ���ʽ��Ϊ����-��-�ա�����ʽ��
select convert(varchar(10), getdate(), 120)

-- nvarchar(10) תΪ varchar(10) ��Ҫ����Unicode�����ַ��ض�����
select convert(varchar(10),cast('���, world!' as  nvarchar(10)))
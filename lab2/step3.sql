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

-- ����ѿ����� ��ʽ�ȼ�
select * from Student cross join Course cross join SC;
-- select * from Student,SC,Course;

/* ר�Ź�ϵ���� */

-- ѡ��
select * from Student as S where S.Sno=10001; -- ѡ��ѧ������ѧ��Ϊ10001��ѧ������Ϣ

-- ͶӰ
select S.Sno,S.Sname from Student as S; -- ѡ��ѧ�����е�ѧ���к�������

-- ��Ȼ����
select distinct S.Sno,S.Sname,S.Ssex,S.SbirthDay,S.Sdept,S.SBirthPlace,SC.Cno,SC.Grade from Student as S inner join SC on S.Sno=SC.Sno; -- ʹ��inner join onģ����Ȼ���� distinctȥ��

-- ��ֵ����
select * from Student as S inner join SC on S.Sno=SC.Sno;	-- ѡ��ѧ�����ѡ�α�����ͬѧ��ѧ������Ϣ

-- һ������
select S.Sno from Student as S inner join SC on S.Sno=SC.Sno; -- ������������ ѡ��ѧ�����ѡ�α�����ͬѧ��ѧ��������

-- ��������
select * from Student as S left join SC on S.Sno=SC.Sno; -- ����ѧ�����ѡ�α�ѧ�����е�����Ԫ�鱣��

-- ��������
select * from SC right join Course as C on SC.Cno=C.Cno; -- ����ѡ�α�Ϳγ̱��γ̱��е�����Ԫ�鱣��

-- ȫ����
select * from Student as S full join Course as C on S.Sno=C.Cno; -- ����ѧ�����ѡ�α����ߵ�����Ԫ������棬�����������������֪�����ȫΪ����Ԫ��


/* ����ѿ����������ӵĸ��� */
-- ����ѿ�����������ʽ�ȼ�
select * from Student,Course,SC; -- ����������ѯ
select * from Student cross join Course cross join SC; -- ������ȫ����

/*
����ѿ�����Ϊ��������������ϣ�һ������Ϊ�������Ķ�����ӣ���������ȫ���ӵõ��Ľ�������ѿ�������ͬ
�� SQL �У�����ѿ����������Ӷ����������������Ĳ����������ǵ�ʵ�ַ�ʽ�ͽ�����в�ͬ��
����ѿ�������һ����������������������᷵�����б��֮���������ϣ�����Ҫָ���κ��������� SQL �У�����ʹ�ö��ŷָ������񣬻���ʹ�� CROSS JOIN �ؼ�������ʾ����ѿ�������
������һ��������������������������ָ���������������Ӷ�������ɸѡ�������������С��� SQL �У�����ʹ�� INNER JOIN��LEFT JOIN��RIGHT JOIN �ȹؼ�������ʾ���ӡ�
��Ҫע����ǣ�ȫ���������ӵ�һ��������������᷵����������е������У������Ƿ�������������������������Ϊ��ʱ��ȫ���ӿ��Կ��������������ӣ������ͬ�ڹ���ѿ�����������ʵ�ʵ�Ӧ���У�ȫ���Ӻ͹���ѿ�������ʹ�ó�����������������ġ�
*/
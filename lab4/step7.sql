use MY_DBMS;

-- cross join ʵ�����������ѿ��������㣬��������Student��Course��
select * from Student cross join course;

-- ѡ�����㣬ѡ��ѧ��Ϊ'012'��ѡ�α���Ϣ
select * from SC where Sno='012';

-- ͶӰ���㣬�鿴����ѧ��������
select Sname from Student;

-- �������㣬�������Ӳ�ѯ����ѡ�˿γ̱��ΪC001��ѧ����Ϣ
select * from Student as S left join SC on S.Sno=SC.Sno where SC.Cno='C001';
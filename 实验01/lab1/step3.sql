-- ��ѯȫ���γ�
select * from Course;

-- ��ѯȫ��ѧ��
select * from Student;

-- ��ѯȫ��ѡ����Ϣ
select * from SC;

-- ͨ��ѡ����Ϣ��ѯ����ѧ����ѡ�α�
select S.*,C.* from Student as S,Course as C,SC where S.Sno=SC.Sno and SC.Cno=C.Cno;

-- ͨ��ѡ����Ϣ��ѯ����ѧ����ѡ�α� ���Ӳ�ѯģʽ
select S.*, C.* from Student as S inner join SC on S.Sno = SC.Sno inner join Course as C on SC.Cno = C.Cno;

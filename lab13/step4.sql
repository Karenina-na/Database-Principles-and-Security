-- ������¼�������ݿ��û���ʵ�ֶ����ݿ�ķ���
-- ������¼�� dlm1��dlm2��dlm3��dlm4��dlm5 ������̶���������ɫ��
--create login dlm1 with password='123';
--create login dlm2 with password='123';
--create login dlm3 with password='123';
--create login dlm4 with password='123';
--create login dlm5 with password='123';

-- ��� SchoolManagement ���ݿ⣬�������ݿ��û� U1��U2��U3��U4��U5��
-- �ֱ��������ĸ����ݿ��û�����������¼�� (һ����¼��������Ϊ��ͬ�û�ӳ�䵽��ͬ�����ݿ⣬����ÿ�����ݿ���ֻ����Ϊһ���û�����ӳ�䡣
--use SchoolManagement;
--create user U1 for login dlm1;
--create user U2 for login dlm2;
--create user U3 for login dlm3;
--create user U4 for login dlm4;
--create user U5 for login dlm5;

-- ͨ����¼�������ݿ��û���ʵ�ֶ����ݵķ��ʡ�

-- Ҫ��ֱ�ʹ�� SSMS ��T SQL ������� (1) ~ (4) ����ʵ��

use SchoolManagement;
-- ��Ȩ������Ȩ��
-- �Ѳ�ѯ S ��Ȩ���ڸ��û� U1��
--grant select on S to U1;

-- �Ѷ� S ��� C���ȫ��Ȩ�������û� U2 �� U3
--grant all privileges on S to U2,U3;
--grant all privileges on C to U2,U3;

-- �ѶԱ� SC �Ĳ�ѯȨ�����������û���
--grant select on SC to public;

-- �Ѳ�ѯ S ����޸�ѧ��������Ȩ���ڸ��û� U4��
--grant select,update(Sname) on S to U4;

-- �ѶԱ� SC �� INSERT Ȩ������ U5 �û������������ٽ���Ȩ�����������û�5
--grant insert on SC to U5 with grant option;

-- ���û� U4 �޸�ѧ��ѧ�ŵ�Ȩ���ջء�
--revoke update(Sname) on S from U4;

-- �ջ������û��Ա� SC �Ĳ�ѯȨ��
--revoke select on SC from public;

-- ���û�U5 �� SC ��� INSERT Ȩ���ջ�    cascade -- ��ѡ�ȷ�����������ڱ�����Ȩ�޵���ȨҲ��һ��������
--revoke insert on SC from U5 cascade;

-- Ȩ����֤
-- �������е���Ȩ������ͨ����Ӧ�� SQL ���������֤(2) Ȩ����֤Ҫ��: ��������û� U1 ��ѯѧ���� S:a����Ȩǰ�û�ʱ����Բ�ѯ?
-- ��������Բ�ѯ����Ȩ���Ƿ���Բ�ѯ?
-- ������Բ�ѯ������Ȩ�޺��ǲ��ǲ����ٲ�ѯ?

-- ɾ���û���
--use SchoolManagement;
--drop user U1;
--drop user U2;
--drop user U3;
--drop user U4;
--drop user U5;

-- ɾ����¼��
--drop login dlm1;
--drop login dlm2;
--drop login dlm3;
--drop login dlm4;
--drop login dlm5;
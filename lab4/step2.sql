-- ʹ�����ݿ�
use MY_DBMS;

-- ɾ��Student���Sdept��

-- alter table Student drop column Sdept;

-- ���Student���Sdept��
-- alter table Student add Sdept nvarchar(50);

-- �޸�Student���Sdept����ΪSdept_change
-- EXEC sp_rename 'Student.Sdept', 'Sdept_change', 'COLUMN';

--���¶���Student���Ssex����Ϊnchar(1)
-- alter table Student alter column Ssex nchar(1);

-- ɾ��SC������SC���������������Student��Course����˲���ֱ��ɾ��Student��Course��
-- drop table SC;
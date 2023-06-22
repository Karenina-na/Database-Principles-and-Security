--use master;

-- ������˶��� Audit1������˲������󱣴���ָ���ļ��� SQLAudit ��
--create server audit Audit1 to file (filepath='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\Database-Principles-and-Security\lab14\SQLAudit')

--alter server audit Audit1 with(state=on);

-- �����������
-- ΪAuditl ��������������˹淶 ServerAuditSpecification1���������¼��������:
  -- ʹ��ϵͳ�洢���̴�����ɾ����¼��
  -- ��¼����¼�ɹ�
  -- ��¼����¼ʧ��
  -- ���������Ļ�ɾ���κ����ݿ�
--create server audit specification ServerAuditSpecification1 for server audit audit1
--add (server_principal_change_group),
--add (successful_login_group),
--add (failed_login_group),
--add (database_change_group)

-- Ȼ��������˹淶 ServerAuditSpecification1��
--alter server audit specification ServerAuditSpecification1 with(state = on);

-- ִ�� (1) ���е� ~ ������Ȼ��鿴��˶��� Auditl ����Ӧ����Ƽ�¼���﷨��ʽ����:
 --exec sp_addlogin U1;
-- �������
--select * from sys.dm_exec_sessions where login_name = 'U1';
--exec sp_droplogin U1;

--create database database1;
--drop database database1;
--declare @filename nvarchar(100) = 'Audit1_E51337B0-990D-48C3-BC9B-8A085513E40F_0_133318836972920000.sqlaudit';
--select event_time,succeeded,session_server_principal_name,server_principal_name,statement from sys.fn_get_audit_file('C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\Database-Principles-and-Security\lab14\SQLAudit\'+@filename,NULL,NULL)

-- �޸���˹淶 ServerAuditSpecification1�����ٶ�4�¼�������ƣ������Ӷԡ��û������ĵ�¼���롱�¼������(�޸�ǰ�Ƚ��ø���˹淶���޸���ɺ�������)������֤�Ƿ��޸ĳɹ� (ͨ���鿴��˼�¼)
--alter server audit specification ServerAuditSpecification1 with(state = off);
--alter server audit specification ServerAuditSpecification1 drop (database_change_group);
--alter server audit specification ServerAuditSpecification1 add (login_change_password_group);
--alter server audit specification ServerAuditSpecification1 with(state = on);

--exec sp_addlogin U1;
--exec sp_password @old='',@new='123',@loginame='U1';
--exec sp_droplogin U1;

-- ɾ�����
--alter server audit specification ServerAuditSpecification1 with(state = off);
--drop server audit specification ServerAuditSpecification1;

-- ���ݿ⼶���
-- Ϊ Auditl �������ݿ⼶��˹淶 DatabaseAuditSpecification2���� STUDY ���ݿ��������¼��������:
  -- �� STUDY ���ݿⱸ�ݻ�ԭ����
  -- �� STUDY ���ݿⴴ����ɾ���û�����
  -- �� STUDY ���ݿ�ĳһ�������ݵ�����ɾ���ġ������
  -- �� STUDY ���ݿ�ĳһ�洢���̵�ִ�в���

--use Study;

--create database audit specification DatabaseAuditSpecification2 for server audit audit1
--add (backup_restore_group),
--add (database_principal_change_group),
--add (insert on schema::[dbo] by public),
--add (delete on schema::[dbo] by public), 
--add (select on schema::[dbo] by public), 
--add (update on schema::[dbo] by public),
--add (execute on schema::[dbo] by public);

-- Ȼ��������˹淶 ServerAuditSpecification2

--alter database audit specification DatabaseAuditSpecification2 with(state = on);

-- �� Study ���ݿ�ִ�� (1) ���е�O ~������Ȼ��鿴��˶��� Audit1 �й���Study ���ݿ����Ƽ�¼���﷨��ʽ����:

--declare @filename nvarchar(100) = 'Audit1_E51337B0-990D-48C3-BC9B-8A085513E40F_0_133318836972920000.sqlaudit';
--select event_time,succeeded,session_server_principal_name,server_principal_name,statement from sys.fn_get_audit_file ('C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\Database-Principles-and-Security\lab14\SQLAudit\'+ @filename,NULL,NULL) where database_name ='Study';

--insert into S(Sno,Sname) values ('123','����');
--update S set Sname='����' where Sno='123';
--select * from S;
--delete from S where S.Sno='123';

--backup database Study to disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\data.bak';
--backup log Study to disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\dataLog.bak'

use master;

-- ������ݿ�ʹ�ù�״̬ ONLINE���ܻ�ԭ
--select state_desc from sys.databases where name = 'Study';
-- ��� �������Ӻͽ��� Ϊ�ղ��ܻ�ԭ
--select session_id, login_name, status from sys.dm_exec_sessions where database_id = DB_ID('Study');

--restore database Study from disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\data.bak' with norecovery, replace;
--restore log Study from disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\dataLog.bak' with recovery;

use Study;

-- �޸���˹淶 ServerAuditSpecification2������3���¼�������ƣ����������Ӷԡ��� STUDY ���ݿ����ض���ɫ�ܹ������ж���� DML(�������޸ġ�ɾ��)�������¼������(�޸�ǰ�Ƚ��ø���˹淶���޸���ɺ�������) ������֤�Ƿ��޸ĳɹ� (ͨ���鿴��˼�¼)��
--alter database audit specification DatabaseAuditSpecification2 with(state = off);
--alter database audit specification DatabaseAuditSpecification2 drop (backup_restore_group);
--alter database audit specification DatabaseAuditSpecification2 drop (database_principal_change_group);
--alter database audit specification DatabaseAuditSpecification2 drop (execute on schema::[dbo] by public);
--alter database audit specification DatabaseAuditSpecification2 add (insert,update,delete on schema::[dbo] by dbo);
--alter database audit specification DatabaseAuditSpecification2 with(state = on);

--insert into S(Sno,Sname) values ('C02','����');
--delete from S where S.Sname='����';
--select * from S;
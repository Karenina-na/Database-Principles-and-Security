--use Study;

-- ����

-- �������ݿ�
-- ���������豸
-- exec sp_addumpdevice 'disk' , 'MyDBdevice' , 'C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\MyDbbackup.bak'
-- backup database Study to MyDBdevice;

-- ֱ��ָ������
-- backup database Study to disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\MyDbbackup.bak';

-- �������ݿ���־
-- ���������豸
-- exec sp_addumpdevice 'disk' , 'MyDbLogbackup' , 'C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\MyDbLogbackup.bak'
-- backup log Study to MyDbLogbackup;

-- ֱ��ָ������
-- backup log Study to disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\MyDbLogbackup.bak';


-- �ָ�
-- �������ݿ�
--insert into S values
--('123','����','��',18,'��Ϣ','���Ƚ�');

--create table new1(
--	newID int primary key
--)

--use master;

-- ������ݿ�ʹ�ù�״̬ ONLINE���ܻ�ԭ
--select state_desc from sys.databases where name = 'Study';
-- ��� �������Ӻͽ��� Ϊ�ղ��ܻ�ԭ
--select session_id, login_name, status from sys.dm_exec_sessions where database_id = DB_ID('Study');

-- �ָ����ݿ� ��һ����ԭ��Ҫ with norecovery����ʱ���ݿ⻹���ڻ�ԭ������
-- ͨ�������豸
--restore database Study from MyDBdevice with norecovery , replace;

-- ֱ��ָ��
-- restore database Study from disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\MyDbbackup.bak' with norecovery , replace;

-- �ָ���־ ���һ����ԭ��Ҫrecovery����ʾ���ݿ�ָ�����ʹ��
-- ͨ�������豸
--use master;
--restore log Study from MyDbLogbackup with recovery;

-- ֱ��ָ��
-- restore log Study from disk='C:\Users\15399\Desktop\���ݿ�ԭ���밲ȫ\test\MyDbLogbackup.bak' with recovery , replace;

--use Study;
--select * from S;

-- ɾ�������豸
 --exec sp_dropdevice MyDBdevice , 'delfile';
 --exec sp_dropdevice MyDbLogbackup , 'delfile';


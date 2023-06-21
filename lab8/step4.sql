use MyDataBase;

-- ��������������Ĵ洢����: ����ϵ���Ա�󣬲�ѯ��ϵ��Ӧ�Ա�ѧ����ѡ�������
--create procedure SelectSCBySdeptAge	
--	@Dept nvarchar(50),
--	@Sex nvarchar(1)
--as 
--begin
--	select S.Sno,S.Sname,S.Sage,S.Ssex,S.Sdept,C.Cno,C.Cname from Student as S join SC join Course as C on SC.Cno=C.Cno on S.Sno=SC.Sno where S.Ssex=@Sex and S.Sdept=@Dept;
--end
--exec dbo.SelectSCBySdeptAge @Dept='��ѧϵ',@Sex='��';

-- ���������������Ĭ��ֵ�Ĵ洢����: ����ϵ���Ա�󣬲�ѯ��ϵ��Ӧ�Ա�ѧ����ѡ����������������ѧ�����Ա���Ĭ�ϲ�ѯ��ϵ������ѡ�����
--create procedure SelectSCBySdeptAgeDefault	
--	@Dept nvarchar(50),
--	@Sex nvarchar(1)='��'
--as 
--begin
--	select S.Sno,S.Sname,S.Sage,S.Ssex,S.Sdept,C.Cno,C.Cname from Student as S join SC join Course as C on SC.Cno=C.Cno on S.Sno=SC.Sno where S.Ssex=@Sex and S.Sdept=@Dept;
--end
--exec dbo.SelectSCBySdeptAgeDefault @Dept='��ѧϵ',@Sex='Ů';
--exec dbo.SelectSCBySdeptAgeDefault @Dept='��ѧϵ';

-- ��������������Ĵ洢����: �������һ��ѧ�ţ������ѧ�Ŵ��ڣ�����ʾ:��ѧ�Ŵ��ڣ�ͬʱ��ʾ��ѧ����ѧ�š���ѧ������ϵ��ѧ��������������ʾ:��ѧ�� XXXXX ������; ͬʱ��ʾȫ����Ч��ѧ���嵥
--create procedure SelectSnoBySno
--	@Sno nchar(10)
--as
--begin
--	if exists (select 1 from Student where Student.Sno=@Sno)
--	begin
--		print'��ѧ�Ŵ���';
--		select S.Sno,count(distinct S_other.Sno) as DeptNum from Student as S join Student as S_other on S.Sdept=S_other.Sdept group by S.Sno having S.Sno=@Sno;
--	end
--	else
--	begin
--		print'��ѧ��'+@Sno+'������';
--		select S.Sno from Student as S;
--	end
--end
--exec dbo.SelectSnoBySno @Sno='2021303127';
--exec dbo.SelectSnoBySno @Sno='asdfasdf';

-- ����һ���洢���̣��Ҹô洢���̴��������:������ SC ����:ѧ�š��κţ�������
  -- ���ѧ����ѧ�����в����ڣ�����ʾ: ������ѧ�� XXX ��ѧ�����в�����
  -- ����κ��ڿγ̱��в����ڣ�����ʾ: ������κ� XXX �ڿγ̱��в�����
  -- ���������ѧ����κž������ڣ�����ʾ: ������ѧ�� XXX ��ѧ�����в�������������κ� XXX �ڿγ̱���Ҳ������
  -- ���ѧ����κž����ڣ��ҳɹ����룬����ʾ: ���������Ϣ:��ѧ�� XXX�γ̺� XXX������ XX���Ѳ��뵽���С�
--create procedure InsertSCSnoCnoGrade
--	@Sno nchar(10),
--	@Cno nvarchar(50),
--	@Grade numeric(4,1)
--as
--begin
--	if not exists (select 1 from Student as S where S.Sno=@Sno) and not exists (select 1 from Course as C where C.Cno=@Cno)
--	begin
--		print'������ѧ��'+@Sno+'��ѧ�����в�������������κ�'+@Cno+'�ڿγ̱���Ҳ������'
--	end
--	else if not exists (select 1 from Student as S where S.Sno=@Sno)
--	begin
--		print'������ѧ��'+@Sno+'��ѧ�����в�����'
--	end
--	else if not exists (select 1 from Course as C where C.Cno=@Cno)
--	begin
--		print'������κ�'+@Cno+'�ڿγ̱��в�����'
--	end
--	else
--	begin
--		insert SC values (@Sno,@Cno,@Grade)
--		print'���������Ϣ:��ѧ�� '+@Sno+'�γ̺� '+@Cno+'������ '+convert(nvarchar(4), @Grade)+'���Ѳ��뵽���С�'
--	end
--end
--exec dbo.InsertSCSnoCnoGrade @Sno='2021SM007',@Cno='C003',@Grade=98.5;
--exec dbo.InsertSCSnoCnoGrade @Sno='123123',@Cno='C003',@Grade=98.5;
--exec dbo.InsertSCSnoCnoGrade @Sno='2021SM007',@Cno='123123',@Grade=98.5;
--exec dbo.InsertSCSnoCnoGrade @Sno='123123',@Cno='123123',@Grade=98.5;

-- ����һ�洢����,����ѧ����ѧ��,����ѧ����ѡ�����пγ̵ķ������� 1�֡�
--create procedure AddAllCourseGradeBySno
--	@Sno nchar(10)
--as
--begin
--	update SC set Grade=Grade+1 where SC.Sno=@Sno;
--end
--exec AddAllCourseGradeBySno @Sno = '2021303127';
--select * from SC where Sno='2021303127'

-- ����һ�����ܴ洢���̣��Ҹô洢���̴��������: �������һ��ѧ�ţ������ѧ�Ŵ��ڣ�����ʾ: ��ѧ�Ŵ��ڣ�����ʾ��ѧ����ѧ�š���������ѡ�޿γ̵Ŀγ�������ѡ�γ̵�ƽ���ɼ���������ʾ: ��ѧ�Ų�����(��ʾ��ѧ��)
--create procedure EncryptedSelectStudentInfo
--	@Sno nchar(10)
--as 
--begin
--	declare @EncryptSno varbinary(8000),@EncryptSname varbinary(8000),@EncryptCountCourse varbinary(8000),@EncryptAvgCourseGrade varbinary(8000);
--	declare @SecretPassphrase nvarchar(50) = 'MySecretPassphrase'
--	if exists (select 1 from Student as S where S.Sno=@Sno)
--	begin
--        set @EncryptSno = ENCRYPTBYPASSPHRASE(@SecretPassphrase, @Sno);
--        set @EncryptSname = ENCRYPTBYPASSPHRASE(@SecretPassphrase, convert(nvarchar(50),(select Sname from Student where Sno = @Sno)));
--        set @EncryptCountCourse = ENCRYPTBYPASSPHRASE(@SecretPassphrase, convert(nvarchar(10),(select count(*) from SC where Sno = @Sno)));
--        set @EncryptAvgCourseGrade = ENCRYPTBYPASSPHRASE(@SecretPassphrase, convert(nvarchar(10),(select avg(Grade) from SC where Sno = @Sno)));
--		--select '��ѧ�Ŵ���' as status,convert(nvarchar(100),@EncryptSno) as EncryptSno,convert(nvarchar(100),@EncryptSname) as EncryptSname,convert(nvarchar(100),@EncryptCountCourse) as EncryptCountCourse,convert(nvarchar(100),@EncryptAvgCourseGrade) as EncryptAvgCourseGrade
--        select '��ѧ�Ŵ���' as status,@EncryptSno as EncryptSno,@EncryptSname as EncryptSname,@EncryptCountCourse as EncryptCountCourse,@EncryptAvgCourseGrade as EncryptAvgCourseGrade
		
--	end
--	else
--	begin
--		print'��ѧ�Ų�����:'+@Sno;
--	end
--end
--exec EncryptedSelectStudentInfo @Sno='2021303127';
--exec EncryptedSelectStudentInfo @Sno='aaaa';

-- [ѡ��] ��������������Ĵ洢����: �������һ��ѧ�ţ������ѧ�Ŵ�������ʾ: 
-- ��ѧ�Ŵ��ڣ�����ʾ��ѧ����ѧ�š���ѡ�޿γ̵Ŀγ��������γ��嵥����ѡ�γ̵�ƽ���ɼ���
-- ��ѡ�γ̵���߷ּ���ͷ֡���ѡ�γ̲�����Ŀγ������γ��嵥(�����γ̷���)��������ʾ: ��ѧ�Ų�����(��ʾ��ѧ��)
--create procedure SelectStudentInfo
--	@Sno nchar(10)
--as 
--begin
--	if exists (select 1 from Student as S where S.Sno=@Sno)
--	begin
--		declare @CourseCount int;
--		declare @AvgGrade numeric(4,1);
--		declare @MaxGrade numeric(4,1);
--		declare @MinGrade numeric(4,1);
--		declare @DownCourseCount int;
--		set @CourseCount = (select count(distinct SC.Cno) from SC group by SC.Sno having SC.Sno=@Sno)
--		set @AvgGrade = (select avg(SC.Grade) from SC group by SC.Sno having SC.Sno=@Sno)
--		set @MaxGrade = (select max(SC.Grade) from SC group by SC.Sno having SC.Sno=@Sno)
--		set @MinGrade = (select min(SC.Grade) from SC group by SC.Sno having SC.Sno=@Sno)
--		set @DownCourseCount = (select count(distinct SC.Cno) from SC where SC.Grade<60 group by SC.Sno having SC.Sno=@Sno)
--		select @CourseCount as CourseCount,@AvgGrade as AvgGrade,@MaxGrade as MaxGrade,@MinGrade as MinGrade,@DownCourseCount as NoPassCourseCount;
--		select C.Cno,C.Cname from Course as C join SC on C.Cno=SC.Cno where SC.Sno=@Sno;
--		select C.Cno,C.Cname from Course as C join SC on C.Cno=SC.Cno where SC.Sno=@Sno and SC.Grade<60;
--	end
--	else
--	begin
--		print'��ѧ�Ų�����:'+@Sno;
--	end
--end
--exec SelectStudentInfo @Sno='2021303119';
--exec SelectStudentInfo @Sno='2021303127';

-- [ѡ��]����һ�洢���̣�����ѧ����ѧ�ţ�ɾ����ѧ����ѡ����Ϣ��ѧ�����еļ�¼��Ϣ��
-- [ѡ��]����һ�����ܴ洢���̣��Ҹô洢���̴��������: �������һ��ѧ�ţ������ѧ�Ŵ��ڣ�����ʾ: ��ѧ�Ŵ��ڣ�����ʾ��ѧ������ϵ������ѧ����ѧ�š���������ѡ�޿γ̵Ŀγ�������ѡ�γ̵�ƽ���ɼ�������ѧ�����������ʾ: ��ѧ�Ų�����(��ʾ��ѧ��)

-- �������³��õ�ϵͳ�洢����
-- Sp help
-- Sp renamedb
-- Sp rename
-- Sp who
-- Sp depends
-- Sp helptext
-- sp addapprole �����ݿ�������һ�������Ӧ�ó����ɫ
-- sp extendedproc ��ϵͳ������һ���µ���չ�洢����
-- sp addgroup �ڵ�ǰ���ݿ�������һ����
-- sp addlogin ����һ���µ� login �ʻ�
-- sp addmessage ��ϵͳ������һ���µĴ�����Ϣ
-- sp addrole �ڵ�ǰ���ݿ�������һ�˽�ɫ
-- sp addrolemember Ϊ��ǰ���ݿ��е�һ����ɫ����һ����ȫ���˻�
-- sp addsrvrolemember Ϊ�̶��ķ�������ɫ����һ����Ա
-- sp addtype ����һ���û��������������
-- sp addumpdevice ����һ���豸����
-- sp attach db �������ݿ⵽һ����������
-- sp bindefault ��ȱʡ�󶨵��л����û��������������
-- sp bingrule �ѹ���󶨵��л����û����������������
-- sp changeobjectowner �ı�����������
-- sp_column privileges �����е�Ȩ����Ϣ
-- sp_configure ��ʾ�����޸ĵ�ǰ��������ȫ������
-- sp createstats �������е�ͳ����Ϣ
-- sp cursorclose �رպ��ͷ��α�
-- sp database �г���ǰϵͳ�е����ݿ�
-- sp dboption ��ʾ���޸����ݿ�ѡ��
-- sp dbremove ɾ�����ݿ�͸����ݿ���ص��ļ�
-- sp defaultdb ���õ�½�ʻ���Ĭ�����ݿ�
-- sp delete targetservergroup ɾ��ָ��Ŀ���������
-- sp delete targetsvrgrp member ��Ŀ�����������ɾ��ָ���ķ�����
-- sp depends ��ʾ���ݿ�����������Ϣ
-- sp detach db ����������е����ݿ�
-- sp foreignkeys ���زο����ӷ������ı������������
-- sp_grantaccess �ڵ�ǰ���ݿ�������һ����ȫ���û�
-- sp grantlogin ���� NT �û���������� SOL Serversp help �����й����ݿ�������Ϣ
-- sp helpcontrain �����й�Լ��������,���Ƶ���Ϣ
-- sp helpdb ����ִ�����ݿ����ȫ�����ݿ���Ϣ
-- sp helpdbfixedrole ���ع̶��ķ�������ɫ�б�
-- sp helpdevice �����й����ݿ��ļ�����Ϣ
-- sp helpextendedproc ���ص�ǰ�������չ�洢������Ϣ
-- sp helpfile �����뵱ǰ���ݿ���ص������ļ���Ϣ
-- sp helpgroup ���ص�ǰ���ݿ��еĽ�ɫ��Ϣ
-- sp helpindex �����йر���������Ϣ
-- sp helprole ���ص�ǰ���ݿ�Ľ�ɫ��Ϣ
-- sp helprolemember ���ص�ǰ���ݿ��н�ɫ��Ա����Ϣ
-- sp helptext ��ʾ����,ȱʡ,�洢����,������,��ͼ�ȶ����δ���ܵ��ı�������Ϣ
-- sp_helptrigger ��ʾ����������sp lock �����й�������Ϣ
-- sp_primarykeys ���������е���Ϣ
-- sp recompile ʹ�洢���̺ʹ���������һ������ʱ���±���
-- sp rename �����û����������ݿ���������
-- sp renamedb �������ݿ������
-- sp revokedbaccess �ӵ�ǰ���ݿ���ɾ����ȫ���ʻ�
-- sp runwebtask ִ����ǰ�汾�ж���� WEB ��ҵ
-- sp server info ����ϵͳ�����Ժ�ƥ��ֵ
-- sp spaceused ��ʾ���ݿ�ռ��ʹ�����
-- sp statistics ���ر��е����������б�
-- sp stored procedures ���ػ��������еĴ洢�����б�
-- sp_unbinddefault ���л����û���������������н��ȱʡ�İ�
-- sp unbindrule ���л����û���������������н������İ�
-- sp validname�����Ч��ϵͳ�ʻ���Ϣ
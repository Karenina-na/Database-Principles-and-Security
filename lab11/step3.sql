use Study;

-- ��дһ��������(begin tran) ʵ�����µĲ���: 
-- ĳѧ��Ϊ��2021300647����ѧ��Ҫ�����п���B20210506001����ת��23.23 Ԫ��ѧ�š�2021302206�������п���B20210506004���С�
-- ÿһ��ת�ˣ����ֱ��� TranFlowIn �� TranFlowOut �и���¼ 1 ��ת����ˮ(һ��Ϊ������ˮ,һ��Ϊ������ˮ)��
-- ���м���ֹ�������� rollback.
-- ����:
 -- SQL �����Ѿ�����˳��ˡ�
 -- ��ʱ���������ϣ�����������δ��������������ύ���ع���
 -- SQL ����ִ�й����У�һ��һ��ִ�У��۲����ֵ(����������������ʱ�ȴ�)��

begin tran tr
begin
	-- ����׼��
	declare @ID1 nvarchar(10)='2021300647';
	declare @CID1 nchar(20) = 'B20210506001';
	declare @ID2 nvarchar(10)='2021302206';
	declare @CID2 nchar(20) = 'B20210506004';
	declare @money decimal(10,2) = 23.23;
	declare @errorSum int = 0;

	-- ��ѯ
	declare @oldMoney1 decimal(10,2);
	set @oldMoney1 = (select Money from BankCard as B where B.Sno=@ID1);
	if @oldMoney1<@money
	begin
		print @ID1+' ���㣬��ǰ���ʣ�� '+convert(varchar,@oldMoney1);
		set @errorSum=@errorSum + 1;
	end
	else if @oldMoney1 is null
	begin
		print '�˺Ų����� '+@ID1;
		set @errorSum=@errorSum + 1;
	end
	
	declare @oldMoney2 decimal(10,2);
	set @oldMoney2 = (select Money from BankCard as B where B.Sno=@ID2);
	if @oldmoney2 is null
	begin
		print '�˺Ų����� '+@ID2;
		set @errorSum=@errorSum + 1;
	end

	-- ������ˮ��¼
	insert into TranFlowIn (InID, FromID, TranMoney, Time) values
	(@CID2, @CID1, @money, getdate());
	insert into TranFlowOut (OnID, ToID, TranMoney, Time) values
	(@CID1, @CID2, @money, getdate());
	set @errorSum=@errorSum + @@error;

	-- �������
	update BankCard set Money=@oldMoney1-@money where BID=@CID1;
	update BankCard set Money=@oldMoney2+@money where BID=@CID2;

	-- ������
	if @errorSum>0
	begin
		print '��������ع�';
		rollback tran tr;
	end
	else
	begin
		print '������ɣ������ύ';
		commit tran tr;
	end
end
go
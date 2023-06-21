use Study;

-- 编写一个事务处理(begin tran) 实现如下的操作: 
-- 某学号为“2021300647”的学生要从银行卡“B20210506001”中转账23.23 元到学号“2021302206”的银行卡“B20210506004”中。
-- 每一笔转账，均分别在 TranFlowIn 和 TranFlowOut 中各记录 1 个转账流水(一个为出账流水,一个为入账流水)。
-- 若中间出现故障则进行 rollback.
-- 假设:
 -- SQL 代码已经完成了出账。
 -- 此时事务发生故障，导致事务尚未结束，结果不能提交，回滚。
 -- SQL 代码执行过程中，一步一步执行，观察变量值(可在事务中设置延时等待)。

begin tran tr
begin
	-- 变量准备
	declare @ID1 nvarchar(10)='2021300647';
	declare @CID1 nchar(20) = 'B20210506001';
	declare @ID2 nvarchar(10)='2021302206';
	declare @CID2 nchar(20) = 'B20210506004';
	declare @money decimal(10,2) = 23.23;
	declare @errorSum int = 0;

	-- 查询
	declare @oldMoney1 decimal(10,2);
	set @oldMoney1 = (select Money from BankCard as B where B.Sno=@ID1);
	if @oldMoney1<@money
	begin
		print @ID1+' 余额不足，当前余额剩余 '+convert(varchar,@oldMoney1);
		set @errorSum=@errorSum + 1;
	end
	else if @oldMoney1 is null
	begin
		print '账号不存在 '+@ID1;
		set @errorSum=@errorSum + 1;
	end
	
	declare @oldMoney2 decimal(10,2);
	set @oldMoney2 = (select Money from BankCard as B where B.Sno=@ID2);
	if @oldmoney2 is null
	begin
		print '账号不存在 '+@ID2;
		set @errorSum=@errorSum + 1;
	end

	-- 插入流水记录
	insert into TranFlowIn (InID, FromID, TranMoney, Time) values
	(@CID2, @CID1, @money, getdate());
	insert into TranFlowOut (OnID, ToID, TranMoney, Time) values
	(@CID1, @CID2, @money, getdate());
	set @errorSum=@errorSum + @@error;

	-- 设置余额
	update BankCard set Money=@oldMoney1-@money where BID=@CID1;
	update BankCard set Money=@oldMoney2+@money where BID=@CID2;

	-- 错误处理
	if @errorSum>0
	begin
		print '错误，事务回滚';
		rollback tran tr;
	end
	else
	begin
		print '操作完成，事务提交';
		commit tran tr;
	end
end
go
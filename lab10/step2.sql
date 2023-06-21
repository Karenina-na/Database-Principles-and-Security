-- 使用数据库
--use SchoolManager;

-- 使用约束强制列数据的完整性 (唯一性约束、CHECK 约束、DEFAULT 约束)
-- 创建学生关系表 S，学号 Sno 为主键，同时为姓名 Sname 字段建立唯一性约束。
--create table S (
--   Sno nchar(10) primary key,
--   Sname nchar(10) constraint Sname_unique unique,
--   Ssex nvarchar(1),
--   Sage smallint,
--   Sdept nvarchar(50),
--   Scholarship nvarchar(50),
--);

-- 创建好S 后，修改 S 表，取消姓名 Sname 的唯一性约束
--alter table S drop constraint Sname_unique;

-- 再次修改 S 表，增加姓名 Sname 的唯一性约束。
--alter table S add constraint Sname_unique unique(Sname);

-- 创建课程关系表 C,课程号 Cno 为主键，同时要求为学分 Ccredit 字段创建 CHECK约束，使 15>=Ccredit>0。
--create table C (
--	Cno nvarchar(50) primary key,
--	Cname nvarchar(50),
--	CCredit numeric(3,1) constraint CCredit_check check(CCredit>=0 and CCredit<=15),
--	Cpno nvarchar(10),
--);

-- 创建好C 后，修改 C表，禁止学分 Ccredit 的 CHECK 约束
--alter table C nocheck constraint CCredit_check;

-- 再次修改 C表，启用学分 Ccredit 的 CHECK 约束。
--alter table C check constraint CCredit_check;

-- 创建选修关系表 SC，课程号 Cno 和学分号 Cno 共同构成主键，同时要求为成绩 Grade 字段创建 Default 约束，使成绩 Grade 的缺省默认值为 60 分。
--create table SC (
--	Sno nchar(10),
--	Cno nvarchar(50),
--	Grade numeric(4,1) constraint Grade_default default(60),
--	primary key (Sno,Cno),
--);

-- 创建好SC 后，修改 SC 表，取消成绩 Grade 的 Default 约束。
--alter table SC drop constraint Grade_default;

-- 再次修改 SC 表，增加成绩 Grade 的 Default 约束，使成绩 Grade 的缺省默认值i为0分。
--alter table SC add constraint Grade_default default (0) for Grade;

-- 使用规则，实施数据完整性
-- 创建规则 Grade Rule: 限制取值为0到100; 创建规则 Ssex Rule: 限制取值为('M'，F'); 
-- 创建规则 Sno Rule: 总共 10 位字，限制第 1~2 位为字母(a~z)，第 3 位取字母-，其余为数字(0-9);
--create rule Grade_Rule as @Grade between 0 and 100;
--create rule Ssex_Rule as @Ssex in ('M','F');
--create rule Sno_Rule as @Sno like '[a-z][a-z]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

-- 将 Grade Rule 规则绑定到 SC 表 Grade 列; 将 Ssex Rule 规则绑定到 S 表的 Ssex 列; 将 Sno Rule 分别绑定到 S 表的 Sno 列和 C表的 Cno 列。
--exec sp_bindrule 'Grade_Rule' , 'SC.Grade';
--exec sp_bindrule 'Ssex_Rule' , 'S.Ssex';
--exec sp_bindrule 'Sno_Rule' , 'S.Sno';
--exec sp_bindrule 'Sno_Rule' , 'C.Cno';

-- 以上绑定规则的各列，如果在表定义时，就已定义了 CHECK/DEFAULT 等约束，绑定规则会是怎样的情况? 请列举各种可能的情况，并加以验证，根据实验结果.总结相应的实验结论。
-- 当绑定规则与表定义中的约束同时存在时，规则会进一步强化约束条件，提供额外的数据完整性保护。在验证和实验中，违反了规则或约束的插入操作都会失败，确保数据的完整性和一致性。

-- 绑定规则后，分别进行数据的插入，验证绑定规则的有效性
--insert into SC (Sno,Cno,Grade) values('123','123',-1);
--insert into SC (Sno,Cno,Grade) values('123','123',101);
--insert into SC (Sno,Cno,Grade) values('1','1',50);
--insert into S (Sno,Ssex) values('a','M');
--insert into S (Sno,Ssex) values('ab-12','e');
--insert into S (Sno,Ssex) values('ab-1111111','M');

-- 将绑定到 SC 表 grade 列的规则 Grade Rule，予以松绑。
--exec sp_unbindrule 'SC.Grade' , 'Grade_Rule';

-- 规则松绑后，再次进行数据的插入予以验证。
--insert into SC values ('123','123',-100);

-- 删除 Grade Rule 规则。
--drop rule Grade_Rule;

-- 使用默认值，实施数据完整性
-- 创建默认值 Sage Default，取值为 20；创建默认值 Ssex Default 1，取值为'M'；创建默认值 Ssex Default 2，取值为'男
--create default Sage_default as 20;
--create default Ssex_default_1 as 'M';
--create default Ssex_default_2 as '男';

-- 将 Sage Default 绑定到 S 表Sage 列;将 Ssex Default 1 绑定到 S表 Ssex 列。
--exec sp_bindefault 'Sage_default' , 'S.Sage';
--exec sp_bindefault 'Ssex_default_1' , 'S.Ssex';

-- 绑定默认值之后，分别进行数据的插入，验证绑定默认值的有效性。
--insert into S(Sno) values ('ab-9999999');
--select * from S;

-- 将绑定到 S表 Ssex 列的默认值 Ssex Default 1，予以松绑。
--exec sp_unbindefault 'S.Ssex' , 'Ssex_default_1';

-- 删除 Ssex Default 1默认值
--drop default Ssex_default_1;

-- 再试着将 Ssex Default 2 默认值绑定到 S 表Ssex 列(该列同时存在 Ssex Rule绑定)，观察有什么结果?
--exec sp_bindefault 'Ssex_default_2' , 'S.Ssex';
--insert into S(Sno) values ('ab-9999999');
--select * from S;

-- 以上绑定默认的各列，如果在表定义时，就已定义了 CHECK/DEFAULT 等约束，绑定默认值会是怎样的情况? 请列举各种可能的情况，并加以验证,根据实验结果总结相应的实验结论。
-- 当绑定规则与表定义中的约束同时存在时，约束条件会叠加，且以最严格的约束条件为准。无论是约束条件还是绑定的规则，只要插入操作违反了约束条件，都会导致插入失败，从而保证了数据的完整性和一致性。

-- 思考总结
-- 假设:表中的列，在表定义时，先不建立约束，而是通过绑定默认值/规则来实a施数据完整性。
-- 如果:再修改表，对表的各列进行主键、外键、UNIQUE、CHECK、DEFAULT、NOT6、NULL 等约束的定义，会出现怎样的情况? 请列举各种可能的情况，并加以验证，根据实验结果，总结相应的实验结论。
-- 当列通过绑定默认值/规则来实施数据完整性后，再对表的列进行主键、外键、UNIQUE、CHECK、DEFAULT、NOT NULL等约束的定义时，这些约束会与默认值/规则共同起作用。插入操作将同时受到约束和默认值/规则的限制，确保数据的完整性和一致性。
-- ʹ�����ݿ�
use MY_DBMS;

-- ѧ��
insert into Student (StudentID, Name, Gender, BirthDate, Address, PhoneNumber, Email, Height, Weight, Photo, Introduction, Memo, Money, CreditCard) values 
(1, '����', '��', '2000-01-01', '�����г�����', '13812345678', 'zhangsan@example.com', 175.0, 70.0, 0x0123456789abcdef, '���������ļ��', N'���������ı���¼', 100.50, 500.00);

-- �γ�
insert into Course (CourseID, Name, Credit, Teacher, Description, Time, EndTime, ContinueTime, Type, Memo) values
(1, '���ݿ�ԭ��', 3, '����ʦ', '���γ̽������ݿ�Ļ����������ģ�͡���ϵ������SQL�����Լ����ݿ����ϵͳ��ʵ��ԭ��', '2022-09-01 08:30:00', '2022-12-31 16:30:00', '01:30:00.000', 0x0123456789abcdef, N'���γ̵��ڿμƻ����£�\n��1�ܣ����ݿ�����������ϵ�ṹ\n��2�ܣ���ϵ������SQL����\n��3�ܣ�����ģ�ͺ����\n��4�ܣ����ݿ����ϵͳ��ʵ��ԭ��\n');

-- ѡ�α�
insert into SC (StudentID, CourseID, ScoreNormal, ScoreExam, ExamDate, Type) values
(1234567890, 1, 88.5, 90.0, '2022-12-18 09:00:00.000', 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef);
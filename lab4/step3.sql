-- ʹ�����ݿ�
use MY_DBMS;

-- �����������ݽ������ݿ�
-- ѧ����
insert into Student(Sno,Sname,Ssex,Sage,Sdept,Sbirth) values
('001', 'Alice', 'F', 20, 'Computer Science', '2000-01-01'),
('002', 'Bob', 'M', 21, 'Mathematics', '1999-05-10'),
('003', 'Charlie', 'M', 19, 'Physics', '2002-03-15'),
('004', 'Diana', 'F', 22, 'Chemistry', '1998-09-20'),
('005', 'Eve', 'F', 20, 'Biology', '2001-11-30');

-- �γ̱�
insert into Course (Cno,Cname,CCredit,Cpno,CRemark) values
('C001', 'Math 101', 3.0, NULL, 'Introduction to Mathematics'),
('C002', 'Physics 201', 4.5, NULL, 'Advanced Physics'),
('C003', 'Chemistry 101', 3.5, NULL, 'Basic Chemistry'),
('C004', 'Biology 301', 4.0, NULL, 'Advanced Biology'),
('C005', 'Computer Science 101', 3.0, NULL, 'Introduction to Computer Science');

-- ѡ�α�ע�������Sno��Cno������Student��Course���д�������
insert into SC(Sno,Cno,Grade) values
('001', 'C001', 85.5),
('001', 'C002', 90.0),
('002', 'C002', 78.5),
('003', 'C003', 92.0),
('004', 'C004', 88.5);


select * from Student;
select * from Course;
select * from SC;
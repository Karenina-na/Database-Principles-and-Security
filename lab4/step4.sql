-- 使用数据库
use MY_DBMS;

-- 插入十条内容进入数据库
-- 学生表
insert into Student(Sno,Sname,Ssex,Sage,Sdept,Sbirth) values
('006', 'Frank', 'M', 21, 'Computer Science', '2000-06-05'),
('007', 'Grace', 'F', 19, 'Mathematics', '2004-02-18'),
('008', 'Henry', 'M', 20, 'Physics', '2001-09-12'),
('009', 'Ivy', 'F', 22, 'Chemistry', '1999-04-25'),
('010', 'Jack', 'M', 21, 'Biology', '2000-12-08'),
('011', 'Kelly', 'F', 19, 'Computer Science', '2002-07-15'),
('012', 'Leo', 'M', 20, 'Mathematics', '1998-11-28'),
('013', 'Megan', 'F', 22, 'Physics', '2001-06-03'),
('014', 'Nathan', 'M', 19, 'Chemistry', '2003-03-19'),
('015', 'Olivia', 'F', 20, 'Biology', '2002-10-14');

-- 课程表
insert into Course (Cno,Cname,CCredit,Cpno,CRemark) values
('C006', 'English 101', 3.0, NULL, 'Introduction to English'),
('C007', 'History 201', 4.5, NULL, 'Advanced History'),
('C008', 'Art 101', 3.5, NULL, 'Basic Art'),
('C009', 'Music 301', 4.0, NULL, 'Advanced Music'),
('C010', 'Psychology 101', 3.0, NULL, 'Introduction to Psychology'),
('C011', 'Economics 101', 3.5, NULL, 'Introduction to Economics'),
('C012', 'Geography 201', 4.0, NULL, 'Advanced Geography'),
('C013', 'Sociology 101', 3.0, NULL, 'Introduction to Sociology'),
('C014', 'Political Science 301', 4.5, NULL, 'Advanced Political Science'),
('C015', 'Literature 101', 3.0, NULL, 'Introduction to Literature');

-- 选课表，注意这里的Sno和Cno必须在Student和Course表中存在数据
insert into SC(Sno,Cno,Grade) values
('005', 'C001', 91.5),
('005', 'C002', 87.0),
('006', 'C002', 82.5),
('007', 'C003', 89.0),
('008', 'C004', 94.5),
('009', 'C001', 88.0),
('009', 'C003', 95.0),
('010', 'C004', 79.5),
('011', 'C002', 93.0),
('012', 'C004', 86.5);


select * from Student;
select * from Course;
select * from SC;
create database mydb2;
use mydb2;

create table TB_Student(
    student_id int auto_increment primary key,
    student_name varchar(100) not null
);

insert into TB_Student values
(1,'홍길동'),
(2,'전우치');

create table TB_Class(
    class_id int auto_increment,
    class_name varchar(100),
    teacher varchar(100) not null,
    primary key(class_id)
);

insert into TB_Class values
(1,'수학','신사임당'),
(2,'국어','세종대왕');

-- 학생과 수업 테이블은 N:M 관계가 된다.
-- 중간 테이블 설계 (수강 등록 테이블)

create table TB_Registration(
    student_id int,
    class_id int,
    registration_date date,
    primary key(student_id, class_id),
	foreign key(student_id) references TB_Student(student_id),
    foreign key(class_id) references TB_Class(Class_id)
);

insert into TB_Registration values
(1,2,'2024-01-01'),
(2,1,'2024-06-06');

desc TB_Registration;
select*from TB_Student;
select*from TB_Registration;
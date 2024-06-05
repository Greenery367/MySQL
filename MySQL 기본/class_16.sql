use mydb2;

create table tb_grade(
    grade char(1) primary key,
    score int
);

create table tb_stduent(
    no int not null primary key,
    name varchar(2) not null,
    gender enum('F','M') not null,
    grade char(1),
    foreign key(grade) references tb_grade(grade)
);

-- 테이블은 정보의 최소 단위이다.
select*from tb_grade;
insert into tb_grade values ('A',100);
insert into tb_grade values ('B',80);
insert into tb_grade values ('C',60);
insert into tb_grade values ('D',40);
insert into tb_grade values ('E',20);
insert into tb_grade values ('F',0);

-- 오류 발생. 아래에서 스키마 추가
-- insert into tb_stduent(no,name,gender,grade,age) values(100,'길동','F','B',25);
-- 스키마 구조 변경이 필요하다. 
-- 스키마= 테이블 구조, 제약사항

alter table tb_stduent drop agr;
alter table tb_stduent add age int;
insert into tb_stduent(no,name,gender,grade,age)
	values(101,'길동','F','B',25);
insert into tb_stduent(no,name,gender,grade,age)
	values(102,'둘리','M','C',21);
insert into tb_stduent(no,name,gender,grade,age)
	values(103,'도너','F','D',23);
insert into tb_stduent(no,name,gender,grade,age)
	values(104,'뿌까','M','E',24);
 select*from tb_stduent;

-- JOIN 연산에 ON 절 사용 안해보기!!
-- 크로스 JOIN이 된다.
select*
from tb_stduent
join tb_grade;

select*
from tb_grade 
join tb_stduent;

-- JOIN 연산은 가능한 ON 절과 함께 사용하자.
-- JOIN 연산에는 --> INNER/OUTER
-- -> INNER JOIN: 그냥 JOIN

-- 1 단계 쿼리
select *
from tb_stduent
join tb_grade
on tb_stduent.grade=tb_grade.grade;

-- 2 단계 쿼리 : 필요한 부분만 가져오기
select s.no, s.name, s.grade, s.age, s.score
from tb_stduent as s
join tb_grade as g
on s.grade=g.grade;



use employees;

create table worker(
	id int primary key auto_increment,
	name varchar(20) not null,
    hire_date date
);

drop table salary;
create table salary(
	id int primary key auto_increment,
    name varchar(20) not null,
	salary int not null
);

insert into worker values (1,'홍길동', '2024-01-01');
insert into worker values (2,'도우너', '2024-03-05');
insert into worker values (3,'둘리', '2022-07-11');
insert into worker values (4,'또치', '2020-01-31');
insert into worker values (5,'뿌까', '2019-05-06');

insert into salary values(1,'홍길동','2000000');
insert into salary values(2,'도우너','2200000');
insert into salary values(3,'둘리','3000000');
insert into salary values(4,'또치','3400000');
insert into salary values(5,'뿌까','3000000');

 -- ON 절 사용하지 않고 JOIN해보기
 select *
 from worker
 join salary;
 
 select *
 from salary
 join worker;
 
 -- department 컬럼을 salary에 추가해보기
 alter table salary add department varchar(20);
 
 -- INNER JOIN
 select *
 from worker
 join salary on worker.name=salary.name;
 
 select worker.id, worker.name, worker.hire_date
 from worker
 join salary
 on worker.name =salary.name;
 
 
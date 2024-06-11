-- 테이블 생성

use mydb2;
create table employees(
    employee_id int,
    employee_name varchar(255),
    employee_phone varchar(20),
    manager_id int,
    primary key(employee_id)
);

insert into employees 
	values(1,'홍길동','010-1111-1111',null),
    (2,'이순신','010-2222-2222',1),
    (3,'유관순','010-3333-3333',1),
    (4,'야스오','010-4444-4444',2);

select*from  employees;

-- self join
select e.employee_name as 직원이름,
		e.employee_phone as 직원연락처,
        m.employee_name as 상급자명,
        m.employee_phone as 상급자연락처
from employees as e
left join employees as m
on e.manager_id=m.employee_id;
-- JOIN 조건절을 사용할 때 pk값을 잘 확인하자!
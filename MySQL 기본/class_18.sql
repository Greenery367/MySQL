use employees;

-- employees 
-- 의미 있는 결과 집합을 만들자 (크로스 조인 사용 x)
-- 단, INNER JOIN, LEFT JOIN, RIGHT JOIN을 사용해야한다!

desc salaries;
desc departments;
desc employees;

-- emp_no

select *
from employees as e
left join salaries as s
on e.emp_no =s.emp_no;

select *
from employees 
join salaries;


-- 문제. employees 테이블에 salaries 컬럼을 추가하고, salaries 테이블의 salaries 컬럼과 join해보자.
alter table employees add salary int;
select *
from employees
left join salaries
on employees.salary =salaries.salary;
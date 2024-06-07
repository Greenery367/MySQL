

use mydb2;
use employees;
-- 40 년차 이상인 직원들 명예 퇴직을 위해 조회하시오
select*from employees;
select first_name, hire_date,
	year(Current_date)-year(hire_date)+1 as '연차'
    from employees
    where (year(Current_date)-year(hire_date)+1)>38;

select*from employees;
select*from salary;
select*from worker;

select AVG(hire_date) from employees;
select AVG(hire_date), name, id from employees;

select department, count(*) as '직원 수', sum(salary) as '급여'
from employees
group by department;

select*,count(emp_no) as '부서별 직원 수'
from dept_emp
group by dept_no;

select concat('Mr/Ms ',upper(last_name)) as '이름' from employees;

select*from dept_manager;

use employees;
select emp_no,concat(first_name,last_name) as '이름' 
	from employees
	where (year(current_date)-year(hire_date)+1)>39;
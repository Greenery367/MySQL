

select*from dept_emp;
select*from departments;
select*from salaries;

-- 문제 1. 마케팅 부서의 직원들을 입사 순서대로 오름차순 정렬하시오.
-- 출력해야 할 것: 직원의 이름, 고용일, 부서
select e.first_name, e.hire_date, de.dept_name
from employees as e
left join dept_emp as d
on e.emp_no=d.emp_no
left join departments as de
on d.dept_no=de.dept_no
where de.dept_no='d001'
order by e.hire_date desc;

-- 문제 2. 부서별로 가장 높은 임금과 평균 임금을 함께 출력하시오.
-- 이 때, 평균 임금은 소수점을 제거하고 출력하시오.
select d.dept_name, s.salary, round(avg(s.salary)),max(s.salary)
from dept_emp as e
left join departments as d
on e.dept_no=d.dept_no
left join salaries as s
on e.emp_no=s.emp_no
group by d.dept_no;

use employees;
select*from employees;
select*from titles;
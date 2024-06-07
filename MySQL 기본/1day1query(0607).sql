
use employees;
select*from salaries;
select*from employees;
select*from dept_emp;
select*from departments;
select*from titles;
select*from dept_manager;

-- 문제 1.전직원 2000년도의 연봉을 출력하세요
select e.emp_no,e.first_name,e.last_name,s.salary
from employees as e
join salaries as s
on e.emp_no=s.emp_no
where s.from_date like '2000%';

-- 문제 2. 'd004'  부서의 남자직원의 이름을 출력하세요 
select e.first_name
from employees as e
join dept_emp as d
on e.emp_no=d.emp_no
where d.dept_no='d004';

-- 문제 3. 아직 재직중인 사람의 이름과 성 직급 입사일자를 출력해 보자.
select e.first_name, e.last_name, t.title, e.hire_date
from employees as e
join titles as t
on e.emp_no=t.emp_no
where t.to_date='9999-01-01';

-- 문제 4. 부서 매니저들의 평균 연봉을 추출해보자.
select AVG(s.salary)
from dept_manager as m
join salaries as s
on m.emp_no=s.emp_no;

-- 문제 5. 각 직원들의 정보를 확인하기
select*
from employees as e
left join dept_emp as de
on e.emp_no=de.emp_no
left join departments as d
on de.dept_no=d.dept_no;

-- 문제 6. 1990년 이상 입사자 이름과 급여 부서 직책
select e.first_name,s.salary,d.dept_no,t.title
from employees as e
left join salaries as s
on e.emp_no=s.emp_no
left join titles as t
on e.emp_no=t.emp_no
left join dept_emp as d
on e.emp_no=d.emp_no
where t.from_date>'1990-01-01';

-- 문제 7. 전 직원 2000년도 연봉을 출력해보자.
select e.first_name, s.salary
from employees as e
left join salaries as s
on e.emp_no=s.emp_no
where s.from_date>'2000-01-01' and s.from_date<'2001-01-01';

-- 문제 8. 'd004'  부서의 남자직원의 이름을 출력하세요 
select e.first_name,e.gender,d.dept_no
from employees as e
left join dept_emp as d
on e.emp_no=d.emp_no
where e.gender='M';

-- 문제 9. 부서 매니저의 연봉이 100,000 달러 이상인 사람 확인하시오




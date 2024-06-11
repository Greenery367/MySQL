use employees;
desc dept_manager;
desc salaries;
desc employees;
select 

-- 9. 부서 매니저의 연봉이 100,000 달러 이상인 사람 확인하시오 (출력예시 : 사원번호,입사날짜,연봉)
select dm.emp_no,dm.from_date,s.salary
from dept_manager as dm
left join salaries as s
on dm.emp_no=s.emp_no
where s.salary>100000;

-- 10. 8월 15일에 고용한 직원들의 사원 번호, 고용 날짜와 last_name을 조회하시오

select e.emp_no,e.hire_date,e.last_name
from employees as e
where e.hire_date like '%-08-15';

-- 11	현재 근무중인 매니저들의 사번, 이름, 성별, 생년월일, 최근 급여를 나타내세요
select e.emp_no,e.first_name,e.gender,e.birth_date,s.salary
from employees as e
left join on salaries as s
on e.emp_no=s.emp_no
left join on dept_manager as m
on e.emp_no=m.emp_no
where 
use mydb2;

select*from employees;
select*from titles;
select*from dept_emp;
select*from departments;
select*from dept_manager;

-- 문제 : 재직 중인 사원들 중, 가장 오래 재직중인 직원 5명의 이름, 직함, 연봉을 출력하시오.
select e.first_name,t.title,s.salary,e.hire_date
from employees as e
left join titles as t
on e.emp_no=t.emp_no
join salaries as s
on e.emp_no=s.emp_no
group by e.first_name
order by e.hire_date
limit 0,5;

-- 문제 1.
-- 재직중이고 현재 연봉이 100000 이상인 직원수가 가장 많은 3개 부서를 출력하세요
-- 부서, 고소득직원수

select d.dept_name, count(*) as 고소득직원수
from dept_emp as de
left join salaries as s
on de.emp_no=s.emp_no
left join departments as d
on de.dept_no=d.dept_no
where de.to_date='9999-01-01' and s.salary>100000
group by d.dept_name
order by count(*) desc
limit 3;

select d.dept_name,count(*)
from dept_emp as de
left join departments as d
on de.dept_no=d.dept_no
group by d.dept_name
order by count(*) desc
limit 1;

select de.dept_name ,em.first_name, year(now()) - year(dt.from_date) as 년차
from employees em
join dept_emp dt on em.emp_no = dt.emp_no
left join departments de on dt.dept_no = de.dept_no
where dt.to_date = '9999-01-01' and de.dept_name = 'Development'
order by 년차 desc
limit 5;


-- 문제 4. Development 부서중 년차가 가장  5 명 출력해 퇴시키시오(재직 중 인원중)
select e.first_name, year(now()) - year(de.from_date) as 년차, d.dept_name
from dept_emp as de
left join departments as d
on de.dept_no=d.dept_no
left join employees as e
on de.emp_no=e.emp_no
where de.dept_no='d005' and de.to_date='9999-01-01'
order by 년차 desc
limit 5;

-- 현재 재직중인 사람들의 부서 이름,소수점없는 평균연봉을 구하시오
select e.first_name,d.dept_name,round(avg(s.salary)) as 연봉
from employees as e
left join dept_emp as de
on e.emp_no=de.emp_no
join salaries as s
on e.emp_no=s.emp_no
join departments as d
on de.dept_no=d.dept_no
where de.to_date='9999-01-01'
group by d.first_name
order by 연봉 desc;

-- 생일에 입사한 사람을 모두 조회하라
select *
from employees as e
where month(e.birth_date)=month(e.hire_date)
and day(e.birth_date)=day(e.hire_date);

-- 낮은 번호대로 각 부서의 역대 매니저와 현 매니저의 수를 구하고 그 매니저들의 평균 급여를 구해라.
-- 출력 예시 - 부서 번호, 부서 이름, 인원수, 평균 급여
select d.dept_no,d.dept_name, count(distinct dm.to_date='9999-01-01') as '현 매니저 수',
avg(s.salary) as '평균 연봉'
from dept_manager as dm
left join employees as e
on dm.emp_no=e.emp_no
left join departments as d
on dm.dept_no=d.dept_no
left join salaries as s
on dm.emp_no=s.emp_no
where dm.emp_no=e.emp_no
group by dm.dept_no;

select d.dept_no as '부서 번호', d.dept_name as '부서 이름' ,
count(distinct dm.emp_no) as '인원수', round(avg(s.salary)) as '평균 급여'
from departments as d
left join dept_manager as dm
on d.dept_no = dm.dept_no
left join salaries as s
on dm.emp_no = s.emp_no
group by d.dept_name
order by d.dept_no asc;
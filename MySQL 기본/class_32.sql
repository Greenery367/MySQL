use employees;
select*from salaries;
select*from employees;
select*from dept_emp;
select*from titles;

-- 문제 1.
select e.first_name, round(s.salary), (year(now()) - year(d.from_date) + 1) as '근무 년수'
from employees as e
left join salaries as s
on e.emp_no=s.emp_no
left join dept_emp as d
on e.emp_no=d.emp_no
left join departments as dp
on d.dept_no=dp.dept_no
limit 0,3;


-- 문제 2
select date_format(e.birth_date,"%m") as birth_month, count(date_format(e.birth_date,"%m"))
from employees as e
group by date_format(e.birth_date,"%m")
order by birth_month;

-- 문제 3.
select dp.dept_name, round(avg(s.salary)) as 부서평균,
case 
when round(avg(s.salary))>60000 then 'High'
when round(avg(s.salary))<60000 then 'low' end as '급여수준'
from employees as e
left join salaries as s
on e.emp_no=s.emp_no
join dept_emp as d
on e.emp_no=d.emp_no
left join departments as dp
on d.dept_no=dp.dept_no
group by dept_name
order by 부서평균 desc;

-- 문제 4,
select d.dept_name, count(e.emp_no)
from dept_emp as e
left join salaries as s
on e.emp_no=s.emp_no
left join departments as d
on e.dept_no=d.dept_no
group by d.dept_name;

-- 문제 5.
select e.emp_no,e.first_name,avg(s.salary) as 평균연봉
from employees as e
left join salaries as s
on e.emp_no=s.emp_no
where 평균연봉>80000
group by e.emp_no
order by s.salary desc;

select e.emp_no, e.last_name, avg(s.salary) as 급여평균
from employees as e
left join salaries as s
on e.emp_no  = s.emp_no
having 급여평균 > 80000;


-- 문제 6
select e.first_name,round(avg(s.salary))
from employees as e
left join salaries as s
on e.emp_no=s.emp_no
group by e.emp_no
having avg(salary)>=(select avg(salary) from salaries)
order by salary;

-- 문제 7.
select d.dept_name,count(*)
from dept_emp as de
left join departments as d
on de.dept_no=d.dept_no
group by d.dept_name
order by count(*)
limit 0,3;

-- 문제 8.
select de.dept_no,e.emp_no,e.hire_date,e.last_name,e.first_name,e.gender
from employees as e
left join dept_emp as de
on e.emp_no=de.emp_no
group by e.emp_no
having e.gender='M';

-- 문제 9.
select e.emp_no,e.first_name,e.last_name ,t.title
from employees as e
left join titles as t
on e.emp_no=t.emp_no
group by e.emp_no
having t.title='Engineer' and t.title='Senior Engineer';
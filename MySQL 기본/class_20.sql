

use employees;

desc dept_emp;
desc departments;
desc salaries;
desc dept_manager;

select*from dept_manager;
select*from dept_emp;
select*from salaries;
select*from employees;
select*from departments;

-- 1. 현재 근무중인 매니저들의 사번, 이름, 성별, 생년월일, 최근 급여를 나타내세요
select*
from employees
left join salaries
on employees.emp_no=salaries.emp_no
left join dept_manager
on employees.emp_no=dept_manager.emp_no
where dept_manager.to_date='9999-01-01' and salaries.to_date='9999-01-01';

-- 3. 전직원 2000년도의 연봉을 출력하세요(출력 예시 : id , firstname, lastname,slalary)


각 직원의 정보를 확인하기 (직원번호, 생년월일, 이름, 성,부서번호, 부서명, 직업명)
1990년 이상 입사자 이름과 급여 부서 직책
아직 재직중인 사람의 이름과 성 직급 입사일자를 출력해 보자.
부서 매니저들의 평균 연봉을 추출해 보자.
'd004' 부서의 남자직원의 이름을 출력하세요 (출력예시 : firstname , M , 'd004' )
employees 테이블에 salary 컬럼을 추가하고, salaries 테이블의 salary 컬럼과 join해보자.
퇴사한 기술부서 전체 인원을 출력해주세요
현재 재직중인 사람중 입사일이 1991-10-10 인 사람의 부서를찾아주세요
아직까지 일하고있는 사람중에 남자가 몇명인지 알아보자
시니어 엔지니어의 월급중 6만달러가 넘는 사람이 몇명인지 알아보자
마케팅 부서에 속하는 사람 중 퇴사한 사람들의 명단을 만들어 보자.
전체 노동자의 사원 번호와 이름,연봉을 나타내주세요.
부서 매니저의 연봉이 100,000 달러 이상인 사람 확인하시오 (출력예시 : 사원번호,입사날짜,연봉)
8월 15일에 고용한 직원들에게 태극기를 지급하기로 했다.
사원 번호, 고용 날짜와 last_name을 조회하시오


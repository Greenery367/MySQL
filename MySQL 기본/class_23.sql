-- 문자열 함수 문제
-- 문제 3. 모든직원의 이름을 대문자로 변환하고, 이름 앞에 'Mr/Ms'를 추가하세요

use mydb2;
select concat('Mr/Ms',upper(name)) as '이름' from employee;

use employees;
select*from employees;

-- first_name에 끝 3글자 까지만 결과집합으로 출력하세요.
select substring(upper(first_name),-3,3) as '이름' from employees;

-- 문제 5. 직원 이름에서 첫 2글자만 추출하세요.
select substring(name,2,2) as '이름' from employee;

select substring(name,1,1) as '이름' from employee;


-- 문제 5: 각 직원에 대한 급여가 3백만원 이상이면 'High', 이하라면 'LOW'라고 표시하세요.
select name,salary,
	case when salary>=3000000 then 'High' else 'Low' end as'평가'
from employee;

-- 날짜 및 시간 함수 문제
-- 문제 6. 오늘 날짜를 반환하세요.
select CURRENT_date as today;
select '안녕 반가워' as a;

-- 문제 7. 각 직원이 고용된 날로부터 몇 년이 지났는지 계산하세요
select*from employee;
select name, hire_date, 
	year(Current_date)-year(hire_date)+1 as '연차' 
	from employee;


-- 문제 8. 각 직원의 고용 월을 반환하세요.
select*from employee;
select name, extract(month from hire_date) as hire_month
from employee;
	
-- 문제 9. 각 직원의 급여를 문자열 형태로 표시하세요.
select name, cast(salary as char) as salary_text
from employee;

-- 문제 10. 문자열로 저장된 날짜 '2024-06-07'을 Date 타입으로 변환하세요.
select cast('2024-06-07' as Date) as date;
use mysb3;

CREATE TABLE tb_employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

INSERT INTO tb_employees (name, department, salary) VALUES
('John Doe', 'Sales', 48000000),
('Jane Smith', 'Sales', 55000000),
('Alice Johnson', 'Marketing', 50000000),
('Chris Lee', 'Marketing', 45000000),
('Bob Brown', 'HR', 35000000),
('Patricia Pink', 'HR', 40000000),
('Michael White', 'Engineering', 75000000),
('Anna Black', 'Engineering', 65000000),
('Linda Green', 'Engineering', 72000000),
('James Red', 'Engineering', 68000000),
('Larry Blue', 'Sales', 52000000),
('Jessica Purple', 'Sales', 51000000),
('Amber Yelow', 'Marketing', 47000000),
('Peter Orange', 'HR', 43000000),
('Lisa Teal', 'HR', 39000000);

-- 문제 1.
-- 각 부서별 평균 급여 계산하기 (소수점 제거)
select department,round(avg(salary))
from tb_employees
group by department;

-- 문제 2.
-- 평균 급여가 50000000 금액 이상인 부서 찾기
select department,avg(salary)
from tb_employees
group by department
having avg(salary)>50000000;

-- 문제 3.
-- 각 부서에서 가장 높은 급여를 받는 직원의 급여 출력하기
select department, max(salary),min(salary)
from tb_employees
group by department;

-- 문제 4.
-- 특정 부서에서 근무하는 직원 수가 3명 이상인 부서만 출력해주세요.
select department, count(department)
from tb_employees
group by department
having count(department)>=3;

-- 문제 5.
-- 각 부서별 평균 급여와 직원 수를 출력해주세요.
select department, round(avg(salary)),count(department)
from tb_employees
group by department;

-- order by와 limit 그리고 offset
select id, name, class, score
from tb_student
limit 6,3
-- (3,3) 
-- 3: offset(몇 번째부터 시작할까?)
-- 3: limit(몇 개 까지 제한할까?)

CREATE TABLE subject (
  subject_id INT AUTO_INCREMENT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);


CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  address VARCHAR(100) NOT NULL
);

-- subject 테이블 샘플 데이터 

INSERT INTO subject (subject_id, subject_name, credit, department, professor)
VALUES
(1, '영어회화', 3, '외국어학과', '김영희'),
(2, '프로그래밍 기초', 3, '컴퓨터공학과', '박철수'),
(3, '데이터베이스 개론', 3, '컴퓨터공학과', '이승호'),
(4, '컴퓨터 시스템 개론', 3, '컴퓨터공학과', '홍길동'),
(5, '선형대수학', 3, '수학과', '김영수'),
(6, '미적분학', 3, '수학과', '박순영'),
(7, '국어문학사', 3, '국어국문학과', '최지혜'),
(8, '국어문법론', 3, '국어국문학과', '이상호'),
(9, '일본어회화', 3, '외국어학과', '김현진'),
(10, '중국어학', 3, '외국어학과', '최영식'),
(11, '미국사', 3, '사학과', '박영진');


-- customer 샘플 데이터 

INSERT INTO customer (id, name, email, address) VALUES
(1, '김철수', 'kim@example.com', '서울시 강남구'),
(2, '박영희', 'park@example.com', '서울시 서초구'),
(3, '이민수', NULL, '경기도 성남시 분당구'),
(4, '최영진', 'choi@example.com', '서울시 송파구'),
(5, '한미영', 'han@example.com', '경기도 수원시 장안구'),
(6, '강종현', 'kang@example.com', '서울시 강서구'),
(7, '신영수', 'shin@example.com', '경기도 의정부시'),
(8, '유승환', 'yoo@example.com', '경기도 부천시'),
(9, '서민지', 'seo@example.com', '서울시 종로구'),
(10, '임진우', 'lim@example.com', '경기도 안양시 동안구');

select*from customer;

-- 1. 강남 3구 거주자 찾기
select *
from customer
where address IN ('서울시 강남구','서울시 송파구','서울시 서초구');

-- 2. 이메일을 입력하지 않은 사람 찾기
-- null 찾을 때 사용 방법 : 공백 데이터. 빈 문자열도 데이터이다.
select *
from customer
where email is null;

-- 3. id가 5 이상이며, 주소가 서울시에 거주하는 사람의 이름을 찾기
select name
from customer
where id>=5 AND address IN ('서울시 강남구','서울시 송파구','서울시 서초구','서울시 종로구','서울시 강서구');

select name
from customer
where id>=5 AND address like "서울시%";

-- 4. email이 NULL인 사람을 조회하는 쿼리
select *
from customer
where email is null;

-- 5. 이메일이 null이 아니고, 주문번호가 2번이 넘으며 종로구에 사는 사람을 찾기
select *
from customer
where email is not null and id>2 and address ="서울시 종로구";

-- 6. 주소가 서울이면서, id가 5 이하인 사람을 찾아보기
select *
from customer
where address like "서울시%" and id<=5;

-- 7. 서울시에 사는 고객들을 조회하는 쿼리
select *
from customer
where address like "서울시%";

-- 8. 아이디가 3에서 8까지의 사람 중 '경기도 의정부에 거주 중인 사람 중 이메일을 입력한 사람'
select *
from customer
where (id between 3 and 8)
    AND address='경기도 의정부시'
	AND email is not null;
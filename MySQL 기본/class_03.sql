

create database mydb;
use mydb;

-- 테이블 생성
create table student(
    student_id int,
    name varchar(50) not null,
    grade int not null,
    major varchar(50) not null
);

select*from student;
desc student;

-- 과목 테이블 생성
create table subject(
    subject_id int,
    subject_name varchar(50) not null,
    credit int not null,
    department varchar(5),
    professor char(50) not null
);

select*from student;

-- 이미 생성된 테이블에 기본 키를 추가하는 방법
alter table student add primary key(student_id);
desc student;

-- 사전 기반 지식: 데이터가 들어가 있는 상태에서 빈 값이 포함되어 있다면, 기본키 추가가 불가능하다.
-- 즉, NULL 값이 있어서는 안 된다.

alter table subject add primary key(professor);
desc subject;

-- 주문
-- order
-- row --> id : PK
-- 고객 주문 내용 - 문자
-- 상품 이름
-- 상품 가격
-- 수량

-- 최신 버전=10년
-- 예약어는 기본적으로 테이블 이름을 선점할 수 없다.
-- 하지만 강제적으로 `` 작은 따옴표를 사용해서 테이블 이름이라고 사용할 수 있다. 
create table `order`(
    id int primary key,
    price bigint,
    customer_order varchar(50),
    product_name varchar(20) not null,
    quantity int not null,
    order_date date not null
);

-- 도전 과제: 위 형식에 맞는 insert를 진행하세요.

insert into `order`(id, price, customer_order, product_name, quantity, order_date)
values(1,20000,'젓가락 빼주세요','돼지고기 김치찜',1,'2024---05-30');

select * from `order`;





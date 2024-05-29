-- 데이터 집합 생성
create database db_denco_market;

use db_denco_market;

-- db 삭제 명령어
-- drop database db_denco_market

-- 사전 기반 지식 : mysql은 대소문자를 구별하지 않습니다.
-- 하지만 구별하는 RDBMS도 있습니다.

 -- 테이블 설계하기
 
 -- 고객 테이블 생성
 create table userTBL(
     userName char(3) not null primary key,
     birthYear int not null,
     addr char(2) not null,
     mobile char(12)
 );
 
--  show tables;
--  select*from userTBL;
--  desc userTBL;

-- 구매 테이블 생성
create table buyTBL(
    id int not null auto_increment,
    userName char(3) not null,
    prodName char(3) not null,
    price int not null,
    amount int,
    primary key(id),
    foreign key(userName) references userTBL(userName)
);
 
show tables;
select * from buyTBL;
desc buyTBL; 
 
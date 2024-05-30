
/*  employee 테이블을 생성하며, id, name, age, department 네 개의 열(column)을 포함.
name 는 null 값이 들어갈 수 없습니다. 
id 열은 기본키(Primary Key)로 설정. 
데이터 타입은 직접 결정하세요. */

create database company;
use company;

create table employee(
    id int,
    name varchar(50) not null,
    age int,
    department char(10)
);

alter table employee add primary key(id);
desc employee;

/*
💡 **customer 테이블 생성**
  1. id, name, email, address 네 개의 열을 포함

    - name, address 는 null 값이 있으면 안됨. 
  2. id 열은 기본키(Primary Key)로 설정

  3. 데이터 타입은 직접 선정
*/

create table customer(
    id int,
    name varchar(50) not null,
    email varchar(50),
    address varchar(50) not null
);

alter table customer add primary key(id);
desc customer;
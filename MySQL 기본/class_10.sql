CREATE TABLE product (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  description VARCHAR(200)
);

INSERT INTO product (id, name, price, description) 
VALUES
(1, '아이폰 13', 1300000, 'Apple의 최신 모델 스마트폰'),
(2, '갤럭시 S21', 1200000, '삼성의 최신 모델 스마트폰'),
(3, '맥북 에어', 1500000, 'Apple의 대표적인 노트북'),
(4, 'LG 그램', 1300000, 'LG전자의 대표적인 노트북'),
(5, '아이패드', 800000, 'Apple의 태블릿'),
(6, '갤럭시 탭', 700000, '삼성의 태블릿'),
(7, '애플 워치', 500000, 'Apple의 스마트 워치'),
(8, '갤럭시 워치', 400000, '삼성의 스마트 워치'),
(9, '에어팟 프로', 300000, 'Apple의 무선 이어폰'),
(10, '갤럭시 버즈', 200000, '삼성의 무선 이어폰');

select*from product;

-- 상품 가격이 1,000,000원 이상인 상품만 삭제해보자
delete 
from product
where price>1000000;


-- 1. 상품 설명에 'Apple'이 포함된 상품 삭제하기
delete 
from product
where description like "Apple%";

-- 2. 가격이 500,000원 이하이고, 상품 설명에 '스마트'가 포함된 상품 삭제하기
delete
from product
where price<500000 and description like "스마트%";

-- 3. 상품 아이디가 2인 상품만 삭제
delete 
from product
where id=2;
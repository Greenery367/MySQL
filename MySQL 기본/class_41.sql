
CREATE TABLE TB_PRODUCTS(
	PRODUCT_ID INT AUTO_INCREMENT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(255),
    CATEGORY_ID INT,
    PRICE DECIMAL(10,2),
    SIZE VARCHAR(10),
    COLOR VARCHAR(50),
    FOREIGN KEY (CATEGORY_ID) REFERENCES TB_CATEGORIES(CATEGORY_ID)
);

-- 남성복 상품 입력
INSERT INTO TB_PRODUCTS(PRODUCT_NAME,CATEGORY_ID,PRICE,SIZE,COLOR)
VALUES ('남성셔츠',4,49000,'L','퍼플'),
('남성면바지',7,55000,'M','핑크'),
('남성슬랙스',8,105000,'XL','샤인');

-- 여성복 상품 입력
INSERT INTO TB_PRODUCTS(PRODUCT_NAME,CATEGORY_ID,PRICE,SIZE,COLOR)
VALUES ('여성셔츠',6,49000,'L','퍼플'),
('여성면바지',9,55000,'M','핑크'),
('여성슬랙스',10,105000,'XL','퍼플');

SELECT*FROM TB_PRODUCTS;

-- 특정 카테고리에 속하는 모든 상품 조회
-- 1단계, 남성, 여성 팬츠에 속하는 상품을 모두 조회
SELECT P.PRODUCT_NAME,P.PRICE,P.SIZE,P.COLOR
FROM TB_PRODUCTS AS P
JOIN TB_CATEGORIES AS C ON P.CATEGORY_ID=C.CATEGORY_ID
WHERE C.CATEGORY_NAME='슬랙스';

-- 2단계, 만약 여성 면바지만 출력해야 한다면?
-- 서브쿼리를 이용해보자.
-- 서브쿼리: 쿼리 속의 쿼리
SELECT P.PRODUCT_NAME,P.PRICE,P.SIZE,P.COLOR,C.PARENT_ID
FROM TB_PRODUCTS AS P
JOIN TB_CATEGORIES AS C ON P.CATEGORY_ID=C.CATEGORY_ID
WHERE C.CATEGORY_NAME='면바지' 
						AND c.parent_id=
                        (SELECT category_ID FROM TB_CATEGORIES 
                        WHERE category_name='팬츠' and parent_id=2);

SELECT PARENT_ID FROM TB_CATEGORIES WHERE category_name='팬츠';
SELECT PARENT_ID FROM TB_CATEGORIES 
	WHERE category_name='팬츠' and parent_id=2;
    
    
-- 문제 1. 남성복 셔츠만 출력하시오.
SELECT P.PRODUCT_NAME,P.PRICE,P.SIZE,P.COLOR
FROM TB_PRODUCTS AS P
JOIN TB_CATEGORIES AS C ON P.CATEGORY_ID=C.CATEGORY_ID
where c.category_name='셔츠' 
							and c.parent_id=
							(SELECT parent_id FROM TB_CATEGORIES 
                        WHERE category_name='셔츠' and parent_id=1);

-- 문제 2. 여성복 슬랙스만 출력하시오.
select P.PRODUCT_NAME,P.PRICE,P.SIZE,P.COLOR
from TB_PRODUCTS as p
join TB_CATEGORIES as c on p.CATEGORY_ID=c.CATEGORY_ID
where c.category_name='슬랙스' 
	and c.parent_id=
		(select category_id from TB_CATEGORIES
        where category_name='팬츠' and parent_id=2);
        
-- 문제 3. 

-- 문제 남성 셔츠 1벌 여성 면바지2벌 남성 슬랙스 4벌의 총 가격을 구하시오
select p.product_name
from TB_PRODUCTS as p
join tb_categories as c on p.category_id = c.category_id
where c.category_name = '면바지' and c.parent_id = 
		(select c.parent_id from tb_categories 
		where category_name = '면바지' and category_id=7);

select*from tb_categories;
select*from tb_products;
use m_board;
desc user;
desc board;
select*from user;
select*from board;
select*from reply;
Insert into user(username,password,email,userRoll,address,createDate)
			values (?,?,?,?,?, now());
            
use demo3;
select*from tb_categories;
select*from tb_products;

-- 문제. 여성복 중 색상이 '샤인'이 아니며, 가격이 5만원 이상인 여성복들을 출력해라. 
-- 출력해야 할 것: 상품명, 카테고리ID, 가격, 색상
select p.product_name,p.category_ID,p.price,p.color
from tb_products as p
left join tb_categories as c
on p.category_ID=c.category_ID
where (p.color!='샤인') and (p.price>=50000) and p.product_name like '여성%';
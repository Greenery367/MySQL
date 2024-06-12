

-- 쇼핑몰 카테고리 1단계

use mydb3;

create table tb_categories(
	category_id int auto_increment primary key,
    category_name varchar(100) not null
);

insert into tb_categories (category_name) values ('상의');
insert into tb_categories (category_name) values ('하의');
insert into tb_categories (category_name) values ('외투');

create table tb_products(
	product_id int auto_increment primary key,
    product_name varchar(255),
    category_id int,
    price DECIMAL(10,2),
    size enum('S','M','L','XL'),
    color varchar(50),
    foreign key (category_id) references tb_categories(category_id)
);

select*from tb_categories;

insert into tb_products(product_name,category_id,price,size,color) 
	values('티셔츠',1,19900,'M','흰색'),
	('청바지',2,49000,'L','청색'),
    ('자켓',3,99000,'L','검정색'),
    ('셔츠',1,30000,'S','보라색');
    
-- 특정 카테고리에 속한 모든 상품을 조회 쿼리

select p.product_name,round(p.price),p.size,p.color
from tb_products as p
join tb_categories as c on p.category_id=c.category_id
where c.category_name='외투';


    
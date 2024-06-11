use mydb2;


create table UserTable (
    id int primary key auto_increment,
    username varchar(50) not null,
    email varchar(100) not null unique,
    password varchar(255) not null,
    address varchar(255),
    created_at timestamp default current_timestamp
);

create table ProductTable (
    id int primary key auto_increment,
    name varchar(100) not null,
    description TEXT,
    price DECIMAL(10,2) not null,
    stock int default 0,
    created_at TIMESTAMP default current_timestamp
);
drop table OrderTable;

create table OrderList(
    orderid int primary key auto_increment,
    userId int,
    productId int, 
	foreign key(userId) references UserTable(id),
    foreign key(productId) references ProductTable(id)
);

create table OrderTable(
    orderid int primary key auto_increment,
    username varchar(50) not null,
    address varchar(255) not null,
    product_name varchar(100) not null,
    product_number int not null,
    foreign key(username) references userTable(username),
	foreign key(address) references UserTable(address),
    foreign key(product_name) references ProductTable(id)
);

insert into UserTable(username,email,password,address)
values ('송원석','misaka112@naver.com','6d6d6d66d','부산진구서면');

insert into UserTable(username,email,password,address)
values ('박준수','asjkfafka@naver.com','531254afa','부산남구대연동');

select*from UserTable;

insert into ProductTable(name,description,price,stock)
values('청바지','바지','30000','100');

insert into ordertable(userId,productId,orderCount)
values (1,1,3);


select OT.orderid,PT.name , UT.username , OT.ordercount , UT.address
from OrderTable as OT
left join OrderList as OL
on OT.orderid = OL.orderid
join UserTable as UT
on OT.userId = UT.id
join ProductTable as PT
on OT.productId = PT.id;
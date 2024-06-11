use mydb2;

create table user(
	id int auto_increment primary key,
    username VARCHAR(50) not null,
    email VARCHAR(100) not null unique,
    password VARCHAR(255) not null,
    created_at TIMESTAMP default current_timestamp
);
drop user;

create table product(
	id int auto_increment primary key,
    name VARCHAR(100) not null,
    description text,
    price DECIMAL(10,2) not null,
    stock int default 0,
    created_at timestamp default current_timestamp
);
-- ----------------------------------------------

create table order_table(
	id int primary key auto_increment,
    user_id int not null,
    product_id int not null,
    foreign key (user_id) references user(id),
    foreign key (product_id) references product(id)
);

create table order_list(
	id int not null primary key,
    username varchar(50) not null,
    product varchar(100) not null,
    product_number int not null,
    total_price DECIMAL(10,2) not null,
    sending_address varchar(255) not null,
    sending_date timestamp default current_timestamp,
    foreign key (id) references order(id),
    foreign key (username) references user(username),
    foreign key (product) references product(name),
    foreign key (user) references user(address)
);



create table TB_User(
    user_id int auto_increment,
    username varchar(50) not null,
    password varchar(50) not null,
    primary key(user_id)
);

create table TB_User_Details(
    details_id int auto_increment,
    user_id int unique,
    address varchar(100),
    phone_number varchar(15),
    email varchar(50),
    primary key(details_id),
    foreign key(user_id) references tb_user(user_id)
);

create table TB_Team(
	team_id int auto_increment primary key,
    team_name varchar(50),
    home_city varchar(50), 
    esteblished_year year
);

create table TB_Player(
	player_id int auto_increment primary key,
    player_name varchar(50),
    position varchar(20),
    birth_date date,
    team_id int,
    foreign key(team_id) references TB_Team(team_name)
);


create database m_board;
use m_board;

-- 유저 서비스
create table user(
	id int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(255) not null,
    email varchar(100) not null,
    userRole varchar(20),
    createDate timestamp
);

-- 블로그 서비스
create table board(
	id int primary key auto_increment,
    userId int,
    title varchar(100) not null,
    content text,
    foreign key (userId) references user(id)
);

-- 댓글 서비스
create table reply(
    id int primary key auto_increment,
    userId int,
    boardId int,
    content varchar(300) not null,
    create_date timestamp,
    foreign key(userId) references user(id) on delete set null,
    foreign key(boardId) references board(id) 
);

desc user;
-- 스키마 구조를 변경하는 쿼리 --- DDL, DML, DCL
alter table user add address varchar(100) not null;
alter table board add readCount int not null;

INSERT INTO user (username, password, email, address, userRole, createDate)
VALUES
('홍길동', '1234', 'hong@example.com', '서울시 강남구', 'admin', NOW()),
('이순신', '1234', 'lee@example.com', '부산시 해운대구', 'user', NOW()),
('김유신', '1234', 'kim@example.com', '대구시 수성구', 'user', NOW());

INSERT INTO board (userId, title, content, readCount)
VALUES
(1, '첫 번째 글입니다', '안녕하세요, 홍길동입니다. 이것은 테스트 게시글입니다.', 150),
(2, '이순신의 포스팅', '부산에서 이순신입니다. 바다가 아름다운 날입니다.', 45),
(3, '대구의 뜨거운 여름', '여름이 기승을 부리는 대구에서 김유신입니다.', 30);

INSERT INTO reply (userId, boardId, content, create_Date)
VALUES
(2, 1, '홍길동님의 글 잘 읽었습니다!', NOW()),
(3, 1, '저도 의견이 같네요.', NOW()),
(1, 2, '부산도 좋지만 서울도 좋아요!', NOW()),
(1, 3, '대구가 그렇게 덥군요, 조심하세요!', NOW());

-- 특정 사용자의 게시글을 조회하고 싶다면?
-- 사용자 ID가 1인 홍길동의 모든 게시글을 보고 싶다면
select u.username, b.title,b.content
from user as u
join board as b
on u.id=b.userId
where u.id=1;

insert into reply (userId,boardId,content,create_Date)
values (1,2,'부산하면 바다죠~',now());


-- 특정 사용자의 게시글 해당 게시글의 댓글 수 조회
select b.title as 제목 ,b.content as 내용 ,u.username as 작성자, count(r.boardId) as 조회수
from board as b
left join reply as r
on b.id=r.boardId
left join user as u
on b.userId=u.id
group by 제목;

-- 조회수가 가장 높은 게시글 상위 2개만 조회
select b.title as 제목, b.readCount
from board as b
order by b.readCount desc
limit 0,2;
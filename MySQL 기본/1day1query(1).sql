create database db_movie;
create table movie(
    id int primary key auto_increment,
    title varchar(50) not null,
    director varchar(20),
    realese_date date ,
    genre varchar(20),
    rating DOUBLE
);

insert into movie(title,director,realese_date,genre,rating) values
('괴물','봉준호','2006-07-27','드라마',8.28),
('극한직업','이병헌','2019-01-23','코미디',9.20),
('명량','김한민','2014-07-30','사극',9.17),
('신과함께-죄와 벌','김용화','2017-12-20','판타지',7.56),
('밀양','임권택','2016-09-07','드라마',7.76),
('반도','연상호','2020-07-15','액션',6.71),
('베테랑','류승완','2015-08-05','액션',8.49),
('변호인','양우석','2013-12-18','드라마',8.41),
('군함도','류승완','2017-07-26','사극',8.01),
('암살','최도운','2015-07-22','액션',8.37);

-- 문제 1. 감독이 '봉준호'인 영화의 평점을 9.01로 수정해주세요.
update movie
set rating=9.01
where director='봉준호';

-- 문제 2. 제목이 '밀양'인 영화의 날짜를 '2015-04-10'으로 수정해주세요.
update movie
set realese_date='2015-04-10'
where title='밀양';

-- 문제 3. movie 테이블에 char(3)형 칼럼 'check_watch'을 만들고, '괴물'과 '베테랑'을 '관람함'으로 수정해주세요.
alter table movie add column check_watch varchar(10);
update movie 
set check_watch='관람함'
where title='괴물' and  title='베테랑';

-- 문제 4. 장르가 드라마이고 id가 6이상인 영화의 평점을 8.67로 수정하기
update movie
set rating=8.67
where genre='드라마' and id>6;

-- 문제 5. 관객수 컬럼을 추가하고 데이터 넣기.
alter table movie add column visitors int;

-- 문제 6. 류승완 감독의 모든 작품에 관객수를 추가해보자.
update movie
set visitors=10000
where director='류승완';



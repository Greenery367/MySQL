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

-- 문제 7. 오늘부로 '박태현' 감독의 신작 영화 '스타워즈-이미테이션'을 출시하게 되었다.
insert into movie(title,director,realese_date,genre,rating) values
('스타워즈-이미테이션','박태현','2015-12-22','SF',8.23);

-- 문제 8. 2010년 부터 2015년 사이에 개봉한 영화 이름
select*from movie
where realese_date between '2010-01-01' and '2015-12-31';

-- 문제 9. 2016년 이후로 개봉한 영화에 대한 정보를 조회
select*from movie
where realese_date >'2016-01-01';

-- 문제 10. 개봉일이 2015년도 ~ 2020년도인 영화만 조회하세요
select*from movie
where realese_date between '2015-01-01' and '2020-12-31';

-- 문제 11. '밀양' 타이틀을 가진 작품의 감독을 '이창동' release_date를 '20070523', rating을 8.90 으로 변경하세요.
update movie
set director='이창동', realese_date='2007-05-23' , rating=8.90
where title='밀양';

-- 문제 12. 평점 8.00 이상이면서 액션 장르인 영화 조회
select*from movie
where rating>8.00;

-- 문제 13. 2019년 이후인 날짜 조회하기
select*from movie
where realese_date>'2019-01-01';

-- 문제 14. '임권택' 감독의 민감한 사회적 문제로 인해 영광스러운 이 데이터베이스에 이름을 올릴 수 없게 되었다. 이름을 삭제하시오.
delete 
from movie
where director='임권택';

-- 드라마에서 8점 이상의 제목만을 출력하시오
select title from movie
where rating>8.00;

-- 영화 평점 8.03 이상인 드라마 장르 영화를 조회해주세요
select*from movie
where rating>8.03 and genre='드라마';

-- 장르가 액션이며 평점이 8.40 이상인 영화의 출시일을 '2024-06-04'로 변경하시오.
update movie
set realese_date='2024-06-04'
where genre='액션' and rating>8.40;

-- 평점 8점 이하의 영화를 8.51로 수정
update movie
set rating=8.51
where rating<8.00;

-- 감독인 류승완인 영화의 rating을 9점대로 바꾸세요
update movie
set rating=9.00
where director='류승완';

select*from movie;

-- 2015년 이후 개봉한 영화 중 평점이 8 이상인 영화 조회

-- 2017년에 개봉한 영화를 찾아주세요

-- 개봉일이 '2016-09-07'인 영화의 평점을 7.86으로 수정해주세요.

-- 테이블에서 가장 평점이 높은 영화를 찾고 그 row 를 전체 출력하시오

-- 신과함께-인과연 , 김용화 , 2018-08-01,판타지,8.63 을 추가 하세요

-- rating이 9.0 이상 이고 release_date 가 2018-01-01 이후인 영화 출력

-- 17년 이후 개봉 작품을 출력해주세요





-- 1단계
select *
from tb_stduent as s
left join tb_grade as g
on s.grade=g.grade;

-- 2단계
select *
from tb_grade as g
left join tb_stduent as s
on g.grade=s.grade;

desc tb_stduent;

-- RIGHT OUTER JOIN
select *
from tb_stduent as s
right join tb_grade as g
on s.grade=g.grade;


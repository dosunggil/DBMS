-- 여기는 school DB 화면
-- DataBase 생성 : schoolDB 이름으로 생성 : Root 로 접속하여 생성
-- create database schoolDB;

use schooldb;
create table tbl_student (
st_num	VARCHAR(5)		PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL	,
st_dept	VARCHAR(20)		,
st_grade	INT		,
st_tel	VARCHAR(15)	NOT NULL,	
st_addr	VARCHAR(125)		
);

select * from tbl_student;
select * from tbl_subject;
select * from tbl_score;

create table tbl_subject (
sb_code	VARCHAR(5)	NOT NULL	PRIMARY KEY,
sb_name	VARCHAR(25)	NOT NULL	
);

insert into tbl_subject (sb_code, sb_name) values ('SB001' , '국어'),('SB002' , '데이터베이스'),('SB003' , '미술'),('SB004' , '소프트웨어공학'),('SB005' , '수학'),('SB006' , '영어영문'),('SB007' , '음악');

create table tbl_score (
sc_seq	BIGINT PRIMARY KEY auto_increment,
sc_stnum	VARCHAR(5)	NOT NULL	,
sc_sbcode	VARCHAR(5)	NOT NULL	,
sc_score	int,
unique(sc_stnum, sc_sbcode)
);

select * from tbl_score;

-- tbl_score table 의 데이터를 참조하여 
-- 과목별 전체 총점을 구하시오
-- 점수가 70점 이하인 데이터만 나열하기

select * from tbl_score
where sc_score <= 70
order by sc_stnum;

-- tbl_score 데이터에서 전체 데이터를 표시하되 과목코드, 점수 칼럼만 표시되도록 
select sc_sbcode, sc_score from tbl_score;

select sc_sbcode, sc_score from tbl_score
where (sc_score >= 50) and (sc_score <= 70);

-- tbl_subject ttbl_subjectable 과 연결하여 

-- sc_sbcode (score) // sb_code (subject)
select * from tbl_score
left join tbl_subject on sc_sbcode = sb_code
where (sc_score >= 50) and (sc_score <= 70);


select st_num, st_name, sb_code, sb_name, sc_score from tbl_score
left join tbl_subject on sc_sbcode = sb_code
left join tbl_student on sc_stnum = st_num
where (sc_score >= 50) and (sc_score <= 70)
order by st_num ;

select st_num as 학번 ,  st_name as 학생이름, sum(sc_score) as 총점
from tbl_score
left join tbl_subject on sb_code = sc_sbcode
left join tbl_student on sc_stnum = st_num
group by  st_name;

-- tbl_score 테이블에서 각 학생들의 SB002(데이터베이스) 과목 점수만
-- 학번 데이터베이스점수(SB002)
-- S0001 90
-- S0002 70
select st_num as 학번 , st_name as 학생이름, sc_sbcode as 과목코드,  sc_score as 점수
from tbl_student
left join tbl_score
on st_num = sc_stnum
where sc_sbcode ='SB002'
order by st_num;

select sc_stnum,
sum(if(sc_sbcode = 'SB001' , sc_score, 0) )as 국어,
sum(if(sc_sbcode = 'SB002', sc_score,0)) as DB
from tbl_score
group by sc_stnum;

select sc_stnum,
sum(case when sc_sbcode = 'SB001' then sc_score else 0 end) as 국어,
sum(case when sc_sbcode = 'SB002' then sc_score else 0 end) as DB
from tbl_score
group by sc_stnum;

-- 제 2 정규화가 되어있는 데이터를 view 할 때는 PIVOT 으로 데이터를 펼쳐서 보는것이 편리할때가많다
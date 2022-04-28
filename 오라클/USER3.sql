--여기는 USER3 화면
/*
처음으로 데이터를 저장하기 위해서 할 일
1. 등록된 사용자로 접속하기
2. 테이블 생성

*/

CREATE TABLE tbl_student (
	st_num	    VARCHAR2(5)	    PRIMARY KEY,
    st_name     nVARCHAR2(20)	NOT NULL,
	st_tel	    VARCHAR2(15)	UNIQUE NOT NULL,
	st_addr	    nVARCHAR2(125)	NULL,
	st_dept	    nVARCHAR2(10)	NULL,
	st_grade	NUMBER(1)	    NULL
);

--DROP Table tbl_student;

-- tbl_student table 에 데이터 추가하기
-- 생성된 table 에 데이터를 추가하는 행위를 Data Create 라고 한다.
Insert Into tbl_student( st_num, st_name, st_tel, st_dept)
VALUES( '00001', '홍길동', '010-1111-1111', '수학과');
Insert Into tbl_student( st_num, st_name, st_tel, st_dept)
VALUES( '00002', '이몽룡', '010-1111-1112', '물리학과');
Insert Into tbl_student( st_num, st_name, st_tel, st_dept)
VALUES( '00003', '성춘향', '010-1111-1113', '정보통신');


-- 저장된 데이터 조회(Querry), 읽기
/*
 SELECT * : 모든 칼럼을 보여달라.
 SELECT st_num , st_name : 칼럼 중에서 st_num, st_name 칼럼만 보여달라.
    projection : 보고싶은 칼럼만 보기
*/
Select *
From tbl_student;

Select st_num , st_name, st_dept
From tbl_student;

-- 칼럼의 표시 순서를 변경하여 볼 수 있다.
Select st_num, st_dept , st_name, st_addr , st_grade
From tbl_student;

-- tbl_student 에 저장된 데이터중에서 이름이 홍길동인 데이터만 보여달라.
--  SELECTION
Select *
From tbl_student
WHERE st_name = '홍길동';

/*
Selcetion 명령 수행
Projection : 데이터를 조회할 때 보고자 하는 칼럼만 표시하는 것
Selection : 데이터를 조회할 때 Where 조건절을 붙여 필요한 데이터 리스트만 보는 것

Projection 을 하면 실제 칼럼보다 적은 양의 칼럼을 보여준다.
Selection 을 하면 실제 데이터 리스트보다 적은 양의 리스트를 보여준다.

*/

-- 전체 데이터를 조건 없이 보여주되, 이름 오름차순 정렬하여 보여줘라.
Select *
From tbl_student
Order By st_name;

Select *
from tbl_student
order by st_name DESC; -- 내림차순

insert into tbl_student(st_num, st_name, st_tel, st_dept)
VALUES('00004','박명수','010-1111-1114' , '수학과');
insert into tbl_student(st_num, st_name, st_tel, st_dept)
VALUES('00005','유재석','010-1111-1115' , '수학과');

-- 학과가 수학과인 데이터만 selection 하여
-- 이름 순으로 정렬하라
select *
from tbl_student
where st_dept = '수학과'
order by st_name;

select *
from tbl_student
where st_dept = '수학과'
order by st_name DESC;

-- 전체 데이터를 학과 순으로 정렬하고, 학과가 같은 데이터끼리는 이름순으로 정렬.
select *
from tbl_student
order by st_dept, st_num;

-- 전체 데이터의 갯수가 몇개냐?
select count(st_dept)
from tbl_student;

Select count(*)
from tbl_student;


-- 학과별로 학생이 몇명인지 알고 싶다.
select st_dept, count(st_dept) 학생수 -- 3. 묵은 그룹에 포함된 데이터가 몇개?
from tbl_student  -- 1. 데이터 가져오기
group by st_dept  -- 2. st_dept 가 같은 데이터끼리 묶고
ORDER by st_dept DESC;

-- 전체 데이터 중에서 수학과 학생이 몇명이냐?
select count(st_dept)
from tbl_student
where st_dept = '수학과';

-- 도구에서 데이터를 추가,수정,삭제 명령을 수행한 경우
-- oracle dbms 에게 요청을 한 상태가 된다
-- 하지만 oracle dbms 는 아직 스토리지의 dbf 파일에 저장하지 않은 상태이다.
-- 이 상태에서 도구를 종료해버리면 
-- oracle dbms 는 어떤 문제가 발생하여 종료된 것으로 생각하여 데이터를 지워버린다.
-- 도구를 사용하여 접속하였을 경우는 도구를 commit 하고 종료해야 한다.
commit;

select * from tbl_student;

insert into tbl_student (st_num , st_name , st_tel)
VALUES ('00006','이대호','010-1111-1116');

/*
데이터를 추가,수정,삭제하고 아직 commit 되지 않은 상태에서
추가, 수정 삭제를 취소하는 명령
*/
rollback;


delete
from tbl_st udent;

/*
DCL( data control lang')
사용자에게 권한을 부여(Grant) 하거나 회수(Revoke) 하는 명령이 있고

데이터를 Commit 또는 Rollback 하는 명령이 있다.
*/

Drop table tbl_student;

create table tbl_student(
    st_num	VARCHAR2(5)		PRIMARY KEY,
    st_name	nVARCHAR2(20)	NOT NULL,
    st_dept	nVARCHAR2(10),		
    st_grade	NUMBER(1),		
    st_tel	VARCHAR2(15)	NOT NULL	UNIQUE,
    st_addr	nVARCHAR2(125)		
);

create table tbl_score(
    sc_stnum	VARCHAR2(5)		PRIMARY KEY,
    sc_kor	    NUMBER,		
    sc_eng	    NUMBER,		
    sc_math 	NUMBER,		
    sc_his  	NUMBER,		
    sc_hum	    NUMBER,		
    sc_sci  	NUMBER		
);

select * from tbl_student;

select st_dept, count(st_dept)
from tbl_student
group by st_dept
ORDER by COUNT(st_dept) DESC;
-- 위 아래 코드는 같은것
select st_dept, count(st_dept) as 학생수
from tbl_student
group by st_dept
ORDER by 학생수 DESC;

select st_dept, count(st_dept) as 학생수
from tbl_student
group by st_dept
ORDER by 학생수 DESC, st_dept;


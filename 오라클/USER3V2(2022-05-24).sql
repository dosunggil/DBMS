-- 여기는 user3 화면
-- 학생 Entity 설계를 기준으로 tbl_student table 생성하기
create table tbl_student(
    st_num varchar2(8) PRIMARY KEY,
    st_name nvarchar2(15) not null,
    st_grade number(1) default null,
    st_tel varchar2(15),
    st_addr nvarchar2(255)
);

insert into tbl_student(st_num, st_name)
values( '20220001', '홍길동');

drop table tbl_student;
-- 학과 테이블
-- 학과 코드는 pk 로 선언하고
create table tbl_dept (
    d_code varchar2(5) primary key,
    d_name NVARCHAR2(20) not null unique,
    d_pro nvarchar2(15),
    d_class varchar2(5)
);

drop table tbl_dept;

-- 학생의 학과 소속 정보 Relation 을 table 로 생성
-- Relation 을 table 로 설계할 때 가장 유의해야 할 부분
-- Entity table 의 칼럼과 DOMAIN 을 반드시 일치시켜야 한다.

-- 복수의 칼럼이 unique, not null 로 선언되었다.
-- 이러한 경우 복수의 칼럼을 묶어 PK 로 선언하기도 한다.
-- 이 table 에 insert 를 수행할 때는 데이터 검증이 잘 되어
-- 잘못된 데이터가 추가되는 것을 방지할 수 있다.

-- 하지만 update, delete 를 수행할 때는
-- 복수의 칼럼으로 조건절을 수행해야 한다.
-- 이때 칼럼을 누락시키거나 잘못된 값으로 조건을 수행하여 데이터 무결성이 파괴될 수 있다.

-- 이럴때는 실제 데이터와 관련없는 단일 칼럼을 추가하고
-- pk 로 설정하는 설계를 할 필요가 있다.
create table tbl_belong (

    b_seq NUMBER primary key,
    b_stnum varchar2(8) not null,
    b_dcode varchar2(5) not null,
    unique(b_stnum, b_dcode)
);
drop table tbl_belong;

select * from tbl_student;
select * from tbl_dept;
select * from tbl_belong;

-- 전체 칼럼에 데이터 포함하여 insert 하기
insert into tbl_dept (d_code , d_name , d_pro, d_class) 
values ('D0001', '컴퓨터공학','홍길','505');

-- 전체 칼럼에 데이터를 포함한 insert 할 때는 칼럼 리스트를 생략할 수 있다.
-- 하지만, 정확히 칼럼에 데이터들이 일치한다는 보장이 없다.
insert into tbl_dept
values ('D0006', '전자공학','이몽룡','506');

-- 학번 20220001 학생의 소속학과(D0001) 를 등록
insert into tbl_belong (b_seq,b_stnum, b_dcode)
values (1,'20220001' , 'D0001');

-- 학생들의 소속학과(코드)를 확인하는 JOIN 문
select ST.st_num 학번, ST.st_name 이름, B.b_dcode 학과코드, ST.st_grade 학년
from tbl_student ST
    left JOIN tbl_belong B
        ON ST.st_num = B.b_stnum;
    
insert into tbl_student(st_num, st_name) values ('20220001','홍길동');
insert into tbl_belong(b_seq, b_stnum,b_dcode) values (1,'20220001','D0001');
insert into tbl_dept(d_code, d_name) values ('D0001', '컴퓨터공학');
        
select ST.st_num 학번, ST.st_name 이름, B.b_dcode 학과코드, D.d_name 학과, D.d_pro 교수,  D.d_class 강의실
from tbl_student ST
    left JOIN tbl_belong B
        ON ST.st_num = B.b_stnum
    left join tbl_dept D
        on B.b_dcode = D.d_code;
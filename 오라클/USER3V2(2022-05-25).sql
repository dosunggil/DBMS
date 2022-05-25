-- USER3V2 로 접속한 화면

drop table tbl_student;
drop table tbl_dept;
drop table tbl_belong;

-- 학생 정보 테이블
Create table tbl_student (
    ST_NUM	    VARCHAR2(8)	    PRIMARY KEY,
    ST_NAME	    NVARCHAR2(15)	NOT NULL,
    ST_GRADE	NUMBER(1,0)	    ,
    ST_TEL	    VARCHAR2(15)	,
    ST_ADDR	    NVARCHAR2(255)	
);

-- 학과 정보 테이블
Create table tbl_dept (
    D_CODE	    VARCHAR2(5)	    PRIMARY KEY,
    D_NAME	    NVARCHAR2(20)	NOT NULL,
    D_PRO	    NVARCHAR2(15)	,
    D_CLASS	    VARCHAR2(5)	
);

-- 소속 정보 테이블
create table tbl_belong (
    B_SEQ	    NUMBER  	PRIMARY KEY,
    B_STNUM	    VARCHAR2(8)	Not null,
    B_DCODE	    VARCHAR2(5)	Not null,
    unique(b_stnum,b_dcode)
);

-- 학생정보 샘플데이터 추가
insert into tbl_student(st_num, st_name, st_grade)
values('20220001','홍길동',1);
insert into tbl_student(st_num, st_name, st_grade)
values('20220002','이몽룡',3);
insert into tbl_student(st_num, st_name, st_grade)
values('20220003','성춘향',2);

-- 학과정보 샘플데이터 추가
insert into tbl_dept(d_code, d_name, d_pro, d_class) 
values ('D0001', '컴퓨터공학' , '장영실', '505');

insert into tbl_dept(d_code, d_name, d_pro, d_class) 
values ('D0002', '체육과' , '임꺽정', '501');
insert into tbl_dept(d_code, d_name, d_pro, d_class) 
values ('D0003', '법학과' , '김앤장', '502');
insert into tbl_dept(d_code, d_name, d_pro, d_class) 
values ('D0004', '간호학과' , '나이팅게일', '502');

-- 소속정보 샘플데이터 추가
insert into tbl_belong (b_seq, b_stnum, b_dcode) values (1,'20220001','D0001');
insert into tbl_belong (b_seq, b_stnum, b_dcode) values (2,'20220002','D0001');
insert into tbl_belong (b_seq, b_stnum, b_dcode) values (3,'20220002','D0002');
insert into tbl_belong (b_seq, b_stnum, b_dcode) values (4,'20220003','D0001');
insert into tbl_belong (b_seq, b_stnum, b_dcode) values (5,'20220003','D0002');
insert into tbl_belong (b_seq, b_stnum, b_dcode) values (6,'20220003','D0003');

/*
    테이블에 일련번호 칼럼이 있을경우
    중복되지 않는 일련번호를 사용하여 PK 로 설정한다.
    오라클 이외의 다른 DBMS 에서는 AUTO INCREMENT 라는 속성을 사용하여
    데이터를 insert 할 때 자동으로 칼럼 데이터를 추가한다.
    하지만 오라클은 그러한 속성이 없어서 상당히 불편하다.
    
    오라클에서는 SEQUENCE 라는 특별한 객체가 있어서
    그 객체를 사용하여 같은 효과를 발휘한다.
    
    또는 PK에 해당하는 칼럼을 문자열 32byte 크기로 설정하고
    UUID 를 사용하기도 한다.
    프로그래밍 언어(java, c ,python : 호스트언어)와 함께 프로젝트를 할 때는 UUID 를 사용한다.
    
*/
-- seq_belong 이라는 SEQUENCE 객체를 생성하고
-- 시작값을 1로, 자동 증가 옵션을 1로 설정하겠다.
create SEQUENCE seq_belong start with 1 increment by 1;

-- seq_belong SEQUENCE 의 nextval 값을 조회 하라.
-- nextval 값은 호출(select 등) 할때마다 항상 1 증가된 값을 보여준다.
select seq_belong.nextval from dual;

-- 표준 SQL 에서 간단한 사칙연산을 수행하는 방법
-- 오라클에서는 select 명렁문이 from 문 없이 수행하는 것이 불가능하다.
-- 그래서 의미없는 table 인 dual 을 사용하여 from 문을 붙여준다.
select 10 + 20 from dual;
select 100 * 100 from dual;
select 100 - 10 from dual;
select 50 / 20 from dual; 

-- SEQUENCE 를 사용하여 자동 증가하는 SEQ 를 만들고, insert 에서 사용하기
insert into tbl_belong(b_seq , b_stnum, b_dcode ) 
values(seq_belong.nextval , '20220001','D0003');
insert into tbl_belong(b_seq , b_stnum, b_dcode ) 
values(seq_belong.nextval , '20220003','D0005');

select * from tbl_belong;

-- tbl_student, tbl_dept, tbl_belong 3개의 table 을 left join 하여 
-- 학번, 이름, 학과코드, 학과명, 학년 을 표시하는 select 문을 작성
select st_num, st_name, d_code, d_name, st_grade
from tbl_student S
    left JOIN tbl_belong B
        on S.st_num = B.b_stnum
    left join tbl_dept D
        on B.b_dcode = D.d_code
        order by st_num, d_code;
        
        
select st_num, st_name, d_code, d_name, st_grade
from tbl_student S, tbl_belong B, tbl_dept D
        where S.st_num = B.b_stnum
        and B.b_dcode = D.d_code;
        
-- 학생, 학과, 소속 테이블간에 FK 설정하기
-- 1. FK 설정하기에 앞서 참조 무결성 관계를 조회해야한다.
-- 다음의 SQL 의 결과에서 결과가 한개도 없어야 참조무결성 관계가 성립된다.
select st_num, st_name,b_seq, d_code, d_name, st_grade
from tbl_student S
    left JOIN tbl_belong B
        on S.st_num = B.b_stnum
    left join tbl_dept D
        on B.b_dcode = D.d_code
where st_num is null or d_name is null;

-- 위의 SQL 결과 참조무결성이 성립되지 않는 데이터는
-- b_seq 가 8인 데이터
-- 2. 참조무결성이 성립되지 않는 데이터를 삭제한다.
delete from tbl_belong where b_seq in(8);

select b_seq, b_stnum, b_dcode, st_num, d_name
from tbl_belong
    left join tbl_student
        on b_stnum = st_num
    left join tbl_dept
        on b_dcode = d_code
where st_num is null or d_name is null;
-- 3. 테이블간의 참조무결성 제약조건을 부여하겠다.
-- 참조무결성 제약조건을 테이블에 추가하는데
-- 이때는 Relation table 에 추가한다.

-- 테이블에 FK 를 추가하여 참조무결성 제약조건을 부여한다.
ALTER table tbl_belong ADD CONSTRAINT FK_tbl_student
FOREIGN key(b_stnum) REFERENCES tbl_student (st_num);

ALTER table tbl_belong ADD CONSTRAINT FK_tbl_dept
FOREIGN key (b_dcode)REFERENCES tbl_dept (d_code);

select * from tbl_student;
/*
    20220001	홍길동	1		
    20220002	이몽룡	3		    
    20220003	성춘향	2		    
*/

select * from tbl_dept;
/*
    D0001	컴퓨터공학	장영실	505
    D0002	체육과	임꺽정	501
    D0003	법학과	김앤장	502
    D0004	간호학과	나이팅게일	502
*/
select * from tbl_belong;
/*
    1	20220001	D0001
    2	20220002	D0001
    3	20220002	D0002
    4	20220003	D0001
    5	20220003	D0002
    6	20220003	D0003
    7	20220001	D0003
*/

-- tbl_student 에 아직 추가되지 않은 학번을 belong table 에 추가하기
-- tbl_student 에 없는 20220004 학번을  추가하려고 했더니
-- parent key not found 오류가 발생한다.

insert into tbl_belong(b_seq, b_stnum, b_dcode)
values(seq_belong.nextval, '20220004', 'D0003');

-- 먼저 tbl_student 에 해당 학번의 학생정보를 추가해두어야 한다.
-- tbl_student 에 아래 데이터를 추가한 후 다시 위의 SQL 을 실행하면 정상적으로 추가된다.
insert into tbl_student( st_num, st_name, st_grade) values ('20220004', '장보고' , 2);

-- tbl_belong 에 등록된 학번의 정보를 tbl_student 에서 삭제하려고 한다.
-- 이미 tbl_belong 에 등록된 학번이므로 학번의 정보를 삭제할 수 없다.
-- child key found
-- FK 를 설정할 때 parent table 의 데이터를 삭제하려고 할 때
-- child table 에 데이터가 있으면 삭제 금지,
-- 또는 parent table 의 데이터를 변경(update) 하려고 할 때
-- child table 에 데이터가 있으면 변경 금지

-- FK 의 옵션을 지정하여 parent 의 정보가 삭제되면, child 데이터를 모두 삭제하거나
-- parent 의 데이터가 변경되면 child 의 데이터를 변경하도록 설정할 수 있다.
delete from tbl_student where st_num = '20220004' ;

-- 만약 parent table 의 데이터를 일괄 변경하거나, table 의 구조를 변경하려고 하면
-- FK 를 먼저 제거하고 실행을 해야 한다.
alter table tbl_belong
drop CONSTRAINT FK_tbl_student CAsCade;

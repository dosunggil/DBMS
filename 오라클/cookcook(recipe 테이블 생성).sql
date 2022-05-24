-- 0523 테이블 첫 작성
CREATE TABLE cook_recipe (
        r_index	NUMBER(10)		PRIMARY KEY,
        r_title	nVARCHAR2(50)	NOT NULL,
        r_main	nVARCHAR2(1500)	NOT NULL,	
        r_kcal	NUMBER(5)	    NOT NULL,	
        r_time	NUMBER(3)	    NOT NULL,	
        r_star	NUMBER(1)		NULL,
        r_user	nVARCHAR2(20)	NOT NULL,
        r_date	nVARCHAR2(15)	NOT NULL	
);

DESC cook_recipe;

drop table cook_recipe;
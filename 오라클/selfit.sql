-- selfit 화면

select sc_num, sc_label, sc_division, sc_day, sc_part
from tbl_sch;

-- Projection (차수를 제한하여 select)
-- tbl_sch 테이블에 있는 모든 데이터 중에서 몇가지만 보고싶다.
-- 일부 칼럼만 한정하여 데이터를 보고자 할 때.
select sc_num, sc_label, sc_division
from tbl_sch;


-- selection 
-- where 조건을 부여하여
-- 튜플 의 개수를 제한하기
select sc_num, sc_label, sc_division
from tbl_sch
where sc_num = '01-001';


--selection, projection 을 수행할텐데
-- sc_num, sc_label, sc_division 칼럼의 데이터들을 중복 없이 확인하고 싶다
select sc_num, sc_label, sc_division
from tbl_sch
group by sc_num, sc_label, sc_division;


select sc_num, sc_label, sc_division
			from tbl_sch
			where SUBSTR(sc_num,1,2) = '03'
			group by sc_num, sc_label, sc_division
			order by sc_num
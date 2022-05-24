-- 여기는 관리자
-- TABLESPACE 생성하기
CREATE TABLESPACE iolist
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- TableSpace 삭제하기
drop tablespace iolist
including contents and datafiles 
cascade constraints;
--

create user user3 IDENTIFIED by 12341234
DEFAULT TABLESPACE iolist;

grant dba to user3; -- 권한 부여하기
revoke dba from user3; -- 권한 회수하기

-- 사용자 계정 완전 삭제하기
drop user user3 cascade;
drop user cookcook cascade;




-- 여기서부터는 팀 프로젝트
-- 순서 -> 테이블스페이스 생성 -> 유저 생성 -> 연동
CREATE TABLESPACE recipe
DATAFILE 'C:/oraclexe/data/recipe.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

create user cookmaster IDENTIFIED by 12341234
DEFAULT TABLESPACE recipe;

-- 사용자 등록을 완료.
-- 현재는 아무 일도 할 수 없다.
-- 사용자에게 DB 연결, 조회, 추가, 삭제, 변경 등을 할 수 있는 권한을 부여한다.
-- 원칙은 권한을 세세하게 부여하여 불필요한 권한을 갖지 않도록 해야하지만,
-- 학습상 불편함이 있어서 여기서는 DBA 권한을 부여한다.
grant dba to cookmaster;



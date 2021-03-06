-- 여기는 root 화면
-- root 는 oracle 의 sys 와 같은 역할.
/*
	MySQL 사용자와 DB 의 관계가 연결 관계가 아니다.
    오라클에서는 사용자에게 default Table Space를 지정하여
    login(접속)을 하면 자동으로 기본 DB 가 연결된다.
    
    사용자는 단순히 DB 서버에 접속하는 권한을 부여받을 뿐이고
    어떤 DB 를 사용할 것인지 처음 시작할 때 연결을 해주어야 한다.
*/

-- DB 저장소 생성
CREATE database myDB;

-- 일반 사용자 생성
-- MySQL 은 전통적으로 root 사용자로 접속하여 DB 를 관리한다.
-- 최근 췟는 root 사용자는 DB, USER 생성만을 담당하고
-- DB 관리는 일반 사용자를 생성하여 실행하도록 권장한다.
-- MySQL 은 사용자를 생성할 때 어떤 방법으로 접속할 것인지를 명시해야 한다.
-- dosunggil 사용자는 localhost 에서만 MySQL 에 접속할 수 있다.
CREATE USER 'dosunggil'@'localhost' identified by '!Korea8080';
drop user 'dosunggil'@'localhost';

/*
	MySQL 은 사용자를 등록하면
    그 사용자는 기본적으로 DBA 권한을 갖는다.
    MySQL 은 실무에서 가장 많이 사용하는 버전이 5.7.x 이다.
    5.7 버전은 사용자 등록과 동시에 DB 관련된 명령을 대부분 사용할 수 있다.
    8.x 버전은 사용자 권한이 좀 더 엄격해졌다.
    
    새로 등록한 사용자에게 DB 에 접근할 수 있는 권한 부여하기
    dosunggil@localhost 사용자에게 mydb Schema 에 접근하여
    모든 DML 명령을 수행할 수 있는 권한을 부여하겠다.
*/
grant all privileges on mydb.* to 'dosunggil'@'localhost';

CREATE USER 'user1'@'127.0.0.1' identified by '!Korea8080';
-- user1 은 모든 DB Schema 에 접근할 수 있다.
grant all privileges on *.* to 'user1'@'127.0.0.1';

-- 어디에서나 접속할 수 있도록 범위를 지정하지 않은 사용자 등록.
CREATE USER 'user2'@'*' identified by '!Korea8080';

-- 2022-07-21 
Create database schoolDB;
use schooldb;
-- 학사정보 테이블 명세를 참조하여 tbl_student table 생성
create table tbl_student (
st_num	VARCHAR(5)		PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL	,
st_dept	VARCHAR(20)		,
st_grade	INT		,
st_tel	VARCHAR(15)	NOT NULL,	
st_addr	VARCHAR(125)		
);
-- 현재 root 외 등록된 사용자에게 DB 전체에 대한 권한 부여하기
GRANT all privileges on *.* to dosunggil@'localhost';
-- 권한 부여 후 적용시키기
flush privileges;

drop database schooldb;

create database schooldb;




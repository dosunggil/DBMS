-- C:\oraclexe\data
/*
    관리자로 접속하여 할 일
    TableSpace 생성
    User Acc 생성 및 TableSpace 연결
    User 에게 권한 부여
    
    관리자로 접속하여 "생성" 할 때는
    CREATE 라는 키워드를 사용한다.
    
    "삭제"를 할 때는 
    DROP 이라는 키워드를 사용한다.
*/

/*
1. TableSpace 생성
    오라클은 물리적 저장공간을 TableSpace 라는 이름으로 관리한다.
    오라클 DBMS 를 사용하여 데이터를 관리하기 위해서는
    제일 먼저 TableSpace 를 생성해야 한다.
    
    오라클 DBMS 를 설치하면 System 이 관리하는 TAbleSpace 가 기본으로 생성된다.
    System TableSpace 에는 중요한 데이터들이 저장되므로 
    가급적 일반적인, 대량의 데이터를 저장하지 않는것이 좋다.
    
    때문에 프로젝트별로 TableSpace를 만드는 것이 좋다.
*/
CREATE TABLESPACE firstDB
DATAFILE 'C:/oraclexe/data/first.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 기존의 생성한 TableSpace 를 완전히 삭제하기
DROP TABLESPACE firstDB
INCLUDING CONTENTS and datafiles CASCADE CONSTRAINTS;

/*
2. 사용자 생성과 TableSpace 연결
    
*/

CREATE USER user1 IDENTIFIED BY 12341234
DEFAULT TABLESPACE firstDB;

/*
사용자를 생성하면서 DEFAULT TABLESPACE 를 연결하지 않았을 경우
생성된 사용자 정보에 TABLESPACE 추가하기
단, 생성된 사용자 권한으로 추가된 데이터가 없어야한다.
*/

Alter USer user1 default tablespace firstDB;

-- 사용자 삭제
Drop user user1 cascade;
/*
오라클에서 새로운 사용자를 생성하면 생성된 사용자는 아무런 권한이 없다.
심지어 DBMS 에 접속할 수 있는 권한마저 없다.
따라서 생성된 사용자에게는 적절한 수준의 권한을 부여해야 한다.
GRANT 부여, REVOKE 뻇기

*/
-- 접속(login, logon) 권한 부여
GRANT create session to user1;

-- Table 을 생성할 수 있는 권한 부여
Grant create table to user1;

-- Tablespace 에 접근할 수 있는 권한 부여
grant unlimited tableSpace to user1;

--user1 의 접속 권한 해제
revoke create session from user1;

/*
DBMS 에서 사용하는 SQL 명령들

## DDL(Data Definition Lang' : 데이터 정의어)
CREATE 로 시작하는 명령
    객체의 생성명령들

    CREATE TABLESPACE
    CREATE USER
    CREATE TABLE

DROP 으로 시작하는 명령
    객체의 제거명령들
    
ALTER 로 시작하는 명령
    객체의 상태,구조 등을 변경하는 명령

## DCL (Data Control Lang' : 데이터 제어어)
GRANT
    사용자에게 권한을 부여하는 명령

REVOKE
    사용자에게서 권한을 회수하는 명령

COMMIT, ROLEBACK

## DML (Data Manipulation Lang' : 데이터 조작어, 관리어)
생성된 Table 에 대한 데이터 조작
    C - Create : Table 에 데이터 추가 : INSERT
    R - Read : Table 에 저장된 데이터를 읽어오기 : SELECT
    U - Update : Table 에 저장된 데이터의 내용을 변경하기 : UPDATE
    D - Delete : Table 에 저장된 데이터를 삭제하기 : DELETE
*/

/*
 개발, 학습자 입장에서 사용자에게 권한 부여하기.
 사용자에게 부여하는 권한은 일일이 조목조목 부여하는 것이 원칙이다.
 실무에서는 회사의 정책에 따라 적절한 권한을 관리해야 한다.
 권한이 잘못 부여되면 DB에 저장된 data 에 손상을 가할 수 있고,
 손상된 data 는 신뢰성을 잃게된다.
 
 손상된 Data 가 저장된 데이터베이스 시스템은 "무결성이 파괴 되었다" 라고 표현한다.
 
 여기서는 학습의 편의성을 위하여 사용자에게 최고권한을 부여한다.
 
 DBA 권한은 SYSDBA 보다 약간의 제약이 있는 권한이다.
 오라클 DBMS 의 중요한 정보 접근을 제외하고 모든 것을 다 할수 있다.
 심지어 다른 사용자의 Table 에도 접근할 수 있다.
*/

GRANT dba to user1;
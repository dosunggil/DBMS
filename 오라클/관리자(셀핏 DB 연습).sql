-- 관리자 화면
-- selfit 데이터 저장 공간 생성

create TABLESPACE selfitDB
datafile 'c:/oraclexe/data/selfit.dbf'
size 1m AUTOEXTEND on next 1k;

create user selfit IDENTIFIED by 12341234
default tablespace selfitDB;

grant dba to selfit;
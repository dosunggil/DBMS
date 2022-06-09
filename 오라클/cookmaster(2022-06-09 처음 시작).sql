-- cookmaster 화면

create table tbl_post(
post_seq		VARCHAR2(10)			PRIMARY KEY	,
post_title		nVARCHAR2(125)		not null		,
post_content	nVARCHAR2(1000)		not null		,
post_img		VARCHAR2(500)				,
RCP_SEQ		    VARCHAR2(10)				,
HASH_TAG	    nVARCHAR2(200)				,
POST_STAR		NUMBER(3)				
 
);
create SEQUENCE seq_post start with 1 increment by 1;

create table tbl_recipe(
RCP_SEQ		        VARCHAR2(10)			PRIMARY KEY	,
INFO_ENG		    NUMBER(5)				,
RCP_PARTS_DTLS		nVARCHAR2(1000)				
);

create SEQUENCE seq_rcp start with 10000 increment by 1;


create table tbl_manual(
MANUAL_SEQ		VARCHAR2(10)			PRIMARY KEY	,
RCP_SEQ		VARCHAR2(10)		NOT NULL		,
MANUAL		nVARCHAR2(200)				,
MANUAL_IMG		nVARCHAR2(500)				,
MANUAL_NUM		NUMBER(3)				
);
create SEQUENCE seq_manual start with 1 increment by 1;

create table tbl_user (
username		VARCHAR2(50)		PRIMARY KEY	,
password		VARCHAR2(125)		not null,
nickname		nVARCHAR2(50)		,
name		    nVARCHAR2(50)		,
email	    	nVARCHAR2(125)		not null unique,
role	    	VARCHAR2(20)		
);

drop table tbl_user;
select * from tbl_user;
insert into tbl_user (u_username, u_password, u_nickname, u_name, u_email, u_role)
VALUES ('dosunggil', 'dosunggil', '도성길', '도성','chothegenius@gmail.com','admin');




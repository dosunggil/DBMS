-- bookuser 화면

	create table  tbl_bbs(
		b_seq 			Number 		Primary key,
		b_date			varchar2(10) not null,
		b_time			varchar2(10) not null,
		b_writer		varchar2(125) not null,
		b_subject		nvarchar2(125) not null,
		b_content		nvarchar2(1000) not null
	);
    
    

create SEQUENCE seq_bbs start WITH 1 INCREMENT BY 1;

select seq_bbs.nextval from dual;
insert into tbl_bbs (b_seq, b_date, b_time, b_writer, b_subject, b_content)
values (seq_bbs.nextval, '2022-06-13', '14:23:00' , 'cho', '게시판 글 쓰기', '게시판 내용' );

select * from tbl_bbs;
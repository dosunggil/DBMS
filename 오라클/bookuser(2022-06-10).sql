select * from tbl_users;

/*
    tbl_books 와 tbl_users 테이블이 있다.
    만약 사용자가 로그인을 한 상태에서
    도서정보를 추가하면
    네이버에서 도서정보를 검색하고
    기존에 도서가 tbl_books 에 있으면 update 를 수행하고
    없으면 새로 insert 를 수행한다.
    
    그리고, 어떤 사용자가 도서를 추가했는지를 table 에 데이터로 저장하고
    로그인한 사용자의 mypage 에서 자신이 추가한 도서 목록을 볼 수 있도록 한다.

    레시피정보와 사용자간의 "레시피등록" 정보를 저장할 Relation 을 설계하기
    
    tbl_buybook
    isbn 칼럼, username 칼럼, 구입일자 칼럼
    isbn 카럼은 tbl_books 와 FK
    username 칼럼은 tbl_users 와 FK

*/
desc tbl_books;
desc tbl_users;

drop table tbl_buybooks;


select * from tbl_buybooks;
select * from tbl_books;

create table tbl_buybooks (
    b_isbn varchar2(13) not null,
    b_username varchar2(20) not null,
    b_date varchar2(10),
    PRIMARY key(b_isbn, b_username)
);
-- tbl_books 테이블과 FK 설정


alter table tbl_buybooks
add CONSTRAINT FK_BUYER_USER
FOREIGN key (b_username) REFERENCES tbl_users(username);                                                                                                                                                                                             

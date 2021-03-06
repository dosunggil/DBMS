-- USER3V2
insert into tbl_student(st_num, st_name, st_grade, st_addr, st_tel);

drop table tbl_user;
create table tbl_user (
    username varchar2(30) primary key,
    password varchar2(128) not null,
    name nvarchar2(50),
    email varchar2(125),
    role varchar2(10)
);

select * from tbl_user;


update tbl_student set st_tel ='010-111-1111' where st_num ='20220001';
update tbl_student set st_tel ='010-222-2222' where st_num ='20220002';
update tbl_student set st_tel ='010-333-3333' where st_num ='20220003';
commit;
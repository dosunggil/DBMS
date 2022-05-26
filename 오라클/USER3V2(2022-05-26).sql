-- USER3V2
insert into tbl_student(st_num, st_name, st_grade, st_addr, st_tel);

create table tbl_user (
    username varchar2(10) primary key,
    password varchar2(128) not null,
    name nvarchar2(50),
    email varchar2(125),
    role varchar2(10)
);
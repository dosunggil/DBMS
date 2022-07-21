use mydb;
drop table tbl_address;
select * from tbl_address;
insert into tbl_address( a_name, a_tel,a_address ) values("3","3","3") on duplicate key update a_name = "3", a_tel="3" ;

truncate table tbl_address;

select * from tbl_address where a_name="야유신";

delete from tbl_address where a_seq=189;

select * from tbl_address where a_name like "%유%";

select * from tbl_address where a_name like "유%";

select * from tbl_address where a_name like "%유";

select * from tbl_address where a_name like concat("%","유","%");

select * from tbl_address where a_name like "%" || {a_name} || "%" ;

select * from tbl_address limit 10;

select * from tbl_address limit 10 offset 10;

select * from (select * from tbl_address where a_name like "%유%" ) as sub limit 10 ;
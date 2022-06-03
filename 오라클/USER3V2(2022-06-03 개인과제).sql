-- 여기는 USER3V2 0603 금요일 개인 과제

create table tbl_books (
    isbn VARCHAR2(13) PRIMARY Key,
    title NVARCHAR2(50) Not Null,
    author NVARCHAR2(50) not null,
    publisher NVARCHAR2(50) not null,
    price number,
    discount number,
    description NVARCHAR2(2000),
    pubdate VARCHAR2(10),
    link varchar2(125),
    image varchar2(125)
);

select * from tbl_books;


	insert into tbl_books(	
			isbn,
			title,
			author,
			publisher,
			price,
			discount,
			description,
			pubdate,
			link,
			image
			)
		values 
			(
			2,
			222,
            222,
            222,
            200,
            100,
            500,
            500,
            500,
            500
			);
		
		
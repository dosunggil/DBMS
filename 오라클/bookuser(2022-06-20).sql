-- 여기는 bookuser

CREATE TABLE tbl_images (
	 			i_seq NUMBER PRIMARY KEY,
		        i_bseq NUMBER  NOT NULL,
		        i_originalName VARCHAR2(255) NOT NULL,	
		        i_imageName VARCHAR2(255)	NOT NULL	
		);
        
        commit;
        
CREATE SEQUENCE seq_bbs INCREMENT by 1 start with 1 MAXVALUE 10000;
CREATE SEQUENCE seq_image INCREMENT by 1 start with 1 MAXVALUE 10000;

 			SELECT seq_bbs.NEXTVAL FROM DUAL;
            
select * from tbl_images;

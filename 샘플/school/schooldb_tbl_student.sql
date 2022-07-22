-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_student`
--

DROP TABLE IF EXISTS `tbl_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_student` (
  `st_num` varchar(5) NOT NULL,
  `st_name` varchar(20) NOT NULL,
  `st_dept` varchar(20) DEFAULT NULL,
  `st_grade` int DEFAULT NULL,
  `st_tel` varchar(15) NOT NULL,
  `st_addr` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`st_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student`
--

LOCK TABLES `tbl_student` WRITE;
/*!40000 ALTER TABLE `tbl_student` DISABLE KEYS */;
INSERT INTO `tbl_student` VALUES ('S0001','갈한수','008',3,'010-3600-6924','경남 김해시 어방동 1088-7'),('S0002','강이찬','006',1,'010-5117-9448','강원도 속초시 대포동 956-5'),('S0003','개원훈','009',1,'010-5210-8751','경북 영천시 문외동 38-3번'),('S0004','경시현','006',1,'010-8258-9658','서울시 구로구 구로동 3-35번지'),('S0005','공동영','010',2,'010-1928-9020','강원도 동해시 천곡동 1077-3'),('S0006','기대연','002',2,'010-2546-7376','대구 수성구 수성3가 322-1번지'),('S0007','기원호','005',3,'010-9457-6680','울산시 울주군 서생면 간절곶해안길 205'),('S0008','기은성','008',2,'010-1414-5593','거제시 장승포동 702-4'),('S0009','나한율','009',2,'010-4579-8473','경기도 이천시 창전동 166-13번지'),('S0010','남동예','009',4,'010-3716-3225','경남 밀양시 내일동 649-7'),('S0011','낭시우','001',3,'010-5104-9815','경기도 파주시 문산읍 문산리 61-35번지'),('S0012','내세원','001',2,'010-9719-0291','충북 증평군 증평읍 창동리 65번지'),('S0013','뇌성수','005',2,'010-9243-6208','제주시 연동 1482번지'),('S0014','단수혁','004',1,'010-8510-5327','울산시 남구 옥동 143-12'),('S0015','담성민','009',1,'010-7443-8372','강원도 속초시 중앙로 150-1'),('S0016','담원준','009',4,'010-7812-6910','전남 나주시 대호동 1029-2'),('S0017','담장호','008',1,'010-7683-6887','경북 구미시 옥계동 840번지'),('S0018','독고예준','010',3,'010-4142-9998','경기도 이천시 신둔면 용면리 120번지'),('S0019','돈송혁','002',4,'010-2798-3594','충북 충주시 가금면 용전리 92번지'),('S0020','돈재현','006',2,'010-6470-3394','제주특별자치도 서귀포시 대정읍 상모리 133-8 번지'),('S0021','두동환','009',1,'010-1266-6348','경기도 파주시 금촌동 987-6번지'),('S0022','두채훈','001',2,'010-4289-5179','제주특별자치도 서귀포시 대정읍 상모리 133 번지'),('S0023','명윤일','010',2,'010-3877-1321','서울시 강서구 화곡동 1006-9'),('S0024','모재원','006',2,'010-3935-3151','서울시 강서구 가양동 1479-9'),('S0025','문은진','010',4,'010-9226-2539','인천시 서구 검암동 606-7'),('S0026','박수혁','004',2,'010-8370-2648','경기도 화성시 능동 445-2'),('S0027','방윤후','001',4,'010-1406-2861','경기도 고양시 일산동구 장항동 86'),('S0028','방채호','006',4,'010-3133-4463','서울시 관악구 신림동 1640-3'),('S0029','배세준','010',2,'010-1066-9337','경기도 양평군 양평읍 양근리 201-15'),('S0030','배채호','002',2,'010-5903-9422','대구시 동구 율하동 1223'),('S0031','변재호','006',3,'010-3677-2983','전북 부안군 변산면 격포리 290-1'),('S0032','복재민','001',2,'010-2155-1930','강원도 원주시 행구동 1847-3'),('S0033','복준완','002',2,'010-5259-5482','충남 아산시 배방읍 복수리 1019'),('S0034','비현호','010',2,'010-7511-6303','울산시 동구 서부동 113-48'),('S0035','빈성희','002',3,'010-2491-2990','경기도 화성시 봉담읍 동화리 113-1번지'),('S0036','사성준','001',4,'010-3020-0848','경남 창원시 대방동 자양로 136'),('S0037','사원혁','003',1,'010-7839-3624','서울시 도봉구 쌍문동 45-8'),('S0038','사원호','002',2,'010-7889-5421','경남 창원시 진해구 이동 464-2번지'),('S0039','삼윤후','010',3,'010-4132-7421','인천시 연수구 동춘동 926번지'),('S0040','삼찬후','007',2,'010-6946-0820','경북 경주시 성건동 684-9번지'),('S0041','석서훈','002',2,'010-2399-6769','전남 구례군 산동면 좌사리 110-1'),('S0042','성성율','001',3,'010-3264-5863','서울시 강북구 미아동 838-4번지'),('S0043','소대권','003',2,'010-3802-6277','경기도 성남시 분당구 삼평동 741'),('S0044','소윤수','001',2,'010-2567-1041','경남 김해시 장유면 관동리 1101-1번지'),('S0045','순대영','005',2,'010-1078-8912','경기도 과천시 막계동 33'),('S0046','신찬영','010',4,'010-1412-8690','충남 아산시 배방읍 장래리 1760 '),('S0047','심장호','002',3,'010-4506-9685','광주시 서구 치평동 1223-3'),('S0048','아동은','001',2,'010-8033-1552','경기도 파주시 동패동 56'),('S0049','야유신','006',1,'010-6645-9531','경기도 일산시 서구 대화동 2606'),('S0050','양동인','001',2,'010-7385-3189','광주시 남구 진월동 259번지'),('S0051','양은성','008',3,'010-2777-6626','부산시 동래구 명륜동 569-12'),('S0052','어민기','007',1,'010-6924-3023','전북 김제시 검산동 844'),('S0053','엄은진','005',2,'010-9238-5398','경기도 용인시 처인구 김량장동 23-1번지'),('S0054','여동은','003',4,'010-3363-9741','충남 천안시 석북구 백석동 878번지'),('S0055','여민국','005',1,'010-5086-7204','경기도 수원시 권선구 금곡동 572-5'),('S0056','연연재','010',4,'010-3955-2743','서울시 영등포구 여의도동 23번지'),('S0057','옥원준','004',1,'010-2797-1122','강원도 원주시 문막읍 동화리 113번지'),('S0058','옥채훈','002',1,'010-5575-4981','서울시 광진구 구의동 611번지'),('S0059','옹효성','002',3,'010-4695-7301','충남 공주시 중동 67-3번지'),('S0060','운윤태','006',1,'010-6772-5785','인천시 서구 마전동 621-5'),('S0061','원성빈','009',2,'010-8221-5180','울산시 동구 서부동 315-34'),('S0062','유민국','002',2,'010-3107-4945','경기도 수원시 천천동 528-1'),('S0063','유성율','006',3,'010-3719-1053','충남 공주시 신관동 191-7번지'),('S0064','유준호','002',4,'010-8251-9356','경기도 안산시 상록구 본오동 874-11'),('S0065','은채혁','009',1,'010-9145-4712','충남 아산시 탕정면 명암리 931-1'),('S0066','은현준','010',2,'010-1037-5508','대전시 서구 도안동 963번지'),('S0067','이윤진','003',4,'010-5227-1463','전남 여수시 종화동 470'),('S0068','전동원','010',3,'010-9218-7235','인천시 송도 커넬워크 3동'),('S0069','점재민','004',2,'010-7161-1398','울산시 중구 태화동 593-17'),('S0070','제갈동연','006',3,'010-6956-9010','경기도 고양시 일산구 주엽2동 22번지'),('S0071','제동희','008',1,'010-3548-5320','경기도 용인시 기흥구 보라동 579-2'),('S0072','제민기','004',4,'010-2721-6460','부산시 해운대구 좌동 1270-5 103호'),('S0073','제영후','001',4,'010-5682-7932','경북 경주시 천군동 206-3'),('S0074','제유상','009',4,'010-1527-7644','경기도 남양주시 별내면 화점리 58-65'),('S0075','지승현','007',3,'010-5819-2071','충남 천안시 불당동 아산신도시 222'),('S0076','진대원','006',1,'010-1743-1447','부산시 연제구 연산동728-1번지'),('S0077','진대윤','006',1,'010-8814-2202','경기도 가평군 청평면 대성리 399-103'),('S0078','진동혜','006',3,'010-1499-1703','대전시 서구 도마동 29-32번지'),('S0079','진승우','005',2,'010-3175-4442','인천시 계양구 임학동 67-9'),('S0080','진승일','001',1,'010-9156-0151','경기도 수원시 영통구 광교신도시 2-51-1'),('S0081','진승환','009',2,'010-2459-4832','인천시 연수구 선학동 406-5번지'),('S0082','초시민','010',4,'010-1583-6090','서울시 동대문구 전농동 30-3'),('S0083','초원혁','008',3,'010-9966-9550','광주시 북구 운암동1044-2번지'),('S0084','초재현','007',2,'010-6843-4167','광주시 서구 금호동 762-5번지'),('S0085','최장현','005',4,'010-3426-2583','경북 경주시 북군동 57-24'),('S0086','춘대권','002',1,'010-2926-7450','충남 부여군 부여읍 구아리 96-4'),('S0087','춘인규','008',3,'010-3565-8043','경남 진주시 상대동 300-59번지'),('S0088','춘찬영','010',1,'010-3467-9350','울산시 중구 옥교동 95'),('S0089','판한수','001',1,'010-3159-2383','서울시 종로구 관철동 5-13 1층'),('S0090','평윤섭','008',3,'010-3307-1178','인천시 연수구 동춘동 937-3번지'),('S0091','풍동해','004',1,'010-7822-7973','서울시 중구 신당동 140-10 1층'),('S0092','피태영','003',3,'010-8652-2024','경기도 부천 원미구 상동 539-1 4층'),('S0093','필영후','006',4,'010-3036-6327','서울시 서대문구 성산로 250번지'),('S0094','하재찬','003',1,'010-7202-5984','대구시 달서구 감삼동 452-3'),('S0095','함민서','010',3,'010-1025-0331','경기도 수원시 영통구 광교신도시 13'),('S0096','해송혁','001',1,'010-5194-0816','전남 목포시 용당동 1088-8'),('S0097','허시후','003',2,'010-6041-5809','경남 거창군 거창읍 상림리 825번지'),('S0098','황원혁','003',1,'010-8911-4736','울산시 남구 달동 130-3번지'),('S0099','흥동현','004',3,'010-4038-6439','서울시 양천구 신정동 1183-9'),('S0100','흥은성','009',4,'010-7096-1464','경북 구미시 봉곡동 204-1');
/*!40000 ALTER TABLE `tbl_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-22 10:04:39

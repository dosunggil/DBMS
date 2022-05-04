# DBMS 쿼리 폴더

## 오라클 DB 시작

## ERD (Entity-Relation Diagram)
* 물리적인 데이터 저장소인 Table 을 생성하기 앞서 어떤 데이터를 저장할 것인가 설계하는 것.

### Entity
* Table 을 논리적으로 부르는 이름

### Relation
* Table 과 Table 이 서로 연동되어 만들어지는 관계
* Entity 를 그냥 Relation 이라고 하기도 한다.

### E-RD 작성하기
* https://erdcloud.com 을 이용하자.

## 오라클의 데이터 타입
### 문자열 데이터 타입
* CHAR(길이) : 고정길이 문자열
* VARCHAR2(길이) : 가변길이 문자열
* nVARCHAR2(길이) : 한글가변길이 문자열

### 숫자형 데이터 타입
* NUMBER(길이) : 숫자형 데이터 타입
* 길이를 지정하지 않으면 최대 64자리까지 저장가능.


## [2022-05-04](https://github.com/dosunggil/DBMS/blob/master/%EC%98%A4%EB%9D%BC%ED%81%B4/USER3(2022-05-04).sql)
* 학생 데이터는 해봤으니 성적 데이터를 import 해보자 (제 1 정규화)
* 1. sqlD 에서 테이블 생성하고 (tbl_score) 
* 2. TBL_SCORE 우클릭하여 데이터 임포트
* 3. 샘플-학사정보데이터 불러와서 워크시트를 제1정규화로 설정하고 다음 다음 다음
* 4. 열 순서 일치시키기 /일치기준 - 위치/ 선택 ( 안되면 하나씩 눌러서 일치시켜주자) 
* 5. 완료 누르면 tbl_score 에 성적 정보 import 완료.
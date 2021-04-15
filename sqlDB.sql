SELECT *
FROM employees;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME 
FROM DEPARTMENTS;

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS;

CREATE TABLE userTBL--회원테이블
(
    userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
    userNAME NVARCHAR2(10) NOT NULL, -- 이름
    birthYEAR NUMBER(4) NOT NULL, -- 출생년도
    addr NCHAR(2) NOT NULL, -- 지역(서울, 경기 등 2글자)
    mobil1 CHAR(3),-- 휴대폰 앞자리 세자리
    mobile2 CHAR(8), -- 휴대폰 번호 8자리 - 제외
    height NUMBER(3), --키
    mDATE DATE -- 회원가입일

);

CREATE TABLE BUYTBL
(
    idNUM NUMBER(8) NOT NULL PRIMARY KEY, -- 순번(PK)
    useID CHAR(8) NOT NULL, -- 아이디(FK)
    prodNAME NCHAR(6) NOT NULL, -- 상품이름
    groupNAME NCHAR(4), --분류
    price NUMBER(8) NOT NULL, -- 단가
    amount NUMBER(3) NOT NULL, --수량
    FOREIGN KEY (useID) REFERENCES userTBL(userID)
    --일부러 책과 다르게 작성함. 
    -- 여기서의 useID가 useTBL에서 userID를 참조한다는 뜻.
);

INSERT INTO USERTBL VALUES('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO USERTBL VALUES('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-4-4');
INSERT INTO USERTBL VALUES('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-7-7');
INSERT INTO USERTBL VALUES('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO USERTBL VALUES('SSK', '성시경', 1979, '서울', NULL,      NULL,   186, '2013-12-12');
INSERT INTO USERTBL VALUES('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO USERTBL VALUES('YJS', '윤종신', 1969, '경남', NULL,      NULL,   170, '2005-5-5');
INSERT INTO USERTBL VALUES('EJW', '은지원', 1972, '경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO USERTBL VALUES('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2010-10-10');
INSERT INTO USERTBL VALUES('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-5-5');

CREATE SEQUENCE idSEQ; --순차번호 입력을 위해서 시퀀스 생성
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '모니터', '전자', 200, 5);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '메모리', '전자', 80, 10);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'SSK', '책', '서적', 15, 5);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'EJW', '책', '서적', 15, 2);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'EJW', '청바지', '의류', 50, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'EJW', '책', '서적', 15, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '운동화', NULL, 30, 2);

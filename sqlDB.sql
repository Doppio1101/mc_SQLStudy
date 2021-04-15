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

SELECT *
FROM buytbl;

--첫 번째 COMMIT함 

SELECT *
FROM userTBL
WHERE userNAME = '김경호';
-- 기본적인 WHERE절

SELECT userID, userNAME
FROM userTBL 
WHERE birthyear >= 1970 AND height >= 182;

SELECT userID, userNAME
FROM userTBL 
WHERE birthyear >= 1970 OR height >= 182;
--관계 연산자의 사용

SELECT userNAME, height
FROM userTBL 
WHERE height >= 180 AND height <= 183;
-- 위아래가 같은 의미로 사용 --BETWEEN AND를 사용해서 연속적인 값 사이에서 찾아냄
SELECT userNAME, height
FROM userTBL 
WHERE height BETWEEN 180 AND 183;

SELECT userNAME, addr
FROM usertbl
WHERE addr = '경남' OR addr = '전남' OR addR = '경북';
-- 연속적인 값이 아닌 경우 이산적인 값을 위해 IN()을 사용. 위아래가 같은 으미로 사용
SELECT userNAME, addr
FROM usertbl
WHERE addr IN('경남','전남','경북');


SELECT userNAME, height
FROM usertbl
WHERE userNAME LIKE '김%';

SELECT userNAME, height
FROM usertbl
WHERE userNAME LIKE '_종신';
-- LIKE 연산자를 사용해서 공통조건을 쓴다음 %를 사용하여 모두를 의미한다.
-- 한글자만 매치시키기 위해서는 _ 언더바를 사용한다.
-- 위 같은 상황에서는 김종신 윤종신 박종신이 있으면 셋 모두를 출력한다.
-- 단, 선우종신이 있으면 출력하지 못한다. __종신으로 언더바가 두개 있으면 선우종신만 출력된다.
-- LIKE는 사용을 많이 한다.
-- %나 _가 검색할 문자열의 맨 앞에 들어가는 것은 오라클 성능에 나쁜 영향을 끼칠 수 있다.

SELECT userNAME, height
FROM userTBL WHERE height > 177;
--키가 177보다 큰 것이 조건으로 고정되어 있다.
SELECT userNAME, height
FROM userTBL 
WHERE height > (SELECT height
                FROM userTBL 
                WHERE userNAME = '김경호');
-- 김경호의 키보다 큰 것을 조건으로 넣어줬다. 이때 괄호 안에 들어있는 것이 서브쿼리


/*SELECT userNAME, height
FROM userTBL 
WHERE height >= (SELECT height
                FROM userTBL 
                WHERE addr = '경남');*/
-- 오류가 나는 문장이다. 
-- 왜냐하면, 서브쿼리에서 두개이상의 값을 반환할 때는 어떤 값을 기준으로 할 것인지 명확하지 않기때문이다.
-- 위의 경우에도 김경호가 두 명이상이면 오류가 나온다.
SELECT userNAME, height
FROM userTBL 
WHERE height >= ANY (SELECT height
                    FROM userTBL 
                    WHERE addr = '경남');
-- 이럴 때 서브쿼리 앞에 붙여주는 것이 ANY와 ALL이다.
-- ANY는 둘 이상의 반환값 중 어느 하나에라도 만족하는 것을 의미하고
-- ALL은 둘 이상의 반환값을 모두 만족시키는 것을 의미한다.
-- ANY는 SOME과 기능이 같다. >=ANY 와 >=SOME은 같다.
SELECT userNAME, height
FROM userTBL 
WHERE height >= ALL (SELECT height
                    FROM userTBL 
                    WHERE addr = '경남');
                    
                    
SELECT userNAME, height
FROM userTBL 
WHERE height = ANY (SELECT height
                    FROM userTBL 
                    WHERE addr = '경남');
-- =ANY와 IN은 같은 의미로 사용된다.
SELECT userNAME, height
FROM userTBL 
WHERE height IN (SELECT height
                    FROM userTBL 
                    WHERE addr = '경남');
                    
                    

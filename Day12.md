# Day 12

### 2.1 데이터베이스 모델링 개념

- 데이터베이스 모델링(또는 데이터 모델링)
  - 현 세계에서 사용되는 직업이나 사물들을 DBMS의 데이터베이스 개체로 옮기기 위한 과정
  - 현실에서 쓰이는 것(Entity)을 테이블로 변경하기 위한 과정



### SQL문의  기본적인 문법

- SELECT FROM WHERE

``` sql
SELECT 불러올 열이름(필드 이름)
FROM 테이블 이름
WHERE 조건식;
--예시
SELECT * -- *은 전부
FROM userTBL 
WHERE userNAME='장정훈';
-- userTBL이라는 테이블에서 userNAME의 값으로 '장정훈'을 갖는 행들의 모든 값을 가져와라.
```



- 조건/관계 연산자의 사용

> ('=', '<', '>', '<=', '>=', '<>', '!=' 등) / (NOT, OR, AND 등)

``` sql
--예시
SELECT userID, userNAME
FROM userTBL 
WHERE birthYEAR >= 1970 AND height >= 182;
-- userTBL에서 1970년도 이후 출생이고 키가 182이상인 사람의 userID와 userNAME을 가져와라.
SELECT userID, userNAME
FROM userTBL 
WHERE birthYEAR >= 1970 OR height >= 182;
-- userTBL에서 1970년도 이후 출생했거나, 키가 182이상인 사람의 userID와 userNAME을 가져와라.
```



- BETWEEN AND

> 연속적인 값을 출력할 때 사용된다. 연속적이지 않을 때 사용할 수 없다.

``` sql
SELECT userNAME, height 
FROM userTBL
WHERE height >= 180 AND height <= 183;
-- userTBL에서 키가 180이상, 183이하인 사람의 userNAME과 height를 가져와라.
SELECT userNAME, height 
FROM userTBL
WHERE height BETWEEN 180 AND 183;
-- 위와 같은 의미로 사용된다.
```



- IN()

> 연속적이지 않은 값을 찾을 때

``` SQL
SELECT userNAME, addr
FROM userTBL
WHERE addr='경남' OR addr='전남' OR addr='경북';
-- userTBL에서 주소가 경남, 전남, 경북 중에 해당되는 사람의 userNAME과 addr를 가져와라.
SELECT userNAME, addr
FROM userTBL
WHERE addr IN('경남','전남','경북');
-- 위와 같은 의미로 사용된다.
```



- LIKE

> 문자열의 내용을 검색하고자 할 때

``` SQL
SELECT userNAME, height
FROM userTBL
WHERE userNAME LIKE '김%';
-- userTBL의 userNAME에서 앞에 '김'이 붙어있기만 하면 뒤에 무엇이 와도 상관없이 찾아서 해당하는 userNAME과 height를 가져와라.
-- 즉, %는 무엇이든으로 사용된다. 리눅스에서의 *.txt와 비슷한 맥락.
SELECT userNAME, height
FROM userTBL
WHERE userNAME LIKE '_종신';
-- 한글자만 매치시키기 위해서는 _ 언더바를 사용한다.
-- 위 같은 상황에서는 김종신 윤종신 박종신이 있으면 셋 모두의 이름과 키를 출력한다.
-- 단, 선우종신이 있으면 출력하지 못한다.
-- 반대로 '__종신'으로 언더바가 두개가 있으면, 선우종신의 이름과 키만 출력하고 김종신 윤종신 박종신은 출력하지 못한다.
```



#### ANY/ALL/SOME 그리고 서브쿼리(SubQuery, 하위커리)

- 서브쿼리

> 서브쿼리: 쿼리문 안의 쿼리문

``` sql
SELECT userNAME, height 
FROM userTBL 
WHERE height > 177;
-- 177 초과된 사람을 뽑아보고자 할 때
SELECT userNAME, height 
FROM userTBL 
WHERE height > (SELECT height 
                FROM userTBL 
                WHERE userNAME = '김경호');
-- 위의 177처럼 고정된 값이 아니라 표본을 이용하여 뽑아주고자 할 때
-- 키가 177인 김경호를 불러와서 표본으로 비교하였다.
SELECT userNAME, height 
FROM userTBL 
WHERE height >= (SELECT height 
                FROM userTBL 
                WHERE addr = '경남');
-- 위처럼 표본이 여러개가 나오는 경우에는 오류가 발생한다.
-- 왜냐하면, 서브쿼리에서 두개이상의 값을 반환할 때는 어떤 값을 기준으로 할 것인지 명확하지 않기때문이다.
```



- ANY/SOME

> 조건에 만족하는 모든 자료를 출력하도록 해준다. => 둘 이상의 반환값 중 어느 하나에라도 만족하는 것.

``` sql
SELECT rownum, userNAME, height
FROM userTBL
WHERE height >= ANY (SELECT height 
                	FROM userTBL 
                	WHERE addr = '경남');
-- 주소가 '경남'인 유저의 키를 표본으로 이보다 크거나 같은 모든 자료를 가져오고자 한다. / 이때, SOME은 ANY와 완전히 같은 의미로 사용된다.
SELECT rownum, userNAME, height
FROM userTBL
WHERE height = ANY (SELECT height 
                	FROM userTBL 
                	WHERE addr = '경남');
-- 위는 주소가 '경남'인 유저의 키와 같은 자료만 출력하는 것인데, 이때의 '=ANY()'는 'IN()'과 같은 의미로 사용한다.
-- 위,아래의 쿼리문은 같은 의미이다.
SELECT rownum, userNAME, height
FROM userTBL
WHERE height IN (SELECT height 
                	FROM userTBL 
                	WHERE addr = '경남');
```



- ALL

> 모든 조건에 만족하는 자료만 출력하도록 해준다. => 둘 이상의 반환값을 모두 만족시키는 것.

``` sql
SELECT rownum, userNAME, height
FROM userTBL
WHERE height >= ALL (SELECT height 
                	FROM userTBL 
                	WHERE addr = '경남');
-- 모든 조건을 만족하기 위해서, 주소가 '경남'인 유저 중 제일 키가 큰사람의 키보다 크거나 같은 사람을 출력하도록 한다.
```



- ORDER BY

> 결과물에 대해 영향을  미치지 않지만, 결과가 출력되는 순서를 정한다. 기본값(디폴트 값)은 ASC로 오름차순 정렬이다. / DESC은 내림차순을 의미한다.

``` SQL
SELECT userNAME, mDATE
FROM userTBL
ORDER BY mDATE; -- ORDER BY mDATE ASC;와 같다 디폴트값이 ASC이다.
-- mDATE(가입일)을 기준으로 유저이름과 가입일을 오름차순 정렬(먼저 가입한 순서)로 출력한다.
SELECT userNAME, mDATE
FROM userTBL
ORDER BY mDATE DSEC;
-- mDATE(가입일)을 기준으로 유저이름과 가입일을 내림차순 정렬(나중에 가입한 순서)로 출력한다.
SELECT userNAME, height
FROM userTBL
ORDER BY height DESC, userNAME ASC;
-- 두 개의 기준으로 정렬을 하는 구문이다. 앞에 나와있는 height의 영향으로 키를 우선으로 내림차순 정렬을 하고 키가 같은 사람들끼리는 이름을 기준으로 오름차순으로 정렬한다.
```

> ORDER BY 절은 SELECT, FROM, WHERE, GROUP BY, HAVING의 뒤에 나와야 한다.



- DISTINCT

> 출력하고자 하는 자료에서 중복을 제외하고 보여준다.

``` sql
SELECT ADDR
FROM USERTBL
ORDER BY ADDR;
-- 위 구문으로 경기, 경기, 경남, 경남, 경북, 서울, 서울, 서울, 서울, 전남이 출력됐다고 했을 때,
SELECT DISTINCT ADDR
FROM USERTBL
ORDER BY ADDR;
-- SQL문을 출력하면 중복을 제외하여 경기, 경남, 경북, 서울, 전남이 출력된다.
```



- CREATE TABLE --- AS SELECT ---

> 테이블을 복사해서 사용할 때 주로 사용되는 쿼리문이다. SELECT절로 출력된 자료들로 새로운 테이블을 생성한다.

``` sql
CREATE TABLE BUYTBL2 AS(SELECT * FROM buytbl);
-- buytbl의 모든 자료를 바탕으로 BUYTBL2를 생성한다.
CREATE TABLE BUYTBL3 AS(SELECT useid, prodname 
                        FROM buytbl);
-- buytbl의 useid와 prodname의 자료를 가지고 BUYTBL3를 생성한다.
```

> 이렇게 복사 된 테이블은 PK(기본키)와 FK(외래키) 등의 제약조건은 복사되지 않는다. 
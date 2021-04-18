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



- ANY/ALL/SOME 그리고 서브쿼리(SubQuery, 하위커리)

> 쿼리문 안의 쿼리문

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

```




SELECT *
FROM employees;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME 
FROM DEPARTMENTS;

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS;

CREATE TABLE userTBL--ȸ�����̺�
(
    userID CHAR(8) NOT NULL PRIMARY KEY, -- ����� ���̵�(PK)
    userNAME NVARCHAR2(10) NOT NULL, -- �̸�
    birthYEAR NUMBER(4) NOT NULL, -- ����⵵
    addr NCHAR(2) NOT NULL, -- ����(����, ��� �� 2����)
    mobil1 CHAR(3),-- �޴��� ���ڸ� ���ڸ�
    mobile2 CHAR(8), -- �޴��� ��ȣ 8�ڸ� - ����
    height NUMBER(3), --Ű
    mDATE DATE -- ȸ��������

);

CREATE TABLE BUYTBL
(
    idNUM NUMBER(8) NOT NULL PRIMARY KEY, -- ����(PK)
    useID CHAR(8) NOT NULL, -- ���̵�(FK)
    prodNAME NCHAR(6) NOT NULL, -- ��ǰ�̸�
    groupNAME NCHAR(4), --�з�
    price NUMBER(8) NOT NULL, -- �ܰ�
    amount NUMBER(3) NOT NULL, --����
    FOREIGN KEY (useID) REFERENCES userTBL(userID)
    --�Ϻη� å�� �ٸ��� �ۼ���. 
    -- ���⼭�� useID�� useTBL���� userID�� �����Ѵٴ� ��.
);

INSERT INTO USERTBL VALUES('LSG', '�̽±�', 1987, '����', '011', '11111111', 182, '2008-8-8');
INSERT INTO USERTBL VALUES('KBS', '�����', 1979, '�泲', '011', '22222222', 173, '2012-4-4');
INSERT INTO USERTBL VALUES('KKH', '���ȣ', 1971, '����', '019', '33333333', 177, '2007-7-7');
INSERT INTO USERTBL VALUES('JYP', '������', 1950, '���', '011', '44444444', 166, '2009-4-4');
INSERT INTO USERTBL VALUES('SSK', '���ð�', 1979, '����', NULL,      NULL,   186, '2013-12-12');
INSERT INTO USERTBL VALUES('LJB', '�����', 1963, '����', '016', '66666666', 182, '2009-9-9');
INSERT INTO USERTBL VALUES('YJS', '������', 1969, '�泲', NULL,      NULL,   170, '2005-5-5');
INSERT INTO USERTBL VALUES('EJW', '������', 1972, '���', '011', '88888888', 174, '2014-3-3');
INSERT INTO USERTBL VALUES('JKW', '������', 1965, '���', '018', '99999999', 172, '2010-10-10');
INSERT INTO USERTBL VALUES('BBK', '�ٺ�Ŵ', 1973, '����', '010', '00000000', 176, '2013-5-5');

CREATE SEQUENCE idSEQ; --������ȣ �Է��� ���ؼ� ������ ����
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'KBS', '�ȭ', NULL, 30, 2);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'KBS', '��Ʈ��', '����', 1000, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'JYP', '�����', '����', 200, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '�����', '����', 200, 5);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'KBS', 'û����', '�Ƿ�', 50, 3);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '�޸�', '����', 80, 10);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'SSK', 'å', '����', 15, 5);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'EJW', 'å', '����', 15, 2);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'EJW', 'û����', '�Ƿ�', 50, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '�ȭ', NULL, 30, 2);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'EJW', 'å', '����', 15, 1);
INSERT INTO buytbl VALUES(idSEQ.NEXTVAL, 'BBK', '�ȭ', NULL, 30, 2);

SHOW DATABASES;
DROP DATABASE IF EXISTS t1;
CREATE DATABASE t1;
USE t1;

CREATE TABLE article(
id INT(5),
title CHAR(100),
`body` TEXT
);

INSERT INTO article
SET id = 1,
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET id = 2,
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET id = 3,
title = '제목3',
`body` = '내용3';

UPDATE article SET title = 'aaa', `body` = 'bbb';

SELECT *
FROM article;

SELECT *
FROM article
WHERE id = 1;

UPDATE article SET title = '제목1' WHERE id = 1;

SELECT *
FROM article;

SELECT *
FROM article
WHERE id = 2;

SELECT *
FROM article
WHERE id = 3;

DELETE FROM article;

INSERT INTO article
SET id = 1,
title = '제목1',
`body` = '내용1'

INSERT INTO article
SET id = 2,
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET id = 3,
title = '제목3',
`body` = '내용3';

SELECT * FROM article WHERE id = 1;
DELETE FROM article WHERE id = 1;

SELECT * FROM article WHERE `body` = '내용3';
DELETE FROM article WHERE `body` = '내용3';

DROP DATABASE IF EXISTS t1
SHOW DATABASES;
CREATE DATABASE t1;
SHOW DATABASES;

CREATE TABLE article(
title CHAR(100),
`body` TEXT 
);

DESC article;

INSERT INTO article
SET title = '제목1',
`body` = '내용1';

SELECT *
FROM article;

ALTER TABLE article ADD COLUMN id INT(5);

SELECT *
FROM article;

UPDATE article SET
id = 1;

SELECT *
FROM article;

UPDATE article
SET id = 2
LIMIT 1;

SELECT *
FROM article;

INSERT INTO article
SET id = 3,
title = '제목3',
`body` = '내용3';

SELECT *
FROM article;

DELETE FROM article

SELECT *
FROM article;

DROP DATABASE IF EXISTS t1;
CREATE DATABASE t1;

USE t1;

CREATE TABLE article(
id INT(5),
title CHAR(100),
`body` TEXT
);

ALTER TABLE article MODIFY id INT(5) NOT NULL;

SELECT *
FROM article;

INSERT INTO article
SET title = '제목2',
`body` = '내용2';

SELECT *
FROM article;

ALTER TABLE article MODIFY id INT(5) NOT NULL UNIQUE;

UPDATE article
SET id = 1
LIMIT 1;
ALTER TABLE article MODIFY id INT(5) NOT NULL UNIQUE;

SELECT *
FROM article;

DROP DATABASE IF EXISTS t1;
CREATE DATABASE t1;
USE t1;

CREATE TABLE article(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
title CHAR(100),
`body` TEXT
);

DESC article;

INSERT INTO article
SET title = '제목1',
`body` = '내용1';

SELECT *
FROM article;

ALTER TABLE article MODIFY title CHAR(100) NOT NULL;
ALTER TABLE article MODIFY `body` TEXT NOT NULL;

DROP DATABASE IF EXISTS t1;
CREATE DATABASE t1;
USE t1;

# 전체 데이터베이스 조회
SHOW DATABASES;
# `mysql` 데이터 베이스 선택
USE mysql;
# 테이블 조회
SHOW TABLES;
# `db` 테이블의 구조 확인
DESC db;
# 기존에 `board` 데이터베이스가 존재 한다면 삭제
DROP DATABASE IF EXISTS board;
# 새 데이터베이스(`board`) 생성
CREATE DATABASE board;
# 데이터베이스 추가 되었는지 확인
SHOW DATABASES;
# `board` 데이터 베이스 선택
USE board;
# 테이블 조회
SHOW TABLES;
# 게시물 테이블(`article`) 생성.(칼럼은 제목, 내용만 작성)
CREATE TABLE article(
title CHAR(100),
`body` TEXT
);
# 잘 추가되었는지 확인
SHOW TABLES;
# 제목 : 제목1, 내용 : 내용1 데이터 하나 추가 
INSERT INTO article 
SET title = '제목1',
`body` = '내용1';
# 제목 조회
SELECT title 
FROM article;
# 내용 조회
SELECT `body`
FROM article;
# 제목, 내용 칼럼 데이터 조회
SELECT title, `body`
FROM article;
# 내용, 제목 칼럼 데이터 조회
SELECT `body`, title
FROM article;
# 모든 데이터 조회
SELECT *
FROM article;
# 제목 : 제목1, 내용 : 내용1 데이터 또 하나 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1';
# 데이터 조회(게시물 구분 안됨)
SELECT *
FROM article;
# 테이블 구조 수정
# 게시물을 구분하기 위해 id 칼럼을 추가.
ALTER TABLE article ADD COLUMN id INT(5);
# 데이터 조회(새로 생긴 id 칼럼의 값은 NULL)
SELECT *
FROM article;
# 기존 데이터의 id값 1로 수정
UPDATE article 
SET id = 1;
# 데이터 조회(둘다 수정되어 버림..)
SELECT *
FROM article;
# 기존 데이터 중 1개만 id를 2로 변경
UPDATE article
SET id = 2
LIMIT 1;
# 데이터 조회
SELECT *
FROM article;
# id 없이 데이터 1개 추가
INSERT INTO article
SET title = '제목2',
`body` = '내용2';
# 데이터 조회
SELECT *
FROM article;
# id가 NULL인 데이터 생성이 가능하네?
# id 데이터는 꼭 필수 이기 때문에 NULL을 허용하지 않게 바꾼다.
# 기존의 NULL값 때문에 경고가 뜬다.
# 기존의 NULL값이 0으로 바뀐다.
ALTER TABLE article MODIFY id INT(5) NOT NULL;
# id값 없이 제목3, 내용3 게시물 추가
INSERT INTO article
SET title = '제목2',
`body` = '내용2';
# id값 없이 제목3, 내용3 게시물 한번 더 추가
INSERT INTO article
SET title = '제목3',
`body` = '내용3';

SELECT *
FROM article;
# id가 0인 게시물이 두개 이상 만들어진다. 이러면 id로 구별이 안된다.
# 생각해 보니 모든 행(row)의 id 값은 유니크 해야한다. 
# alter를 이용해 id 칼럼의 옵션에 null 허용하지 않음과 유니크 옵션 붙이기. (not null + unique = primary key)
ALTER TABLE article MODIFY id INT(5) NOT NULL UNIQUE;
# 위 실행은 오류가 난다. 왜냐하면 기존의 데이터 중에서 중복되는 값이 있다.
UPDATE article
SET id = 1
LIMIT 1;
ALTER TABLE article MODIFY id INT(5) NOT NULL UNIQUE;
# 이러한 문제로 테이블을 생성할 때 primary key를 설정하고 생성하는 것이 좋다.
DROP DATABASE IF EXISTS t1;
CREATE DATABASE t1;
USE t1;
# article 테이블 만들기 (id, title, body) - id는 primary key 등록, auto_increment 옵션 추가
CREATE TABLE article(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
title CHAR(100),
`body` TEXT
);
# title = '제목2', body = '내용2' 데이터 하나 추가
INSERT INTO article
SET title = '제목2',
`body` = '내용2';
# title = '제목3', body = '내용3' 데이터 하나 추가
INSERT INTO article
SET title = '제목3',
`body` = '내용3';
# title = '제목1', body = '내용1' 데이터 하나 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1';
# 모든 데이터 조회
SELECT *
FROM article;
# 모든 데이터 id로 오름차순 정렬 조회
SELECT *
FROM article
ORDER BY id ASC;
# 모든 데이터 id로 내림차순 정렬 조회
SELECT *
FROM article
ORDER BY id DESC;
# title = '제목1', body = '내용1' 데이터 하나 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1';
# title = '제목2', body = '내용2' 데이터 하나 추가
INSERT INTO article
SET title = '제목2',
`body` = '내용2';
# 모든 게시물의 제목을 aaa로, 내용을 bbb로 변경
UPDATE article SET title = 'aaa', `body` = 'bbb';
# 1번 게시물만 조회
SELECT *
FROM article
WHERE id = 1;
# 1번 게시물의 제목을 제목1으로 변경
UPDATE article SET title = '제목1' WHERE id = 1;
# 2번 게시물만 조회
SELECT *
FROM article
WHERE id = 2;
# 2번 게시물의 내용을 내용2으로 변경
UPDATE article SET `body` = '내용2' WHERE id = 2;
# 3번 게시물만 조회
SELECT *
FROM article
WHERE id = 3;
# 3번 게시물의 제목을 제목3, 내용을 내용3으로 변경
UPDATE article SET title = '제목3', `body` = '내용3';
# 모든 게시물 데이터 삭제
DELETE FROM article;
# id = 1, title = '제목1', body = '내용1' 데이터 하나 추가
INSERT INTO article
SET id = 1,
title = '제목1',
`body` = '내용1';
# id = 2, title = '제목2', body = '내용2' 데이터 하나 추가
INSERT INTO article
SET id = 2,
title = '제목2',
`body` = '내용2';
# id = 3, title = '제목3', body = '내용3' 데이터 하나 추가
INSERT INTO article
SET id = 3,
title = '제목3',
`body` = '내용3';
# id가 1인 게시물 삭제
SELECT * FROM article WHERE id = 1;
# 제목이 제목2인 게시물 삭제
SELECT * FROM article WHERE title = '제목2';
# 내용이 내용3인 게시물 삭제
SELECT * FROM article WHERE `body` = '내용3';
# 나머지 모든 컬럼에 not null 제약 걸기
ALTER TABLE article MODIFY title CHAR(100) NOT NULL;
ALTER TABLE article MODIFY `body` TEXT NOT NULL;
# id에 unsigned 제약 걸기
ALTER TABLE article MODIFY id INT(5) UNSIGNED NOT NULL AUTO_INCREMENT;
# 작성자(writer) 칼럼을 title 칼럼 다음에 추가.
SELECT * FROM article;
ALTER TABLE article ADD writer CHAR(50) NOT NULL;
DESC article;
SELECT *
FROM article;
# 작성자(writer) 칼럼의 이름을 nickname 으로 변경.
ALTER TABLE article CHANGE writer nickname CHAR(50);
DESC article;
# nickname 칼럼의 위치를 body 밑으로 보내주세요.
ALTER TABLE article MODIFY nickname CHAR(50) NOT NULL AFTER `body`;
# hit 조회수 칼럼 추가.
ALTER TABLE article ADD hit INT(5) NOT NULL;
# 테스트 데이터 추가

INSERT INTO article
SET title = '제목1',
`body` = '내용1',
nickname = '유저1',
hit = 20;

INSERT INTO article
SET title = '제목2',
`body` = '내용2',
nickname = '유저2',
hit = 30;

INSERT INTO article
SET title = '제목3',
`body` = '내용3',
nickname = '유저3',
hit = 10;

# 데이터 추가
INSERT INTO article
SET title = '제목4',
`body` = '내용4',
nickname = '유저4',
hit = 55;

# 데이터 추가
INSERT INTO article
SET title = '제목5',
`body` = '내용5',
nickname = '유저5',
hit = 10;

# 데이터 추가
INSERT INTO article
SET title = '제목6',
`body` = '내용6',
nickname = '유저6',
hit = 100;

SELECT *
FROM article;

USE t1;

SELECT title, `body`
FROM article;

CREATE TABLE test(
    `body` TEXT NOT NULL
);

INSERT INTO test
SET `body` = 'aaa';

SELECT * FROM test;

SHOW DATABASES;

USE mysql;

SHOW TABLES;

DESC db;

DROP DATABASE IF EXISTS board;

CREATE DATABASE board;

SHOW DATABASES;

USE board;

SHOW TABLES;

CREATE TABLE article(
title CHAR(100),
`body` TEXT
);

SHOW TABLES;

INSERT INTO article
SET title = 'aaa',
`body` = 'bbb';

SELECT title
FROM article;

SELECT `body`
FROM article;

SELECT *
FROM article;

UPDATE article SET title = 'aaa', `body` = 'bbb';

SELECT *
FROM article;

SELECT *
FROM article
WHERE id = 1;

INSERT INTO article
SET id = 3,
title = '제목3',
`body` = '내용3';

CREATE TABLE article(
id INT(5),
title CHAR(100),
`body` TEXT
);

UPDATE article SET id INT(5);

DELETE FROM article;

SELECT *
FROM article;

ALTER TABLE article MODIFY id INT(5);

ALTER TABLE article ADD id INT(5);

INSERT INTO article
SET title = '제목1',
`body` = '내용1',
id = 1;

SELECT *
FROM article;

ALTER TABLE article MODIFY title CHAR(100) AFTER id;

SELECT *
FROM article;

INSERT INTO article
SET title = '제목2',
`body` = '내용2';

SELECT *
FROM article;

ALTER TABLE article MODIFY id INT(5) UNSIGNED NOT NULL AUTO_INCREMENT;

INSERT INTO article
SET id = 2,
title = '제목3',
`body` = '내용3';

SELECT *
FROM article
ORDER BY id ASC;

UPDATE article
SET id = 3
LIMIT 1;

SELECT *
FROM article;

SHOW TABLES;

SELECT *
FROM article;

UPDATE article SET title = '제목1';

SELECT *
FROM article;

DELETE FROM article
WHERE id = 3;

# 번호, 제목, 내용, 등록날짜
# DB 구조 짜기

CREATE TABLE t_article(
    id INT(5) PRIMARY KEY AUTO_INCREMENT,
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL,
    regDate DATETIME NOT NULL
);

DESC t_article;

SELECT *
FROM t_article;

SELECT NOW();

# 추가
INSERT INTO t_article
SET title = 'aaa',
`body` = 'bbb',
regDate = NOW();

# 조회
SELECT *
FROM t_article;

# 수정
UPDATE t_article
SET title= 'ccc',
`body` = 'ddd'
WHERE id = 1;

# 삭제
DELETE
FROM t_article
WHERE id = 1;

SELECT *
FROM t_article;

SELECT DATABASE(`board`);

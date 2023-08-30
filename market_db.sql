DROP DATABASE IF EXISTS market_db; -- 만약 market_db가 존재하면 우선 삭제한다.
CREATE DATABASE market_db;

USE market_db;
CREATE TABLE member -- 회원 테이블
( mem_id  		CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PrimaryKey)
  mem_name    	VARCHAR(10) NOT NULL, -- 이름
  mem_number    INT NOT NULL,  -- 인원수
  addr	  		CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  phone1		CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2		CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 평균 키
  debut_date	DATE  -- 데뷔 일자
);
CREATE TABLE buy -- 구매 테이블
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PrimaryKey) 자동으로 증가하는 값을 가지는 Auto Increment 열
   mem_id  	CHAR(8) NOT NULL, -- 아이디(ForeignKey)
   prod_name 	CHAR(6) NOT NULL, --  제품이름
   group_name 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 가격
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

SELECT * FROM member;
SELECT * FROM buy;

-- 멤버 인원이 4명인 걸그룹의 모든 정보를 검색
select * from member where mem_number=4;

-- 평균키 165이상 이면서 멤버 인원이 6명 초과인 걸그룹의 모든 정보를 검색 
select * from member where height >=165 and mem_number>6;

-- 평균키가 165이상이거나 멤버 인원이 6명 초과인 걸그룹의 이름, 키,멤버인원을 검색
select mem_name,height,mem_number from member where height>=165 or mem_number>6;

-- 평균키가 163부터 165까지 걸그룹의 이름과 평균키를 between 이용해서 검색
select mem_name,height from member where height between 163 and 165;

-- 주소가 경기나 전남이나 경남인 걸그룹의 멤버이름과 주소를 검색 단 in을 이용
select mem_name, addr from member where  addr in('경기','전남','경남');

-- 멤버이름이 핑크로 끝나는 걸그룹의 모든 정보를 검색
select * from member where mem_name like '%핑크';

-- 멤버이름이 에이핑크인 회원의 평균키보다 큰 걸그룹의 멤버이름,평균키를 검색
-- 서브쿼리 사용
select mem_name, height from member where height > (select height from member where mem_name='에이핑크');  

-- '$$' 범위 안 코드들이 ';' 만나기 전까지 한번에 실행된다. 
delimiter $$ 
create procedure user_pro1(
	in userName varchar(10)
)
begin
	select * from member where mem_name=userName;
end $$ 
delimiter ; 
call user_pro1('블랙핑크');

-- 프로시저 이름 user_pro2
-- 멤버 인원수와 멤버키를 입력받아
-- 입력받은 숫자보다 큰 멤버의 모든 정보를 출력

drop procedure if exists user_pro2;
delimiter //
create procedure user_pro2(
	in userNum int,
	in userHeight int
)
begin
	select * from member where mem_number > userNum
    and height > userHeight;
end //
delimiter ;

call user_pro2(4,160);



create table if not exists member2(
	id int auto_increment primary key, -- 자동으로 증가하는 순번
    txt char(10)
);

drop procedure if exists user_pro3;
delimiter //
create procedure user_pro3(
	in txtValue char(10),
    out outValue int
)
begin
	insert into member2 values(null,txtValue); -- null 왜 넣었는지 못들었음..
	select max(id) into outValue from member2;
end //
--  txtValue를 member2 테이블에 삽입한 후, 삽입된 행의 id 중 최대값을 outValue로 출력
delimiter ;

call user_pro3('핑클',@myValue); -- 결과를 myValue로 받는다
call user_pro3('원더걸스',@yourValue);
select @myValue as '순번 출력';
select @yourValue as '순번 출력';
select * from member2;

-- 데뷔 연도가 2015년 이전(2015년 포함 x)이면 "프로 가수"
-- 데뷔 연도가 2015년 이후(2015년 포함)이면 "신인 가수"를 출력하는
-- 프로시저를 생성 프로시저 이름 : user_pro4
-- 사용자가 걸그룹 이름을 입력하면 결과를 출력 

drop procedure if exists user_pro4;
delimiter //
create procedure user_pro4 (
	in userName char(10), 
    out userResult char(20)
)
begin
	declare debutYear int;
    select year(debut_date) into debutYear from member
    where mem_name = userName; 
    -- member 테이블에서 mem_name 값이 userName과 일치하는 행을 찾아서
    -- 해당 행의 debut_date 필드 값을 년도로 변환한 후, 
    -- 그 값을 debutYear 변수에 저장
	if(debutYear>=2015) then
		set userResult = "신인 가수";
	else 
		set userResult = "프로 가수";
	end if;
end //
delimiter ;

call user_pro4('오마이걸',@result);
select @result as 결과;

-- procedure 사용해서 1부터 100까지합계 출력

drop procedure if exists user_pro5;
delimiter //
create procedure user_pro5(

)
begin
	declare sum int;
    declare num int;
    set sum=0;
    set num=1;
    
	while (num <=100) do
		set sum = sum+num;
		set num = num+1;
	end while;
	select sum as '합계결과';
end //
delimiter ;

call user_pro5();

-- member 테이블에서 멤버 아이디, 멤버 이름, 데뷔 일자를 출력하되
-- 데뷔 일자의 오름차순으로 출력
select mem_id, mem_name,debut_date 
from member order by debut_date;

-- member 테이블에서 멤버 아이디, 멤버 이름, 데뷔 일자, 키를 출력하되
-- 키가 164이상인 데이터에 대해서 키의 내림차순으로 출력
select mem_id, mem_name,debut_date, height from member 
where height >=164 order by height desc;

-- member 테이블에서 멤버 이름, 데뷔 일자를 출력하되
-- 키의 내림차순으로 하여 3개만 출력
select mem_name,debut_date from member 
order by height desc limit 3;

-- buy 테이블에서 멤버 아이디별로 묶어서
-- 멤버 아이디, 구입 수량의 합계를 구하세요
select (mem_id) as "멤버 아이디" , sum(amount) as "구입 수량의 합계" from buy 
group by mem_id;

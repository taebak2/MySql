create database univDB;
use univDB;

create table 학생(
    학번 char(4) not null,
    이름 varchar(20) not null,
    주소 varchar(50) null default "미정",
    학년 int not null,
    나이 int null,
    성별 char(1) not null,
    휴대폰번호 char(14) null,
    소속학과 varchar(20) null,
    primary key(학번)
);

create table 과목 (
    과목번호 char(4) not null primary key,
    이름 varchar(20) not null,
    강의실 char(3) not null,
    개설학과 varchar(20) not null,
    시수 int not null
);




create table 수강(
    학번 char(6) not null,
    과목번호 char(4) not null,
    신청날짜 date not null,
    중간성적 int null default 0,
    기말성적 int null default 0,
    평가학점 char(1) null,
    primary key(학번,과목번호)
);

-- 사용자 계정 생성
CREATE user 'manager' identified by '1234';

-- 사용자 계정 권한 부여
grant all on *.* to 'manager';


insert into 학생 values('s001','김연아','서울 서초', 4, 23, '여', '010-1111-2222', '컴퓨터');
insert into 학생 values('s002','홍길동',DEFAULT, 1, 26, '남', NULL, '통계');
insert into 학생 values('s003','이승엽',NULL, 3, 30, '남', NULL, '정보통신');
insert into 학생 values('s004','이영애','경기 분당', 2, NULL, '여', '010-4444-5555', '정보통신');
insert into 학생 values('s005','송윤아','경기 분당', 4, 23, '여', '010-6666-7777', '컴퓨터');
insert into 학생 values('s006','홍길동','서울 종로', 2, 26, '남', '010-8888-9999', '컴퓨터');
insert into 학생 values('s007','이은진','경기 과천', 1, 23, '여', '010-2222-3333', '경영');

-- 만약 잘못 삽입한 경우는  
-- delete from 학생;  명령문으로 모두 삭제 후 삽입 다시 실행

-- insert 정식 구문
-- insert into 학생(학번,이름,주소,학년,나이,성별,휴대폰번호,소속학과) values(값....);


insert into 과목 values('c001', '데이터베이스', '126', '컴퓨터', 3);
insert into 과목 values('c002', '정보보호', '137', '정보통신', 3);
insert into 과목 values('c003', '모바일웹', '128', '컴퓨터', 3);
insert into 과목 values('c004', '철학개론', '117', '철학', 2);
insert into 과목 values('c005', '전공글쓰기', '120', '교양학부', 1);


insert into 수강 values('s001', 'c002', '2019-09-03', 93, 98, 'A');
insert into 수강 values('s004', 'c005', '2019-03-03', 72, 78, 'C');
insert into 수강 values('s003', 'c002', '2017-09-06', 85, 82, 'B');
insert into 수강 values('s002', 'c001', '2018-03-10', 31, 50, 'F');
insert into 수강 values('s001', 'c004', '2019-03-05', 82, 89, 'B');
insert into 수강 values('s004', 'c003', '2020-09-03', 91, 94, 'A');
insert into 수강 values('s001', 'c005', '2020-09-03', 74, 79, 'C');
insert into 수강 values('s003', 'c001', '2019-03-03', 81, 82, 'B');
insert into 수강 values('s004', 'c002', '2018-03-05', 92, 95, 'A');

desc 과목;
select * from 과목;

use univdb;

select 학번,이름 from 학생;

select 소속학과 from 학생;

-- 학생 테이블에서 중복된 데이터를 제거한 소속학과를 출력
select DISTINCT 소속학과 from 학생;   

-- 학생 테이블에서 2학년 이상이면서 컴퓨터학과 학생의 
-- 이름, 학년, 소속학과, 휴대폰번호를 검색
select 이름,학년,소속학과,휴대폰번호 from 학생 where 학년>=2 and 소속학과='컴퓨터';

select 이름,학년,소속학과 from 학생 
where 소속학과='컴퓨터' or 소속학과='정보통신' ORDER BY 학년 asc;
-- select 이름,학년,소속학과 from 학생  
-- where 소속학과='컴퓨터' or '정보통신' ORDER BY 학년 desc;

select count(*) from 학생; 
-- 전체 학생 수
select count(학번) from 학생; 
-- 전체 학번 갯수 
select count(주소) from 학생; 
-- 전체 주소 갯수, 갯수 count 할때 null값은 count x
select * from 학생;

select count(주소) as 학생수 from 학생; 
-- as = 화면상의 출력 이름을 바꿈 
select count(*) as 학생수1, count(주소) as 학생수2, count(Distinct 주소) as 학생수3
from 학생;

select avg(나이) '여학생 평균나이'
from 학생 where 성별='여';
-- 통계 함수 별명 부여시 as 생략 가능하나
-- 별칭에 공백이 있는 경우 반드시 작은 따옴표로 묶어줌

select avg(나이) '여학생 평균나이' from 학생 where 성별 = '여';
-- 여학생의 평균 나이 검색
select 성별,max(나이) as '최고 나이', min(나이) as'최저 나이' from 학생 group by 성별;
-- 전체 학생의 성별 최고 나이, 최저 나이 검색

select 학년, count(*) as '학년별 학생수' from 학생 group by 학년 having count(*)>=2; -- having절 
-- 각 학년별로 2명 이상의 학생을 갖는 학년에 대해서만 학년별 학생수 검색

select 학번, 이름 from 학생 where 이름 like '이__';
-- '이'씨 성을 가진 학생들의 학번과 학생 이름 검색

select 이름, 주소, 학년 from 학생 where 주소 like '%서울%' order by 학년 desc;
-- 주소지가 '서울'인 학생의 이름, 주소, 학년 내림차순 검색

select 이름, 휴대폰번호 from 학생 where 휴대폰번호 is null;
-- 휴대폰번호가 null값을 갖는 학생의 이름과 휴대폰번호 검색

-- 학생 테이블에서 연락처가 비어 있지 않은 학생들의 이름, 주소, 나이를 검색하되
-- 소속학과가 컴퓨터인 학생들만 검색하시오
select 이름,주소,나이 from 학생 where 휴대폰번호 is not null and 소속학과='컴퓨터';

select 학번 from 학생 where 성별='여' 
union 
select 학번 from 수강 where 평가학점="A";
-- union: 두 개의 select 문의 결과를 합쳐서 중복을 제외한 학번 목록을 반환

select 이름 from 학생 where 학번 in('s001','s003','s004');
-- 학번이 s001,s003,s004인 학생의 이름 
select 이름 from 학생 where 학번 in (select 학번 from 수강 where 과목번호='c002');
-- 방법 2

 -- '정보보호' 과목을 수강한 학생의 이름을 검색 (중첩 후부 질의문)
 -- in : 결과가 여러개일 때 사용 
 -- exists :하위 쿼리가 결과를 반환할 경우(행이 존재하는 경우) 참,하위 쿼리가 결과를 반환하지 않을 경우(행이 존재하지 않는 경우) 거짓만을 반환함
 
select 이름 from 학생 where 학번 in (select 학번 from 수강 where 과목번호 in(select 과목번호 from 과목 where 이름 = '정보보호'));
select 학번 from 수강 where 과목번호  = (select 과목번호 from 과목 where 이름 = '정보보호');
select 과목번호 from 과목 where 이름 = '정보보호';

select 이름 from 학생  where exists ( select * from 수강 where 수강.학번=학생.학번 and 과목번호 = 'c002');
-- 과목번호가 'c002'인 과목을 수강한 학생의 이름을 검색

select 이름 from 학생 where not exists
(select * from 수강 where 수강.학번=학생.학번);
-- 학생 중에서 한 과목도 수강하지 않은 학생의 이름 검색
-- 수강.학번 = 학생.학번 : 수강과 학생을 연결하고, 두 테이블 간에 공통된 값을 사용하여 조인을 수행 

select * from 학생; -- 7개
select * from 수강; -- 9개

select * from 학생,수강; -- 2개의 테이블을 다 가져옴 (63개)
select * from 학생,수강 where 학생.학번=수강.학번; -- 학생들의 수강 내역이 학번을 기준으로 연결되어 나타남
select 이름 from 학생,수강 where 학생.학번=수강.학번;
select distinct 이름 from 학생,수강 where 학생.학번=수강.학번; -- 중복된 이름 제거하고 1개씩만 출력 
select * from 학생 join 수강 on 학생.학번=수강.학번; -- 학생들의 정보와 해당 학생이 수강한 강좌에 관한 정보가 함께 표시

-- 학생 중에서 과목번호가 'c002'인 과목을 수강한 학생의 학번과 이름, 과목번호 그리고 변환중간성적(학생별 중간 성적의 10% 가산 점수)을 검색
select 학생.학번, 이름, 과목번호, 중간성적+(중간성적*0.1) as 변환중간성적
from 학생, 수강
where 학생.학번=수강.학번 and 과목번호 = 'c002';

select 학생.학번, 이름, 과목번호, 중간성적+(중간성적*0.1) as 변환중간성적
from 학생 join 수강 on 학생.학번=수강.학번
where 과목번호 = 'c002';

-- 정보보호 과목을 수강하는 학생들의 학번, 이름 및 과목번호를 검색
select 학생.학번,학생.이름,수강.과목번호 from (학생 join 수강 on 학생.학번=수강.학번) 
join 과목 on 수강.과목번호=과목.과목번호 where 과목.이름 = '정보보호';

create table 학생1 as (select * from 학생); -- 테이블 복사 : 학생 테이블을 복사해 학생1번 테이블을 만듬 
create table 수강1 as (select * from 수강); -- 
create table 과목1 as (select * from 과목); -- 

insert into 학생1(학번,이름,주소,학년,나이,성별,휴대폰번호,소속학과) -- 리스트
Values('g001','김연아2','서울 서초',4,23,'여','010-111-2222','컴퓨터'); -- 리스트 값 

insert into 학생1(학번,이름,학년,성별) values('g002','김연아3',4,'여');

select * from 학생1;

insert into 학생1(이름,학년,나이,성별,소속학과,학번) values('홍길동2',1,26,'남','통계','g002');

insert into 학생1(학년,나이,성별,소속학과,학번,이름)
values (3,30,'남','정보통신','g003','이승엽2');
select * from 학생1;
delete from 학생1 where 이름='김연아3';
select * from 학생1;

update 학생1 set 학년=3 where 이름='이은진';
-- 이은진 학생의 학년을 3학년으로 변경
select * from 학생1 where 이름='이은진';

update 학생1 set 학년=학년+1, 소속학과='자유전공학부'where 학년=4; 
-- 4학년 학생들의 학년을 1씩 증가시키고 소속학과를 자유전공학부로 변경
select * from 학생1;

update 학생1 set 소속학과 = null where 학번 not in (select 학번 from 수강1);
-- 수강 내용이 없는 학생의 소속학과를 null 값으로 수정
-- "학번"이 "수강1" 테이블의 학번 목록에 없는 경우에만 이 작업을 수행
select * from 학생1;

select 학번 from 학생1 where 이름='이은진';

update 수강1 set 학번 = (select 학번 from 학생1 where 이름='이은진') where 학번='s003';
select * from 수강1 where 학번='s003' or 학번='s007';

delete from 학생1 where 이름='송윤아';
select * from 학생1;
-- '송윤아' 학생의 모든 정보를 삭제

delete from 학생1 where 학년=3;
select * from 학생1;
-- '3'학년 모든 학생 정보를 삭제

delete from 과목1 
where 과목번호 in ( select 과목번호 from 수강1 group by 과목번호 having count(*) <2);
select * from 과목1;
-- 수강자가 2명 미만인 과목에 대한 과목 정보를 모두 삭제

create database chap5;

create table 과목2(
	과목번호 char(4) not null primary key,
	이름 varchar(20) not null,
	강의실 char(5) not null,
	개설학과 varchar(20) not null,
	시수 int not null
);

create table 학생2(
    학번 char(4) not null,
    이름 varchar(20) not null,
    주소 varchar(50) default '미정',
    학년 int not null,
    나이 int null,
    성별 char(1) not null,
    휴대폰번호 char(13) null,
    소속학과 varchar(20) null, -- null 생략 가능
    primary key(학번), -- 기본키 (중복 x, null 값 x)
	unique(휴대폰번호) -- 후보키 (중복 x, null 값 o)
);

desc 학생2;

show create table 학생2;

create table 수강2(
    학번 char(6) not null,
    과목번호 char(4) not null,
    신청날짜 date not null,
    중간성적 int null default 0,
    기말성적 int null default 0,
    평가학점 char(1) null,
    primary key(학번,과목번호), -- 학번과 과목번호가 동시에 같은 값을 가질때만 중복값 입력 불가 (만일 학번, 과목번호 둘 중 한 개만 중복값을 가져도 입력 불가로 만들고 싶다면 primary key를 각각 선언 해줘야 함)
			       -- 학번 값이 다르고 과목번호가 같으면 입력 가능 
    
    foreign key(학번) references 학생2(학번),
    foreign key(과목번호) references 과목2(과목번호)
	
    -- foreign key (학생2의 field중 참조하는 열) references (참조하는_테이블) (참조되는_열 = 참조하는 테이블의 primary key에 해당하는 field를 입력해줘야함)
    -- foreign key는 한 테이블의 레코드와 다른 테이블의 레코드 사이의 관계를 정의 
    -- 데이터의 변경이나 삭제가 발생할 때 이에 관련된 다른 테이블의 데이터도 처리
    -- 수강2 테이블의 과목번호 열 값은 과목2 테이블의 과목번호 열의 값 중 하나만 가질 수 있으며, 과목2 테이블에 없는 값을 참조하는 경우에는 제한이 걸림
);
select * from 수강2;

insert into 과목2 values('c111','database',A-123,'산업공학'); -- 오류(문자에 따옴표 없음)
insert into 과목2 values('c111','database','A-123','산업공학'); -- 오류(필드 5개인데 4개만 입력)
insert into 과목2 values('c111','database','A-123','산업공학',3); -- 정상

insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values('s111','박태환',4,null,'남','010-1111-1111','산업공학');
insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values('s222','박태환',2,null,'남','010-1111-1111','산업공학'); -- 학생2 테이블의 휴대폰번호 field 는 unique, 따라서 중복값 선언 불가 
insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values('s222','박태환',2,null,'남','010-2222-2222','산업공학');

insert into 수강2(학번,과목번호,신청날짜) -- 정상(학생2에 s111 존재, 과목2에 c111 존재)
values('s111','c111','2019-12-31'); 
insert into 수강2(학번,과목번호,신청날짜) -- 외래키 오류(과목2에 c222가 존재x)
values('s111','c222','2019-12-31',93,98,'A'); 
insert into 수강2(학번,과목번호,신청날짜,중간성적,기말성적,평가학점) -- 기본키 오류(학번, 과목번호가 중복된 값이 존재)
values('s111','c111','2019-12-31',93,98,'A'); 
insert into 수강2(학번,과목번호,신청날짜,중간성적,기말성적,평가학점) -- 정상
values('s222','c111','2019-12-31',93,98,'A'); 

-- 학생2(박태환 데이터 2개), 과목2(1개), 수강2(2개)
select * from 학생2;

-- create table 과목3 as (select * from 과목2);
-- 과목 2번 테이블을 복사해 과목3 테이블 생성
  
insert into 과목2 select * from 과목;
-- 과목에 있는 데이터를 과목2 테이블에 복사함 (원본 table의 colum 개수 >= 복사할 table column 개수 and 빈 column의 데이터 타입이 null값이어야 가능)

insert into 학생2 select * from 학생;
insert into 수강2 select * from 수강;
alter table 학생2 add 등록날짜 datetime not null default '2019-12-30';
-- 학생2 테이블에 "등록날짜" 열이 추가되고, 모든 레코드에는 '2019-12-30' 값을 갖는 등록날짜가 기본값으로 설정
-- alter table은 데이터베이스의 테이블을 수정하고 변경

alter table 학생2 drop column 등록날짜;
-- 학생2 테이블에서 "등록날짜"라는 열을 삭제

-- alter table 테이블 이름 change (기존이름) (신규이름) (데이터타입)(); 
-- 테이블의 필드명 변경
alter table 학생2 change 이름 학생이름 varchar(20);
select * from 학생2;

-- alter table 테이블이름 rename to (신규이름); 
-- 테이블 이름 변경
alter table 학생2 rename to 재학생2;
select * from 재학생2;

-- 과목2, 수강2, 재학생2
-- 수강2 테이블은 과목2 테이블과 재학생2 테이블을 외래키로 참조 

drop table 과목2; 
-- 수강2 테이블이 과목2 테이블을 참조하고 있으므로 삭제 안됨
drop table 수강2;
drop table 과목2;

select * from 과목2; 
-- 삭제되었기 때문에 결과 없음

-- 3학년 혹은 4학년 학생의 학생이름, 나이, 성, 학년으로 구성된 'v1_고학년학생'뷰 
create view v1_고학년학생(학생이름,나이,성,학년)
as select 이름,나이,성별,학년 
from 학생 
where 학년>=3 and 학년<=4;
-- 뷰를 통해 데이터를 수정하거나 삽입하는 작업은 기본 테이블을 직접 조작해야함
-- 뷰의 주요 목적은 데이터의 가시성과 쿼리의 재사용을 향상

select * from v1_고학년학생;

-- v2_과목수강현황 뷰는 각 과목별로 해당 과목의 과목번호, 강의실 및 수강인원수를 나타냄
create view v2_과목수강현황(과목번호,강의실,수강인원수)
as select 과목.과목번호,강의실,count(과목.과목번호)
from 과목 join 수강 on 과목.과목번호 = 수강.과목번호
group by 과목.과목번호;
-- having 절은 그룹화된 데이터에서 필터링
-- where 절은 원본 데이터에서 필터링

create view v3_고학년여학생
as select * from v1_고학년학생 where 성='여';
-- v1_고학년학생 뷰에서 성별이 여성인 고학년 학생들만을 선택하여 새로운 뷰 v3_고학년여학생을 생성
select * from v3_고학년여학생;

-- 고학년여학생 정보 검색
select * from v1_고학년학생 where 성='여';

-- 뷰를 사용하지 않고 select문으로 
-- 수강생 인원이 가장 많은 과목과 가장 적은 과목에 대한 결과를 추출

select * from v2_과목수강현황
where 수강인원수 = (select max(수강인원수) from v2_과목수강현황) or 
수강인원수 = (select min(수강인원수) from v2_과목수강현황);

drop view v1_고학년학생;

select * from v3_고학년여학생; 
-- v3는 v1을 바탕으로 만들어져서 v3는 실행 불가능 

-- 인덱스 생성
create index idx_수강 on 수강(학번,과목번호);
show index from 수강;

create unique index idx_과목 on 과목(이름 asc);
-- 테이블 값에 중복이 없는 유일한 인덱스 생성

drop index idx_수강 on 수강;
-- 인덱스 삭제
alter table 과목 drop index idx_과목;
-- 인덱스 삭제 방법2

select 학번, sum(기말성적)/count(*) as 기말평균,
-- 평균 기말 시험 점수를 계산하기 위해 기말 시험 점수의 합을 레코드 수로 나눔
round(sum(기말성적)/count(*),2) as 기말평균2
-- 기말평균 반올림하여 소수점 2자리까지 표시
-- ROUND 함수는 주어진 숫자를 지정한 소수점 자릿수로 반올림하는 데 사용되는 SQL 함수
from 수강 group by 학번;

select length(소속학과), right(학번,2), 
repeat('*',나이), concat(소속학과,'학과')
from 학생;
-- length 문자열의 길이 수 반환(한글은 2개씩 반환)
-- 일반적으로 대부분의 데이터베이스 시스템에서는 문자열 길이를 계산할 때, 문자 인코딩에 따라 각 문자의 바이트 수가 다르게 적용 
-- 한글은 UTF-8 인코딩에서 일반적으로 3바이트로 표현
-- right 함수는 문자열의 오른쪽부터 길이만큼만 반환
-- repeat 함수는 '*'문자열을 나이만큼 반복하여 반환
-- concat 함수는 두 개 이상의 문자열을 결합하여 하나의 문자열로 만듬

select substring(주소,1,2), replace(substring(휴대폰번호,5,9),'-',',') 
from 학생;
-- substring 함수는 "주소" 열에서 첫 번째 문자부터 두 번째 문자까지의 부분 문자열을 추출
-- replace "휴대폰번호" 열에서 다섯 번째 문자부터 아홉 번째 문자까지의 부분 문자열을 추출한 뒤
-- 그 부분 문자열 내의 '-' 문자를 ',' 문자로 치환

select 신청날짜,last_day(신청날짜) from 수강 where year(신청날짜)='2019';
-- last_day(신청날짜): "신청날짜"의 해당 월의 마지막 날짜를 계산하여 출력

select sysdate(), datediff(신청날짜,'2019-01-01') from 수강;
-- datediff: "신청날짜" 열의 값과 '2019-01-01' 사이의 날짜 차이를 계산하여 출력 
-- 이 함수는 몇 일이 지났는지를 반환
-- SYSDATE() 함수는 데이터베이스 시스템에서 현재 날짜와 시간을 반환하는 함수

select 신청날짜, date_format(신청날짜,'%b/%d/%y') from 수강;
-- date_format(신청날짜, '%b/%d/%y'): "신청날짜" 열의 값을 원하는 형식으로 포맷팅 
-- %b는 축약된 월 이름, %d는 일(day), %y는 년도의 뒤 두 자리를 나타냄  
-- ex)'2021-08-15'라면 'Aug/15/21'로 포맷팅


delimiter //
create procedure InserOrUpdateCourse(
	in CourseNo varchar(4),
    in CourseName varchar(20),
    in CourseRoom char(3),
    in CourseDept varchar(20),
    in CourseCredit int)
begin
	declare Count int;
    select count(*) into Count from 과목 where 과목번호=CourseNo;
    if(Count=0) then 
		insert into 과목(과목번호, 이름, 강의실, 개설학과, 시수)
        values(CourseNo, CourseName, CourseRoom, CourseDept, CourseCredit);
	else 
		update 과목
        set 이름=CourseName, 강의실=CourseRoom, 개설학과=CourseDept, 시수=CourseCredit
        where 과목번호 = CourseNo;
	end if;
end // 
delimiter ;

-- declare Count int;: Count라는 변수를 선언, 이 변수는 존재하는 강좌 레코드의 개수를 저장
-- select count(*) into count from 과목 where 과목번호=CourseNo;: Count 변수에 존재하는 강좌 레코드의 개수를 가져오는 쿼리를 실행
-- 해당 강좌 번호가 이미 데이터베이스에 존재하는지 확인
-- If(Count=0) then ... else ... end if;: Count 변수의 값에 따라 조건문을 실행 
-- 만약 Count가 0인 경우, 새로운 강좌 정보를 삽입 
-- 그렇지 않은 경우, 기존 강좌 정보를 업데이트
-- insert into 과목 ... values(...);: 새로운 강좌 정보를 삽입
-- update 과목 ... where 과목번호 = CourseNo;: 기존 강좌 정보를 업데이트

select * from 과목;

delimiter // 	
--  MySQL에서 프로시저를 작성할 때, 기본 구문 구분 기호인 세미콜론(;)을 대신 //로 변경, 이렇게 함으로써 프로시저 정의를 구분
create procedure SelectAverageOfBestScore( 
    in Score int,			   
    out Count int			  
)
-- 이름이 "SelectAverageOfBestScore"인 저장 프로시저를 생성 
-- 이 프로시저는 입력 파라미터 Score와 출력 파라미터 Count를 가짐
-- 사용자가 입력할 숫자
-- 계산결과(인원수) 출력할 숫자
	
	begin			      
	declare NoMoreData int default false; 
	declare MidTerm int; 
	declare Final int; 	   
-- 프로시저의 시작, 이 안에서 프로시저의 로직을 작성
-- 반복문의 종료 조건을 검사하기 위한 변수 NoMoreData를 선언하고 기본값을 false로 설정
-- declare continue handler for not found set NoMoreData = true;: 커서가 데이터를 더 이상 찾지 못할 경우, 해당 핸들러가 호출되어 NoMoreData 변수를 true로 설정
-- repeat: 반복문을 시작
    declare Best int;	 -- 중간성적과 기말성적 중 큰 값 저장	 
    declare ScoreListCursor cursor for 
		select 중간성적,기말성적 from 수강; -- ScoreListCursor라는 이름의 커서를 선언, "수강" 테이블로부터 중간 성적과 기말 성적을 선택하는 쿼리의 결과를 가리킴
	declare continue handler for not found set NoMoreData = true;
		set Count=0;
	open ScoreListCursor; -- 선언한 커서를 열어 데이터 읽기를 준비
    	repeat
	fetch ScoreListCursor into Midterm, Final;
-- 커서로부터 한 줄의 데이터를 읽어 Midterm과 Final 변수에 할당
        if Midterm > Final then
			set Best = Midterm;
		else
			set Best = Final;
		end if;
-- 중간 성적과 기말 성적 중 더 높은 값을 Best 변수에 할당
        if(Best>=Score) then
			set Count = Count+1;
		end if;
-- 최고 점수가 입력된 Score보다 높거나 같다면, Count 변수를 1 증가
	until NoMoreData end repeat;
-- 데이터를 더 이상 찾을 수 없을 때까지 반복
    close ScoreListCursor;
-- 반복이 끝난 후 커서를 닫음
end // 
delimiter ;

set @Count = 0; -- 출력 결과를 받아들일 변수명 (생략 가능함)
call SelectAverageOfBestScore(80, @Count); -- 입력과 출력 파라미터
select @Count; -- 결과 화면 출력 


create table 학생2 as (select * from 학생);
-- 학생 테이블을 복사해서 학생2 테이블을 생성

create table 남녀학생총수(
	성별 char(1) not null default 0,
    인원수 int not null default 0,
    primary key(성별)
);

insert into 남녀학생총수 select '남',count(*) from 학생2 where 성별='남';
insert into 남녀학생총수 select '여',count(*) from 학생2 where 성별='여';

select * from 남녀학생총수;

delimiter //
	create trigger AfterInsertStu
    after insert on 학생2 for each row
begin
	if(new.성별='남') then
		update 남녀학생총수 set 인원수 = 인원수 + 1 where 성별='남';
	elseif(new.성별 = '여') then
		update 남녀학생총수 set 인원수 = 인원수 + 1 where 성별='여';
    end if;
end //
delimiter ;

insert into 학생2
values('s008','최동석','경기 수원', 2, 26, '남', '010-8888-6666', '컴퓨터');

select * from 학생2;
select * from 남녀학생총수;

drop trigger AfterInsertStu; -- AfterInsertStu trigger 삭제 

delimiter //
	create function Fn_Grade(grade char(1))
	returns varchar(10) -- 이거 왜한거지?
begin
	declare ret_grade varchar(10);
    if(grade='A') then
		set ret_grade='최우수';
	elseif(grade='B') then
		set ret_grade='우수';
	elseif(grade='C') then
		set ret_grade='보통';
	elseif(grade='D' or grade='F') then
		set ret_grade='미흡';
	end if;
    return ret_grade;
end //
delimiter ;

select Fn_Grade('A');
select 학번,과목번호,평가학점, Fn_Grade(평가학점) as '평가 등급' from 수강;


drop procedure if exists tableInfo;
delimiter //
create procedure tableInfo(
	in tableName varchar(20)
)
begin
    set @sqlQuery = concat('select * from ', tableName); -- CONCAT 함수는 문자열을 연결하는 데 사용되는 SQL 함수
    prepare myQuery from @sqlQuery; 
    execute myQuery;
    
-- set @sqlQuery = concat('select * from ', tableName);: 이 부분에서는 @sqlQuery라는 변수에 동적으로 생성할 SQL 쿼리를 저장 
-- concat 함수를 사용하여 문자열 'select * from '과 입력받은 tableName을 연결하여 완전한 SQL 쿼리를 생성 
-- 예를 들어, 만약 tableName이 '과목'이라면, @sqlQuery에 'select * from 과목'이 저장
-- prepare myQuery from @sqlQuery;: @sqlQuery에 저장된 동적 쿼리를 준비
-- 준비된 쿼리는 myQuery라는 이름으로 저장
-- execute myQuery;: 이 부분에서는 준비된 쿼리인 myQuery를 실행
end  //
delimiter ;

call tableInfo('과목');


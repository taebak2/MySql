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
    primary key(학번,과목번호), -- 학번과 과목번호가 동시에 같은 값을 가질때만 중복값 입력이 불가하다. 학번 값이 다르고 과목번호가 같으면 입력 가능 
    foreign key(학번) references 학생2(학번),
    foreign key(과목번호) references 과목2(과목번호)
    -- foreign key (참조하는_열) references 참조하는_테이블(참조되는_열(참조하는 테이블의 primary key에 해당하는 field를 입력해줘야함))
    -- foreign key는 한 테이블의 레코드와 다른 테이블의 레코드 사이의 관계를 정의 
    -- 데이터의 변경이나 삭제가 발생할 때 이에 관련된 다른 테이블의 데이터도 처리
    -- 수강2 테이블의 과목번호 열 값은 과목2 테이블의 과목번호 열의 값 중 하나만 가질 수 있으며, 과목2 테이블에 없는 값을 참조하는 경우에는 제한이 걸릴 것
);
select * from 수강2;

insert into 과목2 values('c111','database',A-123,'산업공학'); -- 오류(문자에 따옴표 없음)
insert into 과목2 values('c111','database','A-123','산업공학'); -- 오류(필드 5개인데 4개만 입력)
insert into 과목2 values('c111','database','A-123','산업공학',3); -- 정상

insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values('s111','박태환',4,null,'남','010-1111-1111','산업공학');
insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values('s222','박태환',2,null,'남','010-1111-1111','산업공학'); -- 휴대폰번호 중복 입력 안됨
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

-- alter table 테이블 이름 change 기존이름 신규이름 데이터타입; 
-- 테이블의 필드명 변경
alter table 학생2 change 이름 학생이름 varchar(20);
select * from 학생2;

-- alter table 테이블이름 rename to 신규이름; 
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

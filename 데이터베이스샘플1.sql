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
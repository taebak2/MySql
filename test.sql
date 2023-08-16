create database test;
use test;
-- use test를 실행하고나서 table을 실행해야 오류 안나옴 
-- 단축키 : ctrl + enter 한 줄 실행
	   -- ctrl + B 쿼리 정리 정렬
	   -- ctrl + / 주석
	   -- ctrl + shift + enter 다중 실행
	   -- ctrl + L 한 줄 삭제 
       -- ctrl + D 한 줄 복사
       
create table 학생(
	학번 varchar(10),
    이름 varchar(20),
    학년 int,
    성별 varchar(2)
);
-- 실행은 마지막 세미콜론에서 실행해야함

create table 직원(
	사번 varchar(10),
    	이름 varchar(20),
    	나이 int,
    	성별 varchar(2)
);

insert into 학생 values("s001","김연아","4","여");
insert into 학생 values("s002","홍길동","1","남");
insert into 학생 values("s003","이승엽","3","남");


insert into 직원 values("e001","김춘식","41","남");
insert into 직원 values("e002","이미나","28","여");

-- 키워드는 대소문자 구분하지 않음 예) insert, InSERT 똑같음 

SELECT * from 학생;


CREATE database univDB;
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

select * from 학생; -- select * from 학생 : 학생 테이블의 모든 필드를 조회

create table 수강(
학번 char(6) not null,
과목번호 char(4) not null,
신청날짜 date not null,
중간성적 int null default 0,
기말성적 int null default 0,
평가학점 char(1) null,
primary key(학번,과목번호)
);


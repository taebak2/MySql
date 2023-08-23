create table 학생(
    학번 varchar(20),
    이름 varchar(10),
    나이 int,
    성별 varchar(5),
    학년 int
);

insert into 학생 values ('a001','김길동',25,'M',3);
insert into 학생 values ('a002','서길동',20,'F',1);
insert into 학생 values ('a003','남길동',21,'F',2);
insert into 학생 values ('a004','유길동',28,'M',4);
insert into 학생 values ('a005','홍길동',22,'F',2);
insert into 학생 values ('a006','김서이',null,'M',3);
insert into 학생 values ('a007','나길동',21,'F',1);
insert into 학생 values ('a008','김국진',29,'M',3);
insert into 학생 values ('a009','황길동',30,'F',2);
insert into 학생 values ('a010','이길동',40,'M',4);

select * from 학생;
-- 나이를 알 수 없는 학생의 이름을 검색
select 이름,나이 from 학생 where 나이 is null; 
-- where절에서 null값 검색할 때는 is null 사용

-- 성이 김 씨이고 학년이 3학년인 학생들의 나이를 검색(동일한 나이 중복 제거)
select distinct 나이 from 학생 where 이름 like '김%' and 학년 = 3;

-- 학생 중 남학생과 여학생별 평균 연령 검색
select 성별, avg(나이) as 평균연령 from 학생 group by 성별; 

-- 학생들의 학번, 나이, 학년을 나이의 내림차순
-- 나이가 같을 경우 학년의 오름차순으로 검색
select 학번, 나이, 학년 from 학생 order by 나이 desc, 학년;

-- 남학생 중 나이가 최소인 학생의 학번, 이름, 나이를 검색
select 학번, 이름, 나이 from 학생 where 성별='M' and 나이 = (select min(나이) from 학생 where 성별 = 'M');

-- 나이가 같은 학생이 50명 이상인 연령에 대해서만 해당 나이와 학생수를 검색
select 나이, count(*) as 학생수 from 학생 group by 나이 having count(*) >= 50;



create table 학생(
학번 varchar(10),
이름 varchar(20),
학년 int,
소속학과 varchar(10));

create table 수강(
학번 varchar(10),
과목번호 varchar(10),
중간성적 int,
기말성적 int,
평가학점 varchar(1));


create table 과목(
과목번호 varchar(10),
과목이름 varchar(10),
학점 varchar(1),
학과 varchar(10),
담당교수 varchar(20)
);

-- 컴퓨터학과에 소속되어 있는 학생들의 이름과 
-- 학년을 고학년에서 저학년 순서로 검색
select 이름, 학년 from 학생 where 소속학과='컴퓨터학과' order by 학년 desc;   

-- 각 학생들의 이름, 과목번호, 수강과목별 총점(중간성적과 기말성적의 합)을 검색
select 이름, 과목번호, 중간성적+기말성적 as '수강과목별 총점' from 학생 join 수강 on 학생.학번=수강.학번;

-- 각 학생들의 이름, 수강한 모든 과목의 총점(중간성적과 기말성적의 합)을 검색
select 이름, sum(중간성적+기말성적) as'수강한 모든 과목의 총점' from 학생 join 수강 on 학생.학번=수강.학번 group by 이름;

-- 각 과목별 기말평균이 90점 이상인 과목의 번호와 과목별 기말성적의 평균점수를 검색
select 과목번호, avg(기말성적) as '기말성적의 평균점수' from 수강 group by 과목번호 having avg(기말성적) >=90;
-- having 절 : 그룹화된 결과에 대한 조건을 지정합니다. 여기서는 "기말성적"의 평균이 90 이상인 그룹만 선택

-- 각 평가학점별로 취득한 학생의 수를 검색
select 평가학점, count(*) as 학생수 from 수강 group by 평가학점; 

-- '이'씨 성을 가진 모든 학생들의 이름과 과목이름, 평가학점을 검색
select 학생.이름, 과목.과목이름, 수강.평가학점 from(학생 join 수강 on 학생.학번=수강.학번)
join 과목 on 수강.과목번호= 과목.과목번호 where 이름 like '이%';

-- 컴퓨터학과에 소속된 학생들의 이름과 수강한 과목이름을 검색
select 이름, 과목.과목이름 from (학생 join 수강 on 학생.학번=수강.학번)
join 과목 on 수강.과목번호 = 과목.과목번호 where 학과='컴퓨터';   

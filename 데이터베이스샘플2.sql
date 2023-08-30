create database if not exists studentex; -- 데이터베이스 중복 생성 방지
use studentex;

create table 대학생
(
	이름 varchar(100) null,     
	학번 varchar(11) null,
	생년월일 varchar(6) null,
	성별 varchar(1) null,
	입학년도 varchar(4) null,
	전화번호 varchar(11) null,
	학과코드 varchar(3) null
);

create table 시험
(
	학번 varchar(11) null,
	국어 int,
	영어 int,
	수학 int
);

create table 교수
(
	학과코드 varchar(3) null comment '학과코드',
	학과명 varchar(100) null comment '학과명',
	학과담당교수 varchar(100) null comment '학과담당교수'
);

INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('데미안', '16971504', '941112', 'M', '2016', '01010523220', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('엘로이', '16945259', '930714', 'M', '2016', '01074494079', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('헨리', '16885578', '950603', 'M', '2016', '01073236179', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('안나', '16626786', '880816', 'F', '2016', '01098539654', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('루카스', '16543708', '950304', 'M', '2016', '01095544143', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('릴리', '15877030', '901215', 'F', '2015', '01065293405', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('루나', '15788253', '900908', 'F', '2015', '01086195344', '106');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('페뷔스', '15700939', '940316', 'M', '2015', '01097435136', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('카밀라', '15589962', '940619', 'F', '2015', '01012348900', '106');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('쥬리', '15578271', '950613', 'F', '2015', '01036724305', '101');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('지나', '15309170', '901201', 'F', '2015', '01065692589', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('벤자민', '14939257', '900602', 'M', '2014', '01013155385', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('테드', '14885530', '940216', 'M', '2014', '01030037337', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('엘리언', '14562369', '921015', 'M', '2014', '01019829629', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('테오', '14484171', '940315', 'M', '2014', '01034824739', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('앤디', '14362190', '940420', 'M', '2014', '01011193251', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('케드릭', '13949165', '950817', 'M', '2013', '01051881015', '101');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('이안', '13753261', '920111', 'M', '2013', '01068381091', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('데이지', '13740398', '951023', 'F', '2013', '01011322531', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('이든', '13585677', '951022', 'M', '2013', '01091134045', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('헬리오', '13551644', '950716', 'M', '2013', '01074337853', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('로이드', '13550256', '870527', 'M', '2013', '01032421470', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제시카', '13500861', '881123', 'F', '2013', '01016400380', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제이', '12938335', '890102', 'M', '2012', '01071757377', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('엘라', '12790181', '920916', 'F', '2012', '01063802062', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제레미', '12676231', '891015', 'M', '2012', '01013403272', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('셀레나', '12665540', '880317', 'F', '2012', '01085524698', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('네로', '12649105', '880213', 'M', '2012', '01015780578', '106');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제니', '12515986', '941015', 'F', '2012', '01034114041', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('메리', '11972722', '880821', 'F', '2011', '01047526572', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제이드', '11948285', '950227', 'M', '2011', '01083413212', '106');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('이시스', '11933250', '920621', 'F', '2011', '01098066965', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('루이', '11822923', '911108', 'M', '2011', '01013240679', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('카이', '11663197', '881109', 'M', '2011', '01078003753', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('알렉스', '11476583', '880715', 'M', '2011', '01084131154', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제이콥', '11459913', '910118', 'M', '2011', '01088494302', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('앤드류', '11337407', '921116', 'M', '2011', '01075919845', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('레이첼', '10998709', '951221', 'F', '2010', '01059763406', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('엘렌', '10955111', '900810', 'F', '2010', '01011434540', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('마리아', '10893477', '930602', 'F', '2010', '01070951359', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('리안', '10804413', '930603', 'F', '2010', '01086189285', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('저스틴', '10617672', '900106', 'M', '2010', '01017910606', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('엔젤라', '10615715', '871017', 'F', '2010', '01020461504', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('로미오', '10525777', '951218', 'M', '2010', '01026394815', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('세라', '10433607', '920215', 'F', '2010', '01094659677', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('루시', '10366365', '900121', 'F', '2010', '01048965286', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('도로시', '10284247', '871122', 'F', '2010', '01094513314', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('올리버', '10276637', '950723', 'M', '2010', '01075965847', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제이크', '09981340', '920217', 'M', '2009', '01067798684', '101');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('테디', '09946130', '870523', 'M', '2009', '01075437977', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('레이나', '09839224', '940916', 'F', '2009', '01037190604', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('하니', '09791710', '881126', 'F', '2009', '01066181754', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('라이언', '09714111', '880510', 'M', '2009', '01027200637', '103');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('엘리', '09500575', '950208', 'F', '2009', '01033416716', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('겔런트', '09468667', '911023', 'M', '2009', '01051097227', '104');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제임스', '09374395', '880314', 'M', '2009', '01045999556', '101');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('카일', '09286476', '931021', 'M', '2009', '01063095593', '101');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('베시', '09243989', '910322', 'F', '2009', '01085797848', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('리암', '08980159', '920204', 'M', '2008', '01044885321', '106');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('레이', '08831906', '950408', 'M', '2008', '01021853474', '101');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('제시', '08775794', '911209', 'F', '2008', '01094028708', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('루크', '08673644', '930919', 'M', '2008', '01053288396', '102');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('페비안', '08648751', '951008', 'M', '2008', '01050119141', '105');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('로이', '08506364', '911123', 'M', '2008', '01044349706', '101');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('로즈', '08405911', '890506', 'F', '2008', '01036932538', '100');
INSERT INTO 대학생 (이름, 학번, 생년월일, 성별, 입학년도, 전화번호, 학과코드) VALUES ('라일라', '08235560', '911201', 'F', '2008', '01040435754', '103');


INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09468667',58,80,92);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('12649105',44,74,39);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('16971504',76,93,83);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('13740398',80,58,49);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10284247',98,77,73);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09714111',98,100,41);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08235560',63,35,72);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08831906',72,73,68);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09839224',100,79,45);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10998709',43,61,93);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10525777',82,73,72);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08506364',54,66,52);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('13550256',76,46,65);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08405911',73,77,59);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('15788253',63,96,100);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10366365',56,96,76);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('11822923',82,47,33);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('16543708',65,31,42);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08673644',61,85,34);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10804413',40,84,79);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08980159',43,48,98);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('15877030',69,69,64);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10893477',86,67,87);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('11972722',67,48,89);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09243989',56,95,39);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('14939257',37,52,45);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('12665540',36,76,61);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('16626786',75,76,33);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('11476583',31,54,50);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('11337407',49,44,99);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('14362190',71,38,30);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10615715',93,68,68);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10955111', 52,96,47);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('16945259', 95,98,41);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09500575', 81,40,99);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('14562369', 34,88,76);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10276637', 90,97,30);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('13585677', 37,44,79);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('11933250', 57,92,91);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('13753261', 89,60,67);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('10617672', 76,38,36);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('12515986', 71,59,32);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('12676231', 99,55,57);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08775794', 86,74,31);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('13500861', 99,63,34);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('12938335', 32,36,81);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('11948285', 33,58,81);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('11459913', 43,82,97);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09374395', 51,84,79);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('15578271', 48,44,49);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('15309170', 86,66,93);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('15589962', 55,96,86);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09286476', 97,82,60);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('13949165', 100,81,93);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09946130', 46,88,97);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('14484171', 73,43,40);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('15700939', 63,57,30);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('08648751', 99,90,65);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('09791710', 56,47,30);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('16885578', 78,32,32);
INSERT INTO 시험 (학번, 국어, 영어, 수학) VALUES ('13551644', 80,95,97);


INSERT INTO 교수 (학과코드, 학과명, 학과담당교수) VALUES ('100', '국문학과', '이세종');
INSERT INTO 교수 (학과코드, 학과명, 학과담당교수) VALUES ('101', '영문학과', '마이클잭슨');
INSERT INTO 교수 (학과코드, 학과명, 학과담당교수) VALUES ('102', '법학과', '김판사');
INSERT INTO 교수 (학과코드, 학과명, 학과담당교수) VALUES ('103', '경영학과', '이재용');
INSERT INTO 교수 (학과코드, 학과명, 학과담당교수) VALUES ('104', '무용학과', '나유연');
INSERT INTO 교수 (학과코드, 학과명, 학과담당교수) VALUES ('105', '물리학과', '장영실');
INSERT INTO 교수 (학과코드, 학과명, 학과담당교수) VALUES ('106', '환경공학과', '송청결');

select count(*) from 대학생; -- 66
select count(*) from 시험; -- 61
select count(*) from 교수; -- 7

use univdb;

-- 대학생 테이블에서 학과코드를 중복제거하고 검색하세요
select distinct 학과코드 from 대학생; -- 7개 

-- 시험 테이블에서 국어가 90점 이상이거나 수학이 90점 이상인 학생의 학번, 국어, 수학 점수를 출력하세요
select 학번, 국어, 수학 from 시험 where 국어>=90 or 수학>=90; -- 22개

select 이름, 학년, 소속학과, 휴대폰번호 from 학생 where (학년>=1 and 학년<=3) or not(소속학과='컴퓨터'); 
-- 1,2,3학년 학생이거나 '컴퓨터'학과에 소속되지 않은 학생의 이름, 학년, 소속학과, 휴대폰번호 검색

select 이름, 학년, 소속학과, 휴대폰번호 from 학생 where(학년 between 1 and 3) or not(소속학과='컴퓨터');
-- 방법2 


select 이름, 학번, 생년월일 from 대학생 where(입학년도 ='2015' or 입학년도 ='2016') and not(학과코드='105');
select 이름, 학번, 생년월일 from 대학생 where(입학년도 between 2015 and 2016) and not(학과코드=105);
select 이름, 학번, 생년월일 from 대학생 where(입학년도=2015 or 입학년도=2016) and not(학과코드=105);

-- 대학생 테이블에서 입학년도가 2015~2016년도 이면서 학과코드가 105가 아닌 학생들의 이름, 학번, 생년월일을 검색하세요
-- 입학년도, 학과코드를 char로 설정했지만, 데이터 값이 숫자인 데이터는 작은따옴표를 사용하지 않아도 숫자로 인식할 수 있음

select 이름, 학년, 소속학과 from 학생 where 소속학과 = '컴퓨터' or 소속학과 = '정보통신' order by 학년;
-- 정렬 기본값(asc) : 오름차순

select 이름, 학년, 소속학과 from 학생 where 소속학과 = '컴퓨터' or 소속학과 = '정보통신' order by 학년 desc;
-- desc 정렬 : 내림차순
-- select 이름, 학년, 소속학과 from 학생 where 소속학과 = '컴퓨터' or '정보통신' order by 학년 desc;
-- or 이나 and 를 사용시 필드명 각각 입력 해줘야함 

select * from 학생 order by 학년 asc, 이름 desc;
-- 학년을 기준으로 오름차순, 학년이 같은 경우 이름을 기준으로 내림차순 정렬 


select 학번, 수학, 영어 from 시험 order by 수학 desc, 영어 limit 10; 
-- 시험 테이블에서 1차 수학점수를 내림차순으로 정렬
-- 2차 영어점수의 오름차순으로 정렬하되 학번, 수학, 영어점수만 검색
-- 출력 결과는 10개만 나오게 하세요

-- grant 권한종류 on db.이름.테이블이름 to 사용자명;

-- 대학생 테이블에서 입학년도가 2016년이 아니면서 성별이 남자인 학생의
-- 인원수를 검색하되, 별명은 '남학생 인원수'로 설정하시오
select count(*) '남학생 인원수' from 대학생 where 성별 ='M' and not (입학년도='2016'); 

-- 대학생 테이블에서 학과코드별로 인원수를 검색하세요
select 학과코드,count(*) '학과코드 인원수' from 대학생 group by 학과코드;

-- 대학생 테이블에서 입학년도가 2015년 학생들의 학과코드별 인원수를 검색하세요
select 학과코드,count(*) as '2015년 인원수' from 대학생 where 입학년도='2015' group by 학과코드; -- group by "학과코드" 열을 기준으로 데이터를 그룹화

-- 대학생 테이블에서 입학년도가 2015년인 학생들 중
-- 학과코드별로 2명 이상의 인원수인 데이터에 대해서만
-- 학과코드별 인원수를 검색하세요

select 학과코드,count(*) as '2015년 인원수' from 대학생 where 입학년도='2015' group by 학과코드 having count(*)>=2;
-- 각 학과별로 인원수를 계산한 뒤에 그룹 내 인원수가 2명 이상인 학과들만 선택

-- 대학생 테이블에서 이름이 '제'로 시작하는
-- 학생들의 이름, 학번, 생년월일을 검색하되
-- 성별이 여자인 학생들만 검색하세요
select 이름, 학번, 생년월일  from 대학생 where 이름 like '제%' and 성별 = 'F';

-- 교수 테이블에서 마씨 성을 가진 교수의
-- 학과코드별 인원수를 검색하세요
select 학과코드, 학과담당교수 from 교수 where 학과담당교수 like '마%';

-- 성별이 여자이거나 국어점수가 90점 이상인 학생의 학번을 검색하세요
select 학번 from 대학생 where 성별='F'
union
select 학번 from 시험 where 국어>=90;

-- 수학점수가 95점 이상인 학생의 이름을 검색하세요

select 이름 from 대학생 where 학번 in (select 학번 from 시험 where 수학>=95);
-- 부 질의문
-- 시험" 테이블에서 수학 점수가 95 이상인 학생들의 학번을 먼저 선택한 뒤 
-- 이 학번들을 사용하여 "대학생" 테이블에서 해당 학번에 해당하는 학생들의 이름을 선택

-- 성별이 여자이면서 국어점수가 90점 이상인 학생의 학번을 검색하세요
select 학번 from 대학생 where 성별 ='F' and 학번 in(select 학번 from 시험 where 국어>=90);
 
-- 학과명이 국문학과나 영문학과인 학생의 이름을 검색하세요
select 이름 from 대학생 where 학과코드 in (select 학과코드 from 교수 where 학과명='국문학과' or 학과명='영문학과'); 
 
-- 대학생과 시험 테이블을 사용하시오
-- 시험을 응시한 학생의 이름을 검색하세요
select 이름 from 대학생 join 시험 on 대학생.학번=시험.학번;

-- 시험을 응시한 학생의 이름을 검색하되 국어점수가 80점 이상만 검색하세요
select 이름 from 대학생 join 시험 on 대학생.학번 = 시험.학번 where 국어>=80;

-- 이름, 입학년도, 국어, 수정영어점수(영어점수의 90%로 설정)를 검색하되 
-- 수학이 80점 이상인 학생만 검색하세요

select 이름,입학년도,국어,영어*0.9 as 수정영어점수
from 대학생 join 시험 on 대학생.학번 = 시험.학번 where 수학>=80;

-- 이름, 수학, 영어, 학과명을 검색하되
-- 국어점수가 80점 이상인 데이터를 검색하세요

select 대학생.이름, 시험.수학, 시험.영어, 교수.학과명 from(대학생 join 시험 on 대학생.학번=시험.학번)
join 교수 on 대학생.학과코드 = 교수.학과코드 where 국어>=80;
-- join 에는 테이블 이름, on 뒤에는 공통된 필드를 작성 

select 이름, 과목번호 from 학생 as S, 수강 as E 
where S.학번=E.학번 and 과목번호 ='c002';

-- 과목을 수강하지 않은 학생을 포함하여 모든 학생의 학번, 이름과 학생이 수강한 교과의 평가학점 검색
select s1.이름, s2.이름
from 학생 s1 join 학생 s2 on s1.주소=s2.주소
where s1.학년>s2.학년;

-- 시험을 응시하지 않은 학생을 포함하여
-- 이름, 학번, 국어, 영어 점수를 검색하세요

select 이름,대학생.학번,국어,영어 from 대학생
left outer join 시험 on 대학생.학번=시험.학번;
-- 대학생 테이블에 시험 테이블에 있는 column(국어,영어)을 추가 + 대학생 테이블 모두를 출력 

-- 시험을 응시하지 않은 학생의 이름을 검색
select 이름 from 대학생 where 학번 not in (select 학번 from 시험);

select 이름 from 대학생
left outer join 시험 on 대학생.학번=시험.학번 where 국어 is null;
-- "대학생" 테이블의 모든 레코드와 "시험" 테이블에 해당하는 레코드들을 합치는 것

create table 남자대학생 as (select * from 대학생 where 성별='M');
select * from 남자대학생; -- 38개

create table 우수응시자 as (select * from 시험 where 국어>=80 and 영어>=80);
select * from 우수응시자;

-- 교수 테이블을 복사해서 교수2 테이블을 생성하세요
create table 교수2 as(select * from 교수);

-- 교수2 테이블에서 물리학과 교수 이름을 아인슈타인으로 변경
update 교수2 set 학과담당교수='아인슈타인' where 학과명='물리학과';
-- update (table) set (변경사항) where (field)

select * from 교수2;

-- 대학생, 시험 테이블을 복사하여 대학생2, 시험 2 테이블을 생성
create table 대학생2 as(select * from 대학생);
create table 시험2 as(select * from 시험);
-- 대학생2 테이블에서 시험에 응시하지 않은 학생의 전화번호를 null로 설정
update 대학생2 set 전화번호=null where 학번 not in(select 학번 from 시험2);
select * from 대학생2 where 전화번호 is null;


-- 대학생2에서 성별을 남학생, 여학생으로 변경
update 대학생2 set 성별='남' where 성별 = 'M';
update 대학생2 set 성별='여' where 성별 = 'F';


-- 대학생2, 교수2 테이블을 이용
-- 학과별 인원이 10명 미만인 교수2 테이블 정보를 삭제
delete from 교수2 
where 학과코드 in ( select 학과코드 from 대학생2 group by 학과코드 having count(*) <10);
select * from 교수2;

-- 대학생2 학번(기본키), 학과코드(외래키)
-- 시험2 학번(외래키)
-- 교수2 학과코드(기본키) 설정해서 테이블 생성

create table 대학생2
(
	이름 varchar(100) null,     
	학번 varchar(11) not null,
	생년월일 varchar(6) null,
	성별 varchar(1) null,
	입학년도 varchar(4) null,
	전화번호 varchar(11) null,
	학과코드 varchar(3) null,
    primary key(학번),
    foreign key(학과코드) REFERENCES 교수2(학과코드)
);

create table 시험2
(
	학번 varchar(11)not null,
	국어 int,
	영어 int,
	수학 int,
    foreign key(학번) references 대학생2(학번)
);

create table 교수2
(
	학과코드 varchar(3) not null, 
	학과명 varchar(100) null, 
	학과담당교수 varchar(100) null, 
    primary key(학과코드)
);

insert into 교수2 select* from 교수;
insert into 대학생2 select* from 대학생;
insert into 시험2 select* from 시험;

-- 시험2 테이블에 합계 필드를 추가
-- 합계 필드는 국어 + 영어 + 수학 점수의 합계로 데이터를 삽입
alter table 시험2 add 합계 int null default'0';
update 시험2 set 합계=국어+영어+수학;
-- UPDATE 문은 이미 존재하는 데이터를 수정할 때 사용
-- INSERT INTO 문은 데이터베이스 테이블에 새로운 데이터를 추가할 때 사용

select * from 시험2;

-- 뷰(고득점학생) v1_고득점학생
-- 이름, 학번, 점수
-- 합계가 270점 이상

create view v1_고득점학생(이름,학번,점수)
as select 이름,대학생2.학번,합계 -- 학번이 어느 테이블의 학번인지 모르기 때문에 경로를 적어줘야함.
from 대학생2 join 시험2 on 대학생2.학번=시험2.학번
where 합계>=270; 
select * from v1_고득점학생;

-- 대학생2와 시험2 테이블을 활용해 v2_남학생 뷰를 생성
-- v2_남학생 뷰는 이름,학번,학과코드,점수로 구성

create view v2_남학생(이름,학번,학과코드,점수)
as select 이름,대학생2.학번,학과코드,합계
from 대학생2 join 시험2 on 대학생2.학번=시험2.학번
where 성별='M';
select * from v2_남학생;

-- v2_남학생 뷰를 활용해 v3_고득점남학생 뷰를 생성
-- v3_고득점남학생 이름, 학번, 점수로 구성하되
-- 합계 점수가 250점 이상인 데이터로 구성

create view v3_고득점남학생(이름,학번,점수)
as select 이름,학번,점수 
from v2_남학생 
where 점수>=250; -- 합계는 v2에 존재하지않는데 where에 합계를 사용 가능?

select * from v3_고득점남학생;

-- 시험2 테이블에 시험날짜를 추가하고 기본 값은 오늘날짜가 들어가게 해주세요 
-- 시험2 테이블에서 국어,영어,수학 점수의 평균을 소수점 3자리까지 구하되
-- 반올림하여 구하시오

alter table 시험2 add 시험날짜 date default '2023-08-28';
select * from 시험2;
--  date 데이터 타입을 가지며, 기본값(default)으로 '2023-08-28' 날짜가 설정
-- alter table 시험2 add 시험날짜 date default (current_date);
-- 8.0버전 이상부터 가능

-- 그 이하 버전
-- alter table 시험2 add 시험날짜 datetime default now();
-- 형식 변경

select 학번, round(sum(국어+영어+수학) / 3,3) as 평균
from 시험2 group by 학번;

-- 대학생 테이블에서 90년 이후에 태어난 학생의
-- 이름, 학번, 생년월일을 검색하세요 left 이용
select 이름, 학번, 생년월일 from 대학생 where left(생년월일,2)>=90;

-- 대학생 테이블에서 90년 이후에 태어난 학생의
-- 이름, 학번, 평균을 검색하되
-- 평균은 반올림하여 정수로 표시

 -- select 이름, 대학생.학번, round((시험.국어+시험.영어+시험.수학)/3,0) as 평균 
 -- from 대학생 join 시험 on 대학생.학번=시험.학번
 -- where left(생년월일,2)>=90; 문자열의 왼쪽 부분을 지정한 길이만큼 추출하는 데 사용
 -- sum사용하려면 group by 써야함 
 
select 이름,대학생.학번,round((국어+영어+수학)/3,0) as 평균
from 대학생 join 시험 on 대학생.학번=시험.학번
where left(생년월일,2)>=90;

select * from 교수2;
-- 임용일자 date 타입으로 column 추가
alter table 교수2 add 임용일자 date; 

update 교수2 set 임용일자='2020-03-01' where 학과담당교수='이세종';
update 교수2 set 임용일자='2019-05-08' where 학과담당교수='마이클잭슨';
update 교수2 set 임용일자='2021-06-13' where 학과담당교수='김판사';
update 교수2 set 임용일자='2008-10-09' where 학과담당교수='나유연';
update 교수2 set 임용일자='2022-01-03' where 학과담당교수='장영실';
update 교수2 set 임용일자='2023-02-08' where 학과담당교수='송청결';

-- 교수2 테이블에서 현재까지 근무일수를 구하는데
-- 이세종 3년 5개월 28일 

select 학과담당교수,floor(datediff(sysdate(),임용일자)/365) as 근무년도, 
timestampdiff(month, 임용일자, curdate()) - floor(datediff(sysdate(),임용일자)/365)*12 
as 근무개월
from 교수2;
-- curdate()는 현재 날짜를 반환
-- timestampdiff(unit, start_datetime, end_datetime)
-- unit: 계산하려는 시간 간격의 단위 YEAR', 'MONTH', 'DAY', 'HOUR', 'MINUTE', 'SECOND'
-- start_datetime 계산을 시작하는 날짜 및 시간
-- end_datetime 계산을 끝내는 날짜 및 시간
-- timestampdiff(MONTH, '2021-01-15', '2023-08-28')는 
-- '2021-01-15'와 '2023-08-28' 사이의 월 수를 계산하여 결과로 31이 반환


-- 교수2 테이블에서 데이터를 추가하는 프로시저 작성
-- 만약, 학과코드가 이미 존재하면 select 구문을 실행
-- 프로시저 이름은 InsertProcessor

delimiter //
create procedure InsertProcessor(
	in 학과코드2 varchar(10),
    in 학과명 varchar(100),
    in 학과담당교수 varchar(100),
    in 임용일자 date)
    
begin
	declare 개수 int;
    select count(*) into 개수 from 교수2 where 학과코드=학과코드2;
    if(개수=0) then 
		insert into 교수2(학과코드,학과명,학과담당교수,임용일자)
        values(학과코드2,학과명,학과담당교수,임용일자);
	else 
		select * from 교수2;
	end if;
end // 
delimiter ;

-- create procedure InsertProcessor(...) begin ... end // : 저장 프로시저의 정의를 시작
-- in 학과코드2 varchar(10), ... : 학과코드2 파라미터는 새로 추가된 파라미터로, 저장 프로시저 호출 시 학과 코드 정보를 전달
-- declare 개수 int;: 개수 변수를 선언, 이 변수는 해당 학과코드2를 가진 교수의 수를 저장
-- select count(*) into 개수 from 교수2 where 학과코드=학과코드2;: 학과코드2 파라미터와 일치하는 교수의 수를 계산하여 개수 변수에 저장
-- if(개수=0) then ... else ... end if;: 개수 변수의 값에 따라 조건문을 실행
-- insert into 교수2 ... values(...);: 학과코드2 파라미터를 사용하여 새로운 교수 정보를 삽입
-- select * from 교수2;: 이미 존재하는 경우 모든 교수 정보를 출력

call InsertProcessor('107','수학과','김국어','2023-08-01');
select * from 교수2;


-- 시험 테이블(국어,영어,수학)
-- 3과목의 평균 점수(반올림해서 정수로 처리함)가 사용자가 입력한 점수보다
-- 큰 점수의 개수를 구하는 프로시저를 생성
-- CountAverage

delimiter //
create procedure CountAverage(
	in InputScore int, -- 사용자가 입력할 점수
	out Result int 	   -- 결과 점수  
)

begin
	declare NoMoreData int default false;
    declare Average int;
	declare Kor int; 
	declare Eng int; 
	declare Math int; 
    
    declare ScoreCursor cursor for
		select round((국어+영어+수학)/3,0) from 시험;
    declare continue handler for not found set NoMoreData = true;
		set Result=0;
        
	open ScoreCursor;
		repeat
			fetch ScoreCursor into Average;
			if (Average > InputScore) then
				set Result = Result+1;
			end if;
		until NoMoreData end repeat;
    close ScoreCursor;
			
end //
delimiter ;

select @Result; -- 결과 화면 출력 

-- 대학생2, 시험2 테이블을 이용하여
-- 남녀우수학생 테이블을 생성
-- 남녀우수학생 테이블은 성별로 합계 점수가 200점 이상인 학생들의 인원수
-- 성별 인원수
-- 남   16
-- 요   14

create table 남녀우수학생 (
	성별 char(1) not null,
    인원수 int not null default 0,
    primary key(성별)
);

insert into 남녀우수학생
select '남', count(*)from 대학생2 join 시험2 on 대학생2.학번=시험2.학번
where 성별='M' and 합계>=200;
insert into 남녀우수학생
select '여', count(*)from 대학생2 join 시험2 on 대학생2.학번=시험2.학번
where 성별='F' and 합계>=200;
select * from 남녀우수학생;

-- 대학생2 테이블에 새로운 데이터를 삽입
-- 예) 홍길동 17000000 991001 M 2012 01099999999 105
insert into 대학생2
values ('홍길동','17000000','991001','M','2012','01099999999','105');

-- 시험2 테이블에 성별 필드를 생성, 대학생 2 테이블의 데이터 가져옴 alter, update
alter table 시험2 add 성별 char(1);
update 시험2 set 성별 = (select 성별 from 대학생2 where 대학생2.학번=시험2.학번);
select * from 시험2;

-- 시험2 테이블에 새로운 데이터를 삽입할 때
-- 예) 17000000 70 80 90 240 2023-08-28 11:22:30 M
-- 남녀우수학생 테이블 데이터를 갱신하는 트리거를 생성
-- 트리거 이름 GreatStudent

delimiter //
create trigger GreatStudent
after insert on 시험2 for each row
begin
	if(new.합계>=200 and new.성별='M') then
		update 남녀우수학생 set 인원수 = 인원수 + 1 where 성별='남';
	elseif (new.합계>=200 and new.성별='F') then
		update 남녀우수학생 set 인원수 = 인원수 + 1 where 성별='여';
	end if;
end // 
delimiter ;

insert into 시험2 values('17000000','70','80','90','240','2023-08-28','M');
select * from 남녀우수학생;

-- 시험 테이블에서 국어, 영어, 수학 점수의 평균으로
-- 등급을 구하는 사용자 정의 함수를 구하세요
-- 평균은 반올림하여 정수로 구하고
-- 사용자 정의 함수 이름은 Fn_Result로 하세요
-- 사용자 정의 함수를 이용하여 학번, 평균, 등급을 출력하세요
-- 등급은 90점 이상 '수', 80점 이상 '우', 70점 이상 '미',
-- 60점 이상 '양' 나머지는 '가'로 표시

delimiter //
create
	function Fn_Result(score int)
	returns varchar(10)
    
begin
	declare ret_score varchar(6);
	 if(score>=90) then
		set ret_score='수';
	elseif(score>=80) then
		set ret_score='우';
	elseif(score>=70) then
		set ret_score='미';
	elseif(score>=60) then
		set ret_score='양';
	else 
		set ret_score='가';
	end if;
    return ret_score;
end //
delimiter ;

select 학번,round((국어+영어+수학)/3,0) as '평균', Fn_Result(round((국어+영어+수학)/3,0)) as '등급' from 시험;

-- 방법 2
delimiter //
create
	function Fn_Result2(kor int, eng int, math int)
	returns varchar(10)
    
begin
	declare ret_average int;
	declare ret_result varchar(10);
    set ret_average = round((kor+eng+math)/3,0);
	 if(ret_average>=90) then
		set ret_result='수';
	elseif(ret_average>=80) then
		set ret_result='우';
	elseif(ret_average>=70) then
		set ret_result='미';
	elseif(ret_average>=60) then
		set ret_result='양';
	else 
		set ret_result='가';
	end if;
    return ret_result;
end //
delimiter ;

select 학번, round((국어+영어+수학)/3,0) as '평균', Fn_Result2(국어,영어,수학) as '등급' from 시험;


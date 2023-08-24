create user 'user1'@'127.0.0.1' identified by '1111';
create user 'user2'@'localhost' identified by '2222'; -- 127.1.1.1 = localhost 
create user 'user3'@'192.168.0.25' identified by '3333';
create user 'user4'@'%' identified by '4444'; 
-- 호스트: % (어떤 호스트에서든 접근 가능)
-- 사용자 이름: user4
-- 패스워드: 4444
select host,user from mysql.user;

grant insert,update,delete on univdb.* to 'user1'@'127.0.0.1';
-- univdb' 데이터베이스에 있는 모든 테이블에 대해 'user1'@'127.1.1.1' 사용자에게 INSERT, UPDATE, DELETE 권한을 부여
-- 해당 사용자는 '127.1.1.1' 호스트에서 접근 가능

grant all on *.* to 'user4'@'%' with grant option;
-- 모든 데이터베이스와 모든 테이블에 대해 'user4'@'%' 사용자에게 모든 권한을 부여
-- with grant option : 해당 사용자가 부여받은 권한을 다른 사용자에게도 부여할 수 있는 권한
-- % : 해당 사용자는 어떤 호스트에서든 접근

grant select on univdb.학생 to 'user2'@'localhost';
-- 'univdb' 데이터베이스에 있는 '학생' 테이블에 대해 'user2'@'localhost' 사용자에게 SELECT 권한을 부여
-- 해당 사용자는 로컬 호스트에서만 접근
-- 127.1.1.1, 127.0.0.1 = localhost 

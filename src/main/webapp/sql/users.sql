drop table users purge;
	
create table users(
	email		varchar2(100)	primary key,
	password	varchar2(30),
	nickname		varchar2(30)
	);

insert into users(email, password, nickname) values('admin@naver.com', 'admin', '관리자');
insert into users(email, password, nickname) values('hong@naver.com', 'hong', '홍길동');

select * from users;



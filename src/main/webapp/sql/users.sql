drop table users purge;

create table users(
	id			varchar2(20)	primary key,
	password	varchar2(20),
	name		varchar2(20),
	email		varchar2(50),
	birthDate   varchar2(20)
	);
	


select * from users;



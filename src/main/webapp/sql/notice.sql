delete * from notice purge;

create table notice(
	seq   number   primary key,
	title   varchar2(50),
	content   varchar2(1000),
	regDate   date   default sysdate
);

select * from notice;
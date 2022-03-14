drop table reviewboard purge;

create table reviewboard(
	seq 				number(5)	primary key,
	title				varchar2(200),
	postedDate			date		default sysdate,
	content				varchar2(2000),
	writer				varchar2(20),
	love				varchar2(20),
	target				varchar2(300),
	companion			varchar2(100),
	recommendationTime	varchar2(100),
	visitedDate			varchar2(20),
	fileName      		varchar2(100),
	cnt					number(5)	default 	0
);

insert into reviewboard(seq, title, content, writer) values(1, '리뷰', '테스트입니다', 'test');

select * from reviewboard;

delete from reviewboard where seq = 7;
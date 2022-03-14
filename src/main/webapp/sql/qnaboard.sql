DROP TABLE qnaboard purge;

CREATE TABLE qnaboard(
	seq 		number(5)		primary key,
	qnaWriter	varchar2(20),
	qnaSubject	varchar2(50),
	qnaContent	varchar2(2000),
	qnaDate		date default sysdate,
	cnt 		number(5)	default 	0
);

select * from qnaboard;

insert into qnaboard(seq, qnaSubject, qnaWriter, qnaContent) values((select nvl(max(seq),0)+1 from qnaboard), 'qnaSubject','qnaWriter','qnaContent.');

delete from qnaboard;
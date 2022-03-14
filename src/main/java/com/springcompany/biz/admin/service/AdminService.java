package com.springcompany.biz.admin.service;

import java.util.List;

import com.springcompany.biz.admin.dao.NoticeVO;
import com.springcompany.biz.admin.dao.QnaVO;
import com.springcompany.biz.user.dao.userVO;

public interface AdminService {

	// 회원관리기능 CRUD(생성, 리딩, 수정, 삭제) - 회원의 생성과 수정은 user파트에서 관리하므로 생략.

	// 회원리스트
	List<userVO> manageMember();

	// 회원상세보기
	userVO getMemberDetail(String id);

	// 회원삭제
	void deleteMember(String id);

	// 공지사항 CRUD

	// 공지사항 등록
	void insertNotice(NoticeVO vo);

	// 공지사항 리스트
	List<NoticeVO> getNoticeList();

	// 공지사항 상세보기
	NoticeVO getNoticeDetail(int seq);

	// 공지사항 수정
	void updateNotice(NoticeVO vo);

	// 공지사항 삭제
	void deleteNotice(int seq);

	// QnA CRUD

	// QnA 리스트
	List<QnaVO> getQnaList(QnaVO vo);

	// QnA 상세보기
	QnaVO getQnaDetail(int seq);

	// 게시글 총 개수
	int countboard();

}

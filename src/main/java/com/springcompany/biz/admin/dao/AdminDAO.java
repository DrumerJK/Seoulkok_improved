package com.springcompany.biz.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springcompany.biz.user.dao.userVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate myBatis;

	// 회원관리기능 CRUD(생성, 리딩, 수정, 삭제) - 회원의 생성과 수정은 user파트에서 관리하므로 생략.

	// 회원리스트
	public List<userVO> manageMember() {
		System.out.println("회원관리 DAO 호출");
		return myBatis.selectList("loginDao.userList");
	}

	// 회원상세보기
	public userVO getMemberDetail(String id) {
		System.out.println("회원 상세보기 DAO 호출");
		return myBatis.selectOne("loginDao.checkId", id);

	}

	// 회원삭제
	public void deleteMember(String id) {
		System.out.println("회원 삭제 DAO 호출");
		myBatis.delete("loginDao.deleteUsers", id);
	}

	// 공지사항 CRUD

	// 공지사항 등록
	public void insertNotice(NoticeVO vo) {
		System.out.println("공지사항 등록 DAO 호출");
		myBatis.insert("notice.insertNotice", vo);
	}

	// 공지사항 리스트
	public List<NoticeVO> getNoticeList() {
		System.out.println("공지사항 리스트 DAO 호출");
		return myBatis.selectList("notice.getNoticeList");
	}

	// 공지사항 상세보기
	public NoticeVO getNoticeDetail(int seq) {
		System.out.println("공지사항 상세보기 DAO 호출");

		return myBatis.selectOne("notice.getNoticeDetail", seq);

	}

	// 공지사항 수정
	public void updateNotice(NoticeVO vo) {
		System.out.println("공지사항 수정 DAO 호출");

		myBatis.update("notice.updateNotice", vo);

	}

	// 공지사항 삭제
	public void deleteNotice(int seq) {
		System.out.println("공지사항 삭제 DAO 호출");
		myBatis.delete("notice.deleteNotice", seq);

	}

	// QnA CRUD

	// QnA 리스트
	public List<QnaVO> getQnaList(QnaVO vo) {
		System.out.println("QnA 리스트 DAO 호출");

		if (vo.getSearchCondition().equals("TITLE")) {
			return myBatis.selectList("adminDAO.getQnaList_title", vo);

		} else if (vo.getSearchCondition().equals("CONTENT")) {
			return myBatis.selectList("adminDAO.getQnaList_content", vo);

		} else {
			return myBatis.selectList("adminDAO.getQnaList_title", vo);
		}
//			return myBatis.selectList("adminDAO.getQnaList", vo);
	}

	// QnA 상세보기
	public QnaVO getQnaDetail(int seq) {
		myBatis.update("viewCount", seq);// 생성
		System.out.println("QnA 상세보기 DAO 호출");
		return myBatis.selectOne("adminDAO.getQnaDetail", seq);
	}

	// 게시물 총 개수
	public int countBoard() {
		return myBatis.selectOne("adminDAO.countboard");
	}
}

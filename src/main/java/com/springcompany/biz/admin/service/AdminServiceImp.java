package com.springcompany.biz.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springcompany.biz.admin.dao.AdminDAO;
import com.springcompany.biz.admin.dao.NoticeVO;
import com.springcompany.biz.admin.dao.QnaVO;
import com.springcompany.biz.user.dao.UserVO;

@Service // 서비스 객체 생성
public class AdminServiceImp implements AdminService {

	@Autowired // DAO 객체 주입
	AdminDAO adminDAO;

	// 회원관리기능 CRUD(생성, 리딩, 수정, 삭제) - 회원의 생성과 수정은 user파트에서 관리하므로 생략.

	// 회원리스트
	public List<UserVO> manageMember() {
		System.out.println("회원관리 서비스 호출");

		return adminDAO.manageMember();
	}

	// 회원상세보기
	public UserVO getMemberDetail(String id) {
		System.out.println("회원 상세보기 서비스 호출");

		return adminDAO.getMemberDetail(id);
	}

	// 회원삭제
	public void deleteMember(String id) {
		System.out.println("회원삭제 서비스 호출");

		adminDAO.deleteMember(id);
	}

	// 공지사항 CRUD

	// 공지사항 등록
	public void insertNotice(NoticeVO vo) {
		System.out.println("공지사항 등록 서비스 호출");

		adminDAO.insertNotice(vo);
	}

	// 공지사항 리스트
	public List<NoticeVO> getNoticeList() {
		System.out.println("공지사항 리스트 서비스 호출");

		return adminDAO.getNoticeList();
	}

	// 공지사항 상세보기
	public NoticeVO getNoticeDetail(int seq) {
		System.out.println("공지사항 상세보기 서비스 호출");

		return adminDAO.getNoticeDetail(seq);
	}

	// 공지사항 수정
	public void updateNotice(NoticeVO vo) {
		System.out.println("공지사항 수정 서비스 호출");
		adminDAO.updateNotice(vo);
	}

	// 공지사항 삭제
	public void deleteNotice(int seq) {
		System.out.println("공지사항 삭제 서비스 호출");
		adminDAO.deleteNotice(seq);
	}

	// QnA CRUD

	// QnA 리스트
	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		System.out.println("QnA 리스트 서비스 호출");
		return adminDAO.getQnaList(vo);
	}

	// QnA 상세보기
	@Override
	public QnaVO getQnaDetail(int seq) {
		System.out.println("QnA 상세보기 서비스 호출");
		return adminDAO.getQnaDetail(seq);
	}

	// 게시글 총 개수
	@Override
	public int countboard() {
		return adminDAO.countBoard();
	}

}

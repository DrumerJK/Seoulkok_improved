package com.springcompany.biz.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.springcompany.biz.admin.dao.QnaVO;
import com.springcompany.biz.review.dao.ReviewVO;
import com.springcompany.biz.user.dao.UserVO;

public interface UserService {

	// 로그인 관련 시작

	// 로그인 동작
	public boolean isLoginSuccess(UserVO vo, HttpSession session);

	// 회원가입 (사용자 생성)
	public void insertUserService(UserVO vo);

	// 아이디 중복체크
	boolean checkIdService(String id);

	// 회원정보수정
	public void updateUserService(UserVO vo);

	// 회원탈퇴
	public void deleteUserService(String id);

	// 로그인 관련 끝

	// 문의관련 시작

	// 나의 문의 리스트
	List<QnaVO> getUserQnaList(String loginId);

	// 나의 문의 상세보기
	QnaVO getQnaDetail(int seq);

	// 나의 문의 작성하기
	void insertQna(QnaVO vo);

	// 나의 문의 수정화면
	QnaVO updateQnaForm(int seq);

	// 나의 문의 수정하기
	void updateQna(QnaVO vo);

	// 나의 문의 삭제하기
	void deleteQna(int seq);

	// 문의 관련 끝

	// 리뷰관련 시작

	// 내가 쓴 리뷰
	List<ReviewVO> getUserReview(String loginId);

	// 리뷰관련 끝
}

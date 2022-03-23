package com.springcompany.biz.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springcompany.biz.admin.dao.QnaVO;
import com.springcompany.biz.review.dao.ReviewVO;
import com.springcompany.biz.user.dao.UserDAO;
import com.springcompany.biz.user.dao.UserVO;

@Service // 서비스 객체 생성
public class UserServiceImp implements UserService {

	@Autowired // DAO 객체 주입
	UserDAO userDAO;

	// USER파트 처리 ServiceImp 시작

	// 로그인 관련
	@Override
	public boolean isLoginSuccess(UserVO vo, HttpSession session) {
		UserVO user = null;

		user = userDAO.loginUser(vo);

		if (user != null) {
			System.out.println(user.getPassword());
			System.out.println(user.getEmail());
			System.out.println(user.getNickname());

			if (user.getPassword().equals(vo.getPassword())) {
				// 로그인 성공
				session.setAttribute("loginEmail", user.getEmail()); // 세션에 loginEmail 정보 생성
				
				return true;
			}
		}
		// 로그인 실패
		return false;
	}

	// 회원가입 (사용자 생성)
	public void insertUserService(UserVO vo) {
		System.out.println("회원가입 서비스 호출");
		// email, password, nickname
		userDAO.insertUser(vo);
	}

	// 이메일 중복체크

	public boolean checkEmailService(String email) {
		System.out.println("이메일 중복체크 서비스 호출");

		boolean result = false;

		if (userDAO.checkEmail(email) == null) {
			System.out.println("이메일 사용가능");
			result = true;
		} else {
			System.out.println("이메일 중복");
			result = false;
		}

		return result;
	}

	// 마이페이지 관련

	// 회원정보수정
	public void updateUserService(UserVO vo) {
		System.out.println("회원정보 수정 서비스 호출");
		userDAO.updateUser(vo);
	}

	// 회원탈퇴
	public void deleteUserService(String email) { // getParameter("id")는 문자열을 반환하므로
		System.out.println("회원탈퇴 서비스 호출");// 여기는 String으로 매개변수 선언. 똑같이 DAO에도 전달.
		userDAO.deleteUser(email);
	}

	// USER파트 처리 ServiceImp 끝

	// 문의 관련 처리 Service 시작

	// 나의 문의 리스트
	public List<QnaVO> getUserQnaList(String loginEmail) {
		System.out.println("나의 문의 리스트 호출");

		return userDAO.getUserQnaList(loginEmail);
	}

	// 나의 문의 작성하기
	public void insertQna(QnaVO vo) {
		System.out.println("나의 문의 작성페이지 호출");

		userDAO.insertQna(vo);
	}

	// 나의 문의 상세보기
	public QnaVO getQnaDetail(int seq) {
		System.out.println("나의 문의 상세보기페이지 호출");

		return userDAO.getQnaDetail(seq);
	}

	// 나의 문의 수정화면
	public QnaVO updateQnaForm(int seq) {
		System.out.println("나의 문의 수정페이지 호출");

		return userDAO.updateQnaForm(seq);
	}

	// 나의 문의 수정하기
	public void updateQna(QnaVO vo) {
		System.out.println("나의 문의 수정 처리");

		userDAO.updateQna(vo);
	}

	// 나의 문의 삭제하기
	public void deleteQna(int seq) {
		System.out.println("나의 문의 삭제하기 호출");

		userDAO.deleteQna(seq);
	}

	// 문의 관련 처리 Service 끝

	// 내가 쓴 리뷰
	public List<ReviewVO> getUserReview(String loginEmail) {
		System.out.println("내가 쓴 리뷰 서비스 호출");

		return userDAO.getUserReview(loginEmail);
	}

}

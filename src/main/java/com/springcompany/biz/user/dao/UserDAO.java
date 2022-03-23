package com.springcompany.biz.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springcompany.biz.admin.dao.QnaVO;
import com.springcompany.biz.review.dao.ReviewVO;

@Repository
public class UserDAO {

	// USER파트 처리 DAO 시작

	// 로그인 관련
	@Autowired
	SqlSessionTemplate mybatis;

	public UserVO loginUser(UserVO vo) {
		System.out.println("loginUser() 호출.");
		// select * from users where email =
		return mybatis.selectOne("loginDao.checkEmail", vo);
	}

	// 회원가입 (사용자 생성)
	public void insertUser(UserVO vo) {
		System.out.println("회원가입 DAO 호출");
		mybatis.insert("loginDao.insertUsers", vo);
	}

	// 아이디 중복체크
	public UserVO checkEmail(String email) {
		System.out.println("아이디 중복체크 DAO 호출");
		return mybatis.selectOne("loginDao.checkEmail", email);
	}

	// 마이페이지 관련

	// 회원정보수정
	public void updateUser(UserVO vo) {
		System.out.println("회원정보 수정 DAO 호출");
		mybatis.update("loginDao.updateUsers", vo);
	}

	// 회원탈퇴
	public void deleteUser(String email) { // 매개변수로 전달받은 id값이 sql명령문에서 처리되면 탈퇴는 정상작동
		System.out.println("회원 탈퇴 DAO 호출");
		mybatis.delete("loginDao.deleteUsers", email);
	}

	// USER파트 처리 DAO 끝

	// 문의 관련 DAO 시작

	// 나의 문의 작성
	public void insertQna(QnaVO vo) {
		System.out.println("나의 문의 작성 DAO 호출");
		mybatis.insert("adminDAO.insertQna", vo);
	}

	// 나의 문의 리스트
	public List<QnaVO> getUserQnaList(String loginEmail) {
		System.out.println("나의 문의 리스트 DAO 호출");
		return mybatis.selectList("adminDAO.getUserQnaList", loginEmail);
	}

	// 나의 문의 상세보기
	public QnaVO getQnaDetail(int seq) {
		System.out.println("나의 문의 보기 DAO 호출");
		return mybatis.selectOne("adminDAO.getQnaDetail", seq);
	}

	// 나의 문의 수정 화면
	public QnaVO updateQnaForm(int seq) {
		System.out.println("나의 문의 수정화면 DAO 호출");
		return mybatis.selectOne("adminDAO.getQnaDetail", seq);
	}

	// 나의 문의 수정 처리
	public void updateQna(QnaVO vo) {
		System.out.println("나의 문의 수정 처리 DAO 호출");
		mybatis.update("adminDAO.updateQna", vo);
	}

	// 나의 문의 삭제
	public void deleteQna(int seq) {
		System.out.println("나의 문의 삭제 DAO 호출");
		mybatis.delete("adminDAO.deleteQna", seq);
	}

	// 문의 관련 DAO 끝

	// 내가 쓴 리뷰
	public List<ReviewVO> getUserReview(String loginEmail) {
		System.out.println("내가 쓴 리뷰 DAO 호출");

		return mybatis.selectList("ReviewDAO.getUserReviewList", loginEmail);
	}

}

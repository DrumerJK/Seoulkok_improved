package com.springcompany.biz.review.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository // DAO 객체 생성
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	// 리뷰기능 CRUD(생성, 리딩, 수정, 삭제)

	// 리뷰 등록
	public void insertReview(ReviewVO vo) {
		System.out.println("리뷰 등록");
		mybatis.insert("ReviewDAO.insertReview", vo);
	}

	// 리뷰 리스트 목록 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("dao 슝 -> " + vo.getSearchCondition());

		if (vo.getSearchCondition().equals("TITLE")) {
			return mybatis.selectList("ReviewDAO.getReviewList_T", vo);
		} else if (vo.getSearchCondition().equals("CONTENT")) {
			return mybatis.selectList("ReviewDAO.getReviewList_C", vo);
		} else {
			return mybatis.selectList("ReviewDAO.getReviewList_T", vo);
		}
	}

	// 리뷰 상세 조회
	public ReviewVO getReviewDetail(int seq) {
		System.out.println("dao 리뷰 상세 조회");
		mybatis.update("ReviewDAO.countUp", seq);
		return mybatis.selectOne("ReviewDAO.getReviewDetail", seq);
	}

	// 리뷰 수정 화면
	public ReviewVO updateReviewForm(int seq) {
		System.out.println("dao 리뷰 수정 화면");
		return mybatis.selectOne("ReviewDAO.getReviewDetail", seq);
	}

	// 리뷰 수정
	public void updateReview(ReviewVO vo) {
		System.out.println("dao 리뷰 수정 처리");
		mybatis.update("ReviewDAO.updateReview", vo);
		System.out.println("dao 리뷰 수정 완료");
	}

	// 리뷰 삭제
	public void deleteReview(int seq) {
		System.out.println("dao 리뷰 삭제");
		mybatis.delete("ReviewDAO.deleteReview", seq);
	}

	// 리뷰 댓글 기능 CRUD

	// 댓글 작성
	public void insertReviewComment() {
		System.out.println("리뷰 댓글 작성 DAO 호출");

	}

	// 댓글 리스트
	public void getReviewComment() {
		System.out.println("리뷰 댓글 리스트 DAO 호출");

	}

	// 댓글 수정
	public void updateComment() {
		System.out.println("리뷰 댓글 수정 DAO 호출");

	}

	// 댓글 삭제
	public void deleteComment() {
		System.out.println("리뷰 댓글 삭제 DAO 호출");

	}

}

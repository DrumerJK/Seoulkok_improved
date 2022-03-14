package com.springcompany.biz.review.service;

import java.util.List;

import com.springcompany.biz.review.dao.ReviewVO;

public interface ReviewService {

	// 리뷰기능 CRUD(생성, 리딩, 수정, 삭제)

	// 리뷰 작성
	void insertReview(ReviewVO vo);

	// 리뷰 리스트
	List<ReviewVO> getReviewList(ReviewVO vo);

	// 리뷰 상세보기
	ReviewVO getReviewDetail(int seq);

	// 리뷰 수정 화면
	ReviewVO updateReviewForm(int seq);

	// 리뷰 수정 처리
	void updateReview(ReviewVO vo);

	// 리뷰 삭제
	void deleteReview(int seq);

	// 리뷰 댓글 기능 CRUD

	// 댓글 작성
	void insertReviewComment();

	// 댓글 리스트
	void getReviewComment();

	// 댓글 수정
	void updateComment();

	// 댓글 삭제
	void deleteComment();

}

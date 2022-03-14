package com.springcompany.biz.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springcompany.biz.review.dao.ReviewDAO;
import com.springcompany.biz.review.dao.ReviewVO;

@Service // Service 객체 생성
public class ReviewServiceImp implements ReviewService {

	@Autowired // DAO 객체주입
	ReviewDAO reviewDAO;

	// 리뷰기능 CRUD(생성, 리딩, 수정, 삭제)

	// 리뷰 작성
	@Override
	public void insertReview(ReviewVO vo) {
		System.out.println("리뷰작성 ServiceImp 호출");
		reviewDAO.insertReview(vo);
	}

	// 리뷰 리스트
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("리뷰리스트 ServiceImp 호출");
		return reviewDAO.getReviewList(vo);
	}

	// 리뷰 상세보기
	@Override
	public ReviewVO getReviewDetail(int seq) {
		System.out.println("리뷰상세보기 ServiceImp 호출");
		return reviewDAO.getReviewDetail(seq);
	}

	// 리뷰 수정 화면
	@Override
	public ReviewVO updateReviewForm(int seq) {
		System.out.println("리뷰수정화면 ServiceImp 호출");
		return reviewDAO.updateReviewForm(seq);
	}

	// 리뷰 수정 처리
	@Override
	public void updateReview(ReviewVO vo) {
		System.out.println("리뷰수정처리 ServiceImp 호출");
		reviewDAO.updateReview(vo);
	}

	// 리뷰 삭제
	@Override
	public void deleteReview(int seq) {
		System.out.println("리뷰삭제 ServiceImp 호출");
		reviewDAO.deleteReview(seq);
	}

	// 리뷰 댓글 기능 CRUD

	// 댓글 작성
	public void insertReviewComment() {
		System.out.println("리뷰 댓글 작성 서비스 호출");
	}

	// 댓글 리스트
	public void getReviewComment() {
		System.out.println("리뷰 댓글 리스트 서비스 호출");
	}

	// 댓글 수정
	public void updateComment() {
		System.out.println("리뷰 댓글 수정 서비스 호출");
	}

	// 댓글 삭제
	public void deleteComment() {
		System.out.println("리뷰 댓글 삭제 서비스 호출");
	}

}

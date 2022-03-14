package com.springcompany.prz.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.springcompany.biz.review.dao.ReviewVO;
import com.springcompany.biz.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired // 서비스 객체 주입
	ReviewService reviewService;

	// 리뷰 쓰기 화면
	@RequestMapping(value = "/insertReviewForm.do", method = RequestMethod.GET)
	public String insertReviewForm(HttpSession session) {
		System.out.println("리뷰 쓰기 화면 controller 호출");

		if (session.getAttribute("loginId") != null) {
			return "review/insertReviewForm";
		}

		return "user/loginForm";
	}

	// 리뷰 쓰기 처리
	@RequestMapping(value = "/insertReview.do", method = RequestMethod.POST)
	// @RequestMapping("/insertReview.do")
	public String insertReviewProc(ReviewVO vo, HttpSession session) throws IOException {
		System.out.println("리뷰 쓰기 처리 controller 호출");

		// 파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("/reviewUpload/");
		System.out.println("=> " + fileSaveFolder);

		MultipartFile fileUpload = vo.getFileUpload();

		if (!fileUpload.isEmpty()) {
			String fileName = fileUpload.getOriginalFilename();
			fileUpload.transferTo(new File(fileSaveFolder + fileName));
			vo.setFileName(fileName);
			// System.out.println("@파일이름:"+ fileName);
		}

		System.out.println("리뷰 파일 업로드 controller 호출");

		reviewService.insertReview(vo);

		return "redirect:getReviewList.do"; // review/ 필요?
	}

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();

		conditionMap.put("내용", "CONTENT");
		conditionMap.put("방문한 장소", "TARGET");
		conditionMap.put("체험 평가", "LOVE");
		conditionMap.put("제목", "TITLE");
		conditionMap.put("방문일자", "VISITEDDATE");
		conditionMap.put("작성자", "WRITER");

		return conditionMap;
	}

	// 리뷰 리스트 페이지
	@RequestMapping("/getReviewList.do")
	public String getReviewList(Model model, ReviewVO vo) {
		System.out.println("리뷰 리스트 페이지 controller 호출");

		// 검색 기능 추가
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}

		if (vo.getSearchKeyword() == null) {
			System.out.println(vo.getSearchKeyword());
			vo.setSearchKeyword("");
		}

		System.out.println("검색 기능 확인" + vo.getSearchKeyword());

		List<ReviewVO> list = reviewService.getReviewList(vo);

		model.addAttribute("reviewList", list);

		return "review/getReviewList";
	}

	// 리뷰 상세보기 페이지
	@RequestMapping("/getReviewDetail.do")
	public String getReviewDetail(ReviewVO vo, Model model) {
		System.out.println("리뷰 상세보기 페이지 controller 호출");

		ReviewVO review = reviewService.getReviewDetail(vo.getSeq());

		model.addAttribute("review", review);

		System.out.println("상세보기 기능 controller 확인");

		return "review/getReviewDetail";
	}

	// 리뷰 수정 화면
	@RequestMapping("/updateReviewForm.do")
	public String updateReviewForm(ReviewVO vo, Model model) {
		System.out.println("글 수정 화면.");

		ReviewVO review = reviewService.updateReviewForm(vo.getSeq());

		model.addAttribute("review", review);

		return "review/updateReviewForm";
	}

	// 리뷰 수정 처리
	@RequestMapping("/updateReview.do")
	public String updateReview(ReviewVO vo) {
		System.out.println("글 수정 처리.");

		reviewService.updateReview(vo);

		return "redirect:getReviewList.do";
	}

	// 리뷰 삭제
	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewVO vo) {
		System.out.println("글 삭제 처리.");

		reviewService.deleteReview(vo.getSeq());

		return "redirect:getReviewList.do";
	}

}

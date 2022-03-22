package com.springcompany.prz.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springcompany.biz.admin.dao.NoticeVO;
import com.springcompany.biz.admin.dao.QnaVO;
import com.springcompany.biz.admin.service.AdminService;
import com.springcompany.biz.user.dao.UserVO;

@Controller
public class AdminController {

	@Autowired // 서비스 객체 주입
	AdminService adminService;

	// 회원관리 페이지 호출
	@RequestMapping("/manageMember.me")
	public String manageMember(Model model) {

		System.out.println("회원관리 페이지 호출");

		List<UserVO> list = adminService.manageMember();
		model.addAttribute("userList", list);

		return "admin/manageMember";
	}

	// 회원 상세보기
	@RequestMapping("/getMemberDetail.me")
	public String getMemberDetail(HttpServletRequest request, Model model) {

		System.out.println("회원 상세보기 호출");

		String id = request.getParameter("id");

		UserVO user = adminService.getMemberDetail(id);

		model.addAttribute("userDetail", user);

		return "admin/getMemberDetail";
	}

	// 관리자 회원탈퇴 처리
	@RequestMapping("/deleteMember.me")
	public String deleteMember(HttpServletRequest request) {

		System.out.println("회원 탈퇴 처리");

		String id = request.getParameter("id");

		if (id.equals("admin")) {
			System.out.println("관리자는 탈퇴할 수 없습니다.");
			return "redirect:manageMember.me";
		} else {
			adminService.deleteMember(id);
		}
		return "admin/manageMember";
	}

	// 관리자 페이지 호출
	@RequestMapping("/adminPage.me")
	public String adminPage() {

		System.out.println("관리자 페이지 호출");

		return "admin/adminPage";
	}

	// 공지사항 페이지 호출
	@RequestMapping("/getNoticeList.do")
	public String getNoticeList(Model model) {

		System.out.println("공지사항 페이지 호출");

		List<NoticeVO> list = adminService.getNoticeList();

		model.addAttribute("noticeList", list);

		return "admin/getNoticeList";
	}

	// 공지사항 글쓰기 페이지 호출
	@RequestMapping("/insertNoticeForm.do")
	public String insertNoticeForm() {

		System.out.println("공지사항 글쓰기 페이지 호출");

		return "admin/insertNoticeForm";
	}

	// 공지사항 글쓰기 처리
	@RequestMapping("/insertNotice.do")
	public String insertNotice(NoticeVO vo) {
		System.out.println("공지사항 글쓰기 처리");
		adminService.insertNotice(vo);

		return "redirect:getNoticeList.do";
	}

	// 공지사항 상세보기 호출
	@RequestMapping("/getNoticeDetail.do")
	public String getNoticeDetail(int seq, Model model) {

		System.out.println("공지사항 상세보기 호출");

		NoticeVO vo = adminService.getNoticeDetail(seq);

		model.addAttribute("noticeDetail", vo);

		return "admin/getNoticeDetail";
	}

	// 공지사항 수정 화면 호출
	@RequestMapping("/updateNoticeForm.do")
	public String updateNoticeForm(int seq, Model model) {

		System.out.println("공지사항 수정 화면 호출");

		NoticeVO vo = adminService.getNoticeDetail(seq);

		model.addAttribute("noticeDetail", vo);

		return "admin/updateNoticeForm";
	}

	// 공지사항 수정 처리
	@RequestMapping("/updateNotice.do")
	public String updateNotice(NoticeVO vo) {

		System.out.println("공지사항 수정 처리");
		adminService.updateNotice(vo);

		return "redirect:getNoticeList.do";
	}

	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(HttpServletRequest request) {
		System.out.println("공지사항 삭제 처리");

		int seq = Integer.parseInt(request.getParameter("seq"));

		adminService.deleteNotice(seq);

		return "redirect:getNoticeList.do";
	}

	// 문의관련 시작

	// 관리자 회원문의 게시판 검색기능
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();

		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");

		return conditionMap;
	}

	// 관리자 회원문의 게시판 리스트
	@RequestMapping("/getQnaList.me")
	public String getQnaList(Model model, QnaVO vo, HttpServletRequest request) {

		System.out.println("회원문의 게시판 불러오기 처리");

//		// 페이징
//		String nowPage = request.getParameter("nowPage");
//		String cntPerPage = request.getParameter("cntPerPage");
//
//		int total = adminService.countboard();
//
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "10";
//			System.out.println("string cnt : " + cntPerPage);
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) {
//			cntPerPage = "10";
//		}
//		vo.setEnd(Integer.parseInt(nowPage) * Integer.parseInt(cntPerPage));
//		vo.setStart(vo.getEnd() - Integer.parseInt(cntPerPage) + 1);
//
//		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		System.out.println("글 목록 검색 처리");

		// 검색 기능 추가
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}

		if (vo.getSearchKeyword() == null) {
			System.out.println(vo.getSearchKeyword());
			vo.setSearchKeyword("");
		}

		System.out.println("검색 기능 확인" + vo.getSearchKeyword());

		List<QnaVO> qnaList = adminService.getQnaList(vo);

		model.addAttribute("qnaList", qnaList);

		return "admin/getQnaList";
	}

	// 관리자 회원문의 상세보기
	@RequestMapping("/getQnaDetail.me")
	public String getQnaDetail(QnaVO vo, Model model) {

		System.out.println("회원문의 게시판 상세보기 처리");
		QnaVO getQnaDetail = adminService.getQnaDetail(vo.getSeq());

		model.addAttribute("getQnaDetail", getQnaDetail);

		return "admin/getQnaDetail";
	}

	// 문의관련 끝

}

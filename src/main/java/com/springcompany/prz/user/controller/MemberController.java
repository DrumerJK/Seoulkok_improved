package com.springcompany.prz.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springcompany.biz.admin.dao.QnaVO;
import com.springcompany.biz.review.dao.ReviewVO;
import com.springcompany.biz.user.dao.userVO;
import com.springcompany.biz.user.service.UserService;

@Controller
public class MemberController {

	@Autowired // 서비스 객체 주입
	UserService userService;

	// USER파트 처리 Controller 시작

	// 로그인 화면
	@RequestMapping(value = "/loginForm.me", method = RequestMethod.GET)
	public String loginForm() {

		System.out.println("로그인 화면 호출");

		return "user/loginForm";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginForm.me", method = RequestMethod.POST)
	public String loginProcess(userVO vo, HttpSession session) { // 세션객체 매개변수로 추가
		System.out.println("로그인 처리");
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());

		String result = userService.loginProcessService(vo, session); // 세션객체도 서비스에 같이 전달

		return result;
	}

	// 로그아웃
	@RequestMapping("/logout.me")
	public String logout(userVO vo, HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 기능 호출");
		return "user/loginForm";

	}

	// 회원가입 화면
	@RequestMapping(value = "/membershipForm.me", method = RequestMethod.GET)
	public String membershipform(userVO vo) {

		System.out.println("회원가입 화면 호출");

		return "user/membershipForm";
	}

	// 회원가입
	@RequestMapping(value = "/membershipForm.me", method = RequestMethod.POST)
	public String insertUser(userVO vo, HttpServletRequest request) {

		if (userService.checkIdService(request.getParameter("id"))
				&& request.getParameter("password").equals(request.getParameter("checkPassword"))) {
			userService.insertUserService(vo);
			return "user/loginForm";
		} else {
			return "user/membershipForm";
		}

	}

	// 마이페이지 호출
	@RequestMapping("/myPage.me")
	public String myPage(userVO vo, HttpSession session) {

		System.out.println("마이페이지 화면 호출");

		if (session.getAttribute("loginId") != null) {
			System.out.println("마이페이지 이동");
			return "user/myPage";
		} else {
			System.out.println("로그인 이동");
			return "user/loginForm";
		}

	}

	// 회원정보수정 화면
	@RequestMapping(value = "/updateUserForm.me", method = RequestMethod.GET)
	public String updateUserForm() {

		System.out.println("회원정보수정 화면 호출");

		return "user/updateUserForm";
	}

	// 회원정보수정 처리
	@RequestMapping(value = "/updateUserForm.me", method = RequestMethod.POST)
	public String updateUser(userVO vo) {

		System.out.println("회원정보수정 처리");

		userService.updateUserService(vo);

		return "user/myPage";
	}

	// 회원탈퇴화면
	@RequestMapping(value = "/deleteUser.me", method = RequestMethod.GET)
	public String deleteForm() {

		System.out.println("회원탈퇴 화면 호출");

		return "user/deleteUser";
	}

	// 회원탈퇴처리
	@RequestMapping(value = "/deleteUser.me", method = RequestMethod.POST)
	public String deleteProcess(HttpServletRequest request, HttpSession session) {
		// 탈퇴시 '네'를 했을때 파라미터로
		System.out.println("회원탈퇴 처리 호출"); // 아이디가 같이 전달되어 옴.

		session.invalidate(); // 회원탈퇴이므로 세션에서도 id정보 지움
		userService.deleteUserService(request.getParameter("id")); // 그 파라미터를 받기 위해 매개변수로
																	// request를 받아서 서비스로 전달
		return "redirect:loginForm.me";
	}

	// USER 파트 처리 Controller 끝

	// 회원 문의 Controller 시작

	// 회원 문의 리스트
	@RequestMapping("/getUserQnaList.me")
	public String getUserQnaList(Model model, HttpSession session) {

		System.out.println("회원 문의 리스트 화면 호출");

		String loginId = session.getAttribute("loginId").toString();

		List<QnaVO> list = userService.getUserQnaList(loginId);

		model.addAttribute("qnaList", list);

		return "user/getUserQnaList";
	}

	// 회원 문의 상세 보기
	@RequestMapping("/getQnaDetail.do")
	public String getQnaBoard(HttpServletRequest request, Model model) {
		System.out.println("문의글 상세 조회 처리");

		int seq = Integer.parseInt(request.getParameter("seq"));

		QnaVO qna = userService.getQnaDetail(seq);

		model.addAttribute("getQnaDetail", qna);

		return "admin/getQnaDetail";
	}

	// 회원 문의 작성 화면
	@RequestMapping("/insertQnaForm.me")
	public String insertQnaForm() {

		System.out.println("회원 문의 쓰기 화면 호출");

		return "user/insertQnaForm";
	}

	// 회원 문의 작성하기
	@RequestMapping("/insertQna.me")
	public String insertQnaForm(QnaVO vo) {

		System.out.println("회원 문의 쓰기 처리");

		userService.insertQna(vo);

		return "redirect:getUserQnaList.me";
	}

	// 회원 문의 수정 화면
	@RequestMapping("/updateQnaForm.me")
	public String updateQnaForm(HttpServletRequest request, Model model) {
		System.out.println("회원 문의 수정 화면 호출");

		int seq = Integer.parseInt(request.getParameter("seq"));

		QnaVO qna = userService.getQnaDetail(seq);

		model.addAttribute("getQnaDetail", qna);

		return "user/updateQnaForm";
	}

	// 회원 문의 수정
	@RequestMapping("/updateQna.me")
	public String updateQna(QnaVO vo) {

		System.out.println("회원 문의 수정 처리");

		userService.updateQna(vo);

		return "redirect:getUserQnaList.me";
	}

	// adminService.updateQna(vo);
	// 회원 문의 삭제
	@RequestMapping("/deleteQna.me")
	public String deleteQna(QnaVO vo) {

		System.out.println("회원 문의 삭제");

		userService.deleteQna(vo.getSeq());

		return "redirect:getUserQnaList.me";
	}

	// 회원 문의 Controller 끝

	// 회원이 쓴 리뷰
	@RequestMapping("/getUserReview.me")
	public String getUserReview(HttpSession session, Model model) {

		System.out.println("내가 쓴 리뷰 화면 호출");

		String loginId = session.getAttribute("loginId").toString();

		List<ReviewVO> list = userService.getUserReview(loginId);

		model.addAttribute("reviewList", list);

		return "user/getUserReview";
	}

}

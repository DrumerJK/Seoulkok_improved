package com.springcompany.prz.tour.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {

	// 관광지 리스트 페이지
	@RequestMapping("/getTourList.do")
	public String getTourList() {
		System.out.println("관광지 리스트 페이지 호출");

		return "tour/getTourList";
	}

	// 관광지 검색 리스트 페이지
	@RequestMapping("/getTourListSearch.do")
	public String getTourListSearch(Model model, HttpServletRequest request) {
		System.out.println("관광지 검색 리스트 페이지 호출");

		String keyword;
		try {
			keyword = URLEncoder.encode(request.getParameter("searchKeyword"), "UTF-8");
			model.addAttribute("searchKeyword", keyword);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return "tour/getTourList";
	}

	// 관광지 정보 페이지
	@RequestMapping("/getTourInfo.do")
	public String getTourInfo() {
		System.out.println("관광지 정보 페이지 호출");

		return "tour/getTourInfo";
	}

}

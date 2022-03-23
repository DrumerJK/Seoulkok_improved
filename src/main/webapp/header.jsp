<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
    <div class="container-fluid">
      <a class="navbar-brand title" href="/biz">
      	<span id="titleFont1">서울</span> 
		<span id="titleFont2">콕</span>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/biz">홈</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="getTourList.do">서울관광지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getReviewList.do">관광지리뷰</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getNoticeList.do">공지사항</a>
          </li>
        </ul>
        <div class="d-flex">
			<%if(session.getAttribute("loginEmail") == null){ %>
			&nbsp;<a class="memberMenu"  href="loginForm.me">로그인</a>&nbsp;
			<%} else{%>
			&nbsp;<a class="memberMenu" href="logout.me" data-bs-toggle="modal" data-bs-target="#exampleModal">로그아웃</a>&nbsp;
			<%} %>
			<%if(session.getAttribute("loginEmail") != null){ %>
			<%	if(!session.getAttribute("loginEmail").equals("admin@naver.com")) {%>
			&nbsp;<a class="memberMenu" href="myPage.me">마이페이지</a>&nbsp;
			<%} 
			}%>
			<%if(session.getAttribute("loginEmail") != null){ %>
			<%	if(session.getAttribute("loginEmail").equals("admin@naver.com")) {%>
			&nbsp;<a class="memberMenu" href="adminPage.me">관리자페이지</a>&nbsp;
			<%}	
			} %>
        </div>
      </div>
    </div>
  </nav>
</header>
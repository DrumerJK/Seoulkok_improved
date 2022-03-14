<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 콕: 당신의 서울을 즐겁게</title>

<style type="text/css">

	/* 헤더 영역 CSS */
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	
	header{
		width: 100%;
		height: 85px;
		position: fixed;
		top: 0;
		left: 0;
		background-color: white;
		border-bottom: 1px solid rgb(230, 230, 230); 
	}
	
	a{
		text-decoration: none;
	}
	
	#memberMenu{
		width: 100%;
		text-align: right;
		background: rgb(230, 230, 230); 
		font-size: small;
	}
	
	.memberMenu{
		color: rgb(100, 100, 100);		
	}
	
	.memberMenu:hover{
		text-decoration: underline;
	}
	
	#logo{
		font-family: 'Hanna', sans-serif;
		font-size: 3.5em;
		margin: 20px;
	}
	
	#logoFont1{
		color: rgb(100, 100, 100);
	}
	
	#logoFont2{
		color: rgb(0, 121, 188);
	}
	
	#mainMenu{
		float: right;
		margin-top: 22px;
		padding-right: 20px;
		font-family: 'Hanna', sans-serif;
		font-size: 2em;
	}
	
	.mainMenu{
		color: rgb(100, 100, 100);
		transition-duration: 0.3s;
	}
	
	.mainMenu:hover{
		color: rgb(0, 121, 188);
		font-size: 1.2em;
		transition-duration: 0.3s;
	}
	
	/* 헤더영역 CSS 끝 */

	#titleSpace{
		height:85px;
	}
	
	#pageTitle{
		height: 200px;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: large;
		font-family: 'BMDOHYEON', sans-serif;		
	}
	
	
	/* nav영역 CSS 시작 */
	
	nav{
		float: left;
		margin-top: 20px;
		margin-left: 20px;
	}
	
	ul{
		list-style: none;
	}
	
	li{
		margin-top: 20px;
		margin-bottom: 20px;
		padding: 10px;
		background: rgb(230, 230, 230);
		border-radius: 10px;
	}
	
	li a{
		font-size: large;
		color: rgb(100, 100, 100);
	}
	
	/* nav영역 CSS 끝 */
	
	/* 섹션영역 CSS 시작 */
	
	section{
		position: fixed;
		top: 42%;
		left:20%;
		width: 60%;
		height: 300px;
		border-top: 1px solid rgb(230, 230, 230);
		border-bottom: 1px solid rgb(230, 230, 230);
		
	}
	
	#welcome{
		
		font-size: xx-large;
		font-family: 'Hanna', sans-serif;
	}
	
	#ment{
		
		font-size: x-large;
		font-family: 'Hanna', sans-serif;
	}
	
	
	/* 섹션영역 CSS 끝 */
	

</style>

</head>
<body>

	<header>
		<div id="memberMenu">
			<%if(session.getAttribute("loginId") == null){ %>
			&nbsp;<a class="memberMenu"  href="loginForm.me">로그인</a>&nbsp;
			<%} else{%>
			&nbsp;<a class="memberMenu" href="logout.me">로그아웃</a>&nbsp;
			<%} %>
			<%if(session.getAttribute("loginId") != null){ %>
			<%	if(!session.getAttribute("loginId").equals("admin")) {%>
			&nbsp;<a class="memberMenu" href="myPage.me">마이페이지</a>&nbsp;
			<%} 
			}%>
			<%if(session.getAttribute("loginId") != null){ %>
			<%	if(session.getAttribute("loginId").equals("admin")) {%>
			&nbsp;<a class="memberMenu" href="adminPage.me">관리자페이지</a>&nbsp;
			<%}	
			} %>
		</div>
		<span id="logo">
			<a href="/biz">
				<span id="logoFont1">서울</span> 
				<span id="logoFont2">콕</span>
			</a>
		</span>
		<span id="mainMenu">
			<a class="mainMenu" href="getTourList.do">서울관광지</a>&nbsp;
			&nbsp;<a class="mainMenu"  href="getReviewList.do">관광지리뷰</a>&nbsp;
			&nbsp;<a class="mainMenu"  href="getNoticeList.do">공지사항</a>
		</span>
	</header>

	<div id="titleSpace"></div>
	<hr>
		<div id="pageTitle">
			<h1 align="center">내 정보</h1>
		</div>
	<hr>
	
	<nav>
		<ul>
			<li><a href="getUserReview.me">내가 쓴 리뷰</a></li>
			<li><a href="getUserQnaList.me">나의 문의</a></li>
			<li><a href="updateUserForm.me">회원정보수정</a></li>
			<li><a href="deleteUser.me">회원탈퇴</a></li>
		</ul>
	</nav>
	
	<section>
		<div align="center">
			<br><br><br>
			<div id="welcome">${loginId}님, 환영합니다!</div>
			<br><br><br>
			<div id="ment">서울 콕은 500건 이상의 서울 내 관광지 정보와 리뷰 서비스를 제공하고 있습니다.</div>
		</div>
	</section>
	
</body>
</html>
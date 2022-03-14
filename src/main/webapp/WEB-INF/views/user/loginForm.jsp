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
	
	/* 섹션영역 CSS 시작 */
	
	#wrapper{
		margin: 10% auto;
		
	}
	
	td{
		padding: 10px;
	}
	
	.category{
		width: 100px;
		height: 30px;
		background: rgb(0, 121, 188);
		text-align: center;
		color: white;
		border-radius: 10px;
		font-size: large;
	}
	
	#inputId, #inputPw{
		width: 250px;
		height: 30px;
		border: solid 2px rgb(0, 121, 188);		
		border-radius: 10px;
		font-size: large;
	}
	
	
	#loginButton{
		height: 100px;
		padding: 20px;
		background: rgb(0, 121, 188);
		text-align: center;
		color: white;
		border: white;
		border-radius: 10px;
		font-size: large;
	}
	
	#loginButton:hover{
		cursor: pointer;
	}
	
	#buttons{
		text-align: right;
	}
	
	#buttons a{
		color: rgb(100, 100, 100);
	}
	
	#buttons a:hover{
		text-decoration: underline;
		
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
			<h1 align="center">로그인</h1>
		</div>
	<hr>

	<div id="wrapper" align="center">
		<form action="loginForm.me"  method="post">
			<table>
				<tr>
					<td><div class="category">아이디</div></td>
					<td><input type="text" name="id" id="inputId"></td>
					<td rowspan="2"><input type="submit" value="로그인" id="loginButton"></td>
				</tr>
				<tr>
					<td><div class="category">비밀번호</div></td>
					<td><input type="password" name="password" id="inputPw"></td>
				</tr>
				<tr>
					<td colspan="3" id="buttons">
						<a href="#">비밀번호 찾기</a>&nbsp;/&nbsp;
						<a href="#">아이디 찾기</a>&nbsp;/&nbsp;
						<a href="membershipForm.me">회원가입</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
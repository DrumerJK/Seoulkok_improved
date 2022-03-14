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
		width: 60%;
		margin: 0 auto;
		border: 2px solid rgb(230, 230, 230);
		border-radius: 10px;
	}
	
	table{
		width: 50%;
		padding: 30px;
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
	
	#inputId, #inputPw, #inputChkPw, #inputName, #inputEmail, #inputDate{
		width: 300px;
		height: 30px;
		border: solid 2px rgb(0, 121, 188);		
		border-radius: 10px;
		font-size: large;
	}
	
	
	#submitButton{
		height: 50px;
		margin-left: 20px;
		background: rgb(0, 121, 188);
		text-align: center;
		color: white;
		border: white;
		border-radius: 10px;
		font-size: large;
	}
	
	#submitButton:hover{
		cursor: pointer;
	}
	
	#buttons{
		text-align: right;
	}
	
	#buttons a{
		color: rgb(100, 100, 100);
		height: 50px;
		padding: 13px;
		background: rgb(230, 230, 230);
		text-align: center;
		border: white;
		border-radius: 10px;
		font-size: large;
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
			<h1 align="center">회원가입</h1>
		</div>
	<hr>
<div id="wrapper" align="center">
	<form action="membershipForm.me" method="post">
		<table>
			<tr>
				<td class="category">아이디</td>
				<td><input type="text" name="id" id="inputId"></td>
			</tr>
			<tr>
				<td class="category">비밀번호</td>
				<td><input type="password" name="password" id="inputPw"></td>
			</tr>
			<tr>
				<td class="category">비밀번호 확인</td>
				<td ><input type="password" name="checkPassword" id="inputChkPw"></td>
			</tr>
			<tr>
				<td class="category">이름</td>
				<td><input type="text" name="name" id="inputName"></td>
			</tr>
			<tr>
				<td class="category">E-Mail</td>
				<td><input type="email" name="email" id="inputEmail"></td>
			</tr>
			<tr>
				<td class="category">생년월일</td>
				<td><input type="date" name="birthDate" id="inputDate"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="buttons">
						<a href="loginForm.me">뒤로</a>
						<input type="submit" value="회원가입" id="submitButton">&nbsp;&nbsp;&nbsp;
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
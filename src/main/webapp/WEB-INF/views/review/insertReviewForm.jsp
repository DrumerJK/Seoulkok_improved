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
	@font-face {
	    font-family: 'BMDOHYEON';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMDOHYEON.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	
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
	
	#wrapper{
		width:80%;
		margin: 0 auto;
	}
	
	table{
		width:100%;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.category{
		padding: 20px;
		font-weight: bold;
		font-size: x-large;
		font-family: 'BMJUA', sans-serif;
	}
	
	#title, #target{
		width: 250px;
		height: 30px;
		font-size: large;
		font-family: 'BMJUA', sans-serif;
		border: 1px solid rgb(0, 121, 188);
		border-radius: 10px;
	}
	
	#writer{
		font-size: large;
		font-family: 'BMJUA', sans-serif;
	}
	
	#love{
		height: 30px;
		font-size: large;
		font-family: 'BMJUA', sans-serif;
		border: 1px solid rgb(0, 121, 188);
		border-radius: 10px;
		color: rgb(255, 205, 18);
	}
	
	textarea{
		height: 500px;
		font-size: large;
		font-family: 'BMJUA', sans-serif;
		border: 1px solid rgb(0, 121, 188);
		border-radius: 10px;
	}
	
	#file{
		height: 30px;
		font-size: large;
		font-family: 'BMJUA', sans-serif;
		border: 1px solid rgb(230, 230, 230);
		border-radius: 10px;
	}
	
	#date, #companion, #time{
		height: 30px;
		font-size: large;
		font-family: 'BMJUA', sans-serif;
		border: 1px solid rgb(0, 121, 188);
		border-radius: 10px;
	}
	
	
	#buttons{
		height: 70px;
		text-align: right;
	}
	
	#buttons a{
		margin-left: 20px;
		padding: 10px;
		background: rgb(230, 230, 230);
		color: rgb(100, 100, 100);
		border-radius: 10px;
		font-family: 'BMJUA', sans-serif;
		font-size: large;
	}
	
	#buttons input{
		padding: 10px;
		background: rgb(0, 121, 188);
		color: white;
		border: white;
		border-radius: 10px;
		font-family: 'BMJUA', sans-serif;
		font-size: large;
	}
	
	#buttons input:hover{
		 cursor: pointer;
	}

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
					<h1 align="center">관광지 리뷰</h1>
				</div>
			<hr>

	<div align="center" id="wrapper">
		
		<form action="insertReview.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td class="category"> 체험 평가하기(필수) &nbsp;</td>
				<td>
					<select name="love" id="love">
						<option value="★★★★★">★★★★★
						<option value="★★★★☆">★★★★☆
						<option value="★★★☆☆">★★★☆☆
						<option value="★★☆☆☆">★★☆☆☆
						<option value="★☆☆☆☆">★☆☆☆☆
					</select>
				</td>
			</tr>		
			<tr>
				<td class="category">방문한 장소</td>
				<td><input type="text" name="target" id="target"></td>
			</tr>
			<tr>
				<td class="category">리뷰 제목(필수)</td>
				<td><input type="text" name="title" id="title"/></td>
			</tr>
			<tr>
				<td class="category">작성자</td>
				<td align="left" id="writer"><input type="hidden" name="writer" size="20" value="${loginId}" />${loginId}</td>
			</tr>
			<tr>
				<td class="category">리뷰 남기기</td>
				<td><textarea cols="100" rows="20" name="content"></textarea></td>
			</tr>
			<tr>
				<td class="category">추억 업로드</td>
				<td colspan="2"><input type="file" name="fileUpload" id="file"></td>
			</tr>
			<tr>
				<td class="category">방문 일자</td>
				<td align="left"><input type="date" name="visitedDate" id="date" /></td>
			</tr>
			<tr>
				<td class="category">동행자 &nbsp;</td>
				<td >
					<select name="companion" id="companion">
						<option value="커플">커플
						<option value="가족(아이 동반)">가족(아이 동반)
						<option value="가족">가족
						<option value="친구들">친구들
						<option value="비즈니스">비즈니스
						<option value="나홀로 여행">나홀로 여행
					</select>
				</td>
			</tr>
			<tr>
				<td class="category">추천 방문 시간 &nbsp;</td>
				<td>
					<select name="recommendationTime" id="time">
						<option value="1시간 미만">1시간 미만
						<option value="1-2시간">1-2시간
						<option value="2-3시간">2-3시간
						<option value="3시간 이상">3시간 이상
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" id="buttons">
					<input type="submit" value="작성 완료"><a href="getReviewList.do">취소</a>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>
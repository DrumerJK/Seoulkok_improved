<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
	
	li:nth-child(1){
		background: rgb(0, 121, 188);
	}
	
	li a{
		font-size: large;
		color: rgb(100, 100, 100);
	}
	
	li:nth-child(1) a{
		color: white;
	}
	
	/* nav영역 CSS 끝 */
	
		
	/* 내용영역 CSS 시작 */
	
	#wrapper{
		width: 60%;
		margin: 0 auto;
		border-radius: 10px;
		font-family: 'BMDOHYEON', sans-serif;
	}
	#searchBox{
		text-align: right;		
	}
	
	table{
		width: 100%;
		padding: 30px;
	}
	
	td{
		padding: 10px;
		border-bottom: 1px solid rgb(230, 230, 230);
		text-align: center;
	}
	
	.category{
		height: 30px;
		background: rgb(230, 230, 230);
		text-align: center;
		color: rgb(100, 100, 100);
		border-radius: 10px;
		font-size: large;
	}
	
	select{
		height: 38px;
		border: solid 2px rgb(0, 121, 188);		
		border-radius: 10px;
		font-size: large;
		font-family: 'BMDOHYEON', sans-serif;		
		color: rgb(100, 100, 100);
	}
	
	#inputKeyword{
		width: 30%;
		height: 30px;
		border: solid 2px rgb(0, 121, 188);		
		border-radius: 10px;
		font-size: large;
		
	}
	
	#searchButton{
		margin-left: 10px;
		height: 40px;
		padding: 5px;
		border: white;
		background: rgb(0, 121, 188);	
		color: white;	
		border-radius: 10px;
		font-size: large;
		font-family: 'BMDOHYEON', sans-serif;
	}
	
	#searchButton:hover{
		cursor: pointer;
	}
	
	#seq{
		width:5%;
	}
	
	#love{
		width: 15%;
		color: rgb(255, 205, 18);
		font-size: x-large;
	}
	
	#title{
		width: 20%;
		font-size: 1.2em;
	}
	
	#title a{
		color: rgb(100, 100, 100);
	}
	
	#title a:hover{
		color: rgb(200, 200, 200);
	}
	
	#content{
		text-align: left;
	}
	
	#target{
		text-align: right;
	}
	
	#writeButtontd{
		text-align: right;
	}
	
	#writeButton{
		margin-left: 10px;
		height: 40px;
		padding: 10px;
		border: white;
		background: rgb(0, 121, 188);	
		color: white;	
		border-radius: 10px;
		font-size: large;
		font-family: 'BMDOHYEON', sans-serif;
	}
	
	/* 내용영역 CSS 끝 */

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
			<h1 align="center">내가 쓴 리뷰</h1>
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

    
<div align="center" id="wrapper">

		<table>
			<tr align="center">
				<td class="category">번호</td>
				<td class="category">체험 평가</td>
				<td class="category">제목</td>
				<td class="category">방문 일자</td> <!-- 위치 수정 -->
				<td class="category">내용</td> <!-- 삽입 -->
				<td class="category">작성자</td>
				<td class="category">방문한 장소</td>
				<!-- 관광지 이름 -> 방문한 장소로 수정 -->
			</tr>
			<c:forEach items="${reviewList}" var="review">
				<tr align="center">
					<td id="seq">${review.seq}</td>
					<td id="love">${review.love}</td>
					<td	id="title"
								style=" 
								max-width: 150px; 
								overflow: hidden; 
								white-space: nowrap; 
								text-overflow: ellipsis;"><a href="getReviewDetail.do?seq=${review.seq}">${review.title}</a>
					</td>
					<td id="date">${review.visitedDate}</td>
					<td id="content"
								style=" 
								max-width: 200px; 
								overflow: hidden; 
								white-space: nowrap; 
								text-overflow: ellipsis;">${review.content}
					</td>
					<td id="writer">${review.writer}</td>
					<td  id="target"
								style=" 
								max-width: 120px; 
								overflow: hidden; 
								white-space: nowrap; 
								text-overflow: ellipsis;">${review.target}
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8" align="right" id="writeButtontd"><a href="insertReviewForm.do" id="writeButton">리뷰쓰기</a></td>
			</tr>
		</table>
</div>
</body>
</html>
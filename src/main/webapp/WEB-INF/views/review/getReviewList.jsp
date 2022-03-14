<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    font-family: 'BMHANNAAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
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
	
	
	/* 내용영역 CSS 시작 */
	
	#wrapper{
		width: 80%;
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
		width: 60px;
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
					<h1 align="center">관광지 리뷰</h1>
				</div>
			<hr>

<div align="center" id="wrapper">
	 	
		<form action="getReviewList.do" method="post">
			<table>
				<tr>
					<td align="right" id="searchBox">
					<select name="searchCondition">
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}
						</c:forEach>
					</select> 
					<input name="searchKeyword" type="text" id="inputKeyword" /> 
					<input type="submit" value="검색"  id="searchButton" /></td>
				</tr>
			</table>
		</form>

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
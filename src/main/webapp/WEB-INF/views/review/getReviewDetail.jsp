<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	
	#title, #writer, #target, #love, #postedDate, 
	#content, #visitedDate, #companion, #time, #cnt{
		font-size: x-large;
		font-family: 'BMJUA', sans-serif;
		border-bottom: 1px solid rgb(230, 230, 230);
	}
	
	#target{
		font-size: xx-large;
	}
	
	#target a{
		color: black;
	}
	
	#target a:hover{
		color: rgb(100, 100, 100);
	}
	
	#target span{
		font-size: medium;
		color: rgb(100, 100, 100);
	}
	
	#love{
		font-size: xx-large;
		color: rgb(255, 205, 18);
	}
	
	#content{
		height: 500px;
	}
	
	#buttons{
		height: 70px;
		text-align: right;
	}
	
	#buttons a{
		padding: 10px;
		background: rgb(230, 230, 230);
		color: rgb(100, 100, 100);
		border-radius: 10px;
		font-family: 'BMJUA', sans-serif;
		font-size: large;
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
	
		<input name="seq" type="hidden" value="${review.seq}" />
		
		<table>
			<tr>
				<td class="category" align="left"> 리뷰 제목</td>
				<td id="title" align="left"> ${review.title}</td>
			<tr>
				<td class="category" > 작성자</td>
				<td id="writer" align="left"> ${review.writer}</td>
			</tr>
			<tr>
				<td class="category" align="left"> 방문한 장소</td>
				<td id="target" align="left">
					<a href="getTourListSearch.do?searchKeyword=${review.target}">${review.target}</a>
					<span>클릭하시면 관광지 정보를 검색합니다.</span>
				</td>
			</tr>
			<tr>
				<td  class="category"  align="left"> 체험 평가</td>
				<td id="love" align="left"> ${review.love}</td>
			</tr>
			<tr>
				<td  class="category"  align="left"> 게시일</td>
				<td id="postedDate" align="left"> ${review.postedDate}</td>
			</tr>
			<tr>
				<td class="category"  align="left"> 리뷰 남기기 </td>
				<td id="content" align="left"> ${review.content}</td>
			</tr>
			<tr>
				<td  class="category"  align="left"> 방문 사진 </td>
				<td id="img" align="left"><img width="800px" src="reviewUpload/${review.fileName}"></td>
			</tr>
			<tr>
				<td class="category"  align="left"> 방문 일자 </td><!-- 리뷰 남기기 -->
				<td id="visitedDate" align="left"> ${review.visitedDate}</td>
			</tr>
			<tr>
				<td class="category"  align="left"> 동행자 </td><!-- 리뷰 남기기 -->
				<td id="companion" align="left"> ${review.companion}</td>
			</tr>
			<tr>
				<td class="category" d align="left"> 추천 방문 시간 </td><!-- 리뷰 남기기 -->
				<td id="time" align="left"> ${review.recommendationTime}</td>
			</tr>
			<tr>
				<td class="category" >조회수</td>
				<td id="cnt" align="left"> ${review.cnt}</td>
			</tr>
			<tr>
				<td id="buttons" colspan="2">
					<c:if test="${ loginId == review.writer }">
						<a href="updateReviewForm.do?seq=${ review.seq }">수정</a>&nbsp;&nbsp;&nbsp; 
						<a href="deleteReview.do?seq=${ review.seq }">삭제</a>&nbsp;&nbsp;&nbsp;			
					</c:if>
						<a href="getReviewList.do">리뷰 리스트</a>
				</td>
			</tr>
		</table>

		
	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springcompany.prz.tour.controller.Keys"%>
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

	#content{
		font-family: 'BMDOHYEON', sans-serif;
	}
	
	a{
		text-decoration: none;
		color: black;
		list-style-type: none;
	}
	
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
	
	#pageTitle h1{
		transition-duration: 0.3s;
		
	}
	
	#pageTitle h1:hover{
		font-size: 2.5em;
		transition-duration: 0.3s;
	}
	
	#areaSearch{
		float: left;
		height: 1800px;
		margin-top: 20px;
		font-family: 'BMDOHYEON', sans-serif;
	}
	
	
	#areaSearch_head{
		width: 200px;
		margin: 20px;
		font-size: x-large;
		padding: 10px 0 10px 0;
		margin-bottom: 10px;
		border-radius: 5px;
		background-color: rgb(0, 121, 188);
		color: white;
	}
	
	#areaNames{
		width: 200px;
		height:0;
		margin: 20px;
		font-size: large;
		border: solid 1px rgb(230, 230, 230);
		transition-duration: 0.8s;
		overflow: hidden;
	}
	
	.areaName{
		width: 75px;
		height: 25px;
		padding: 10px 0 10px 0;
		margin-top: 10px;
		margin-bottom: 10px;
		border-radius: 5px;
		background-color: rgb(230, 230, 230);
	}
	
	#content{
		margin-top: 30px;
		margin-left: 50px;
		width: 75%;
		float: left;
		justify-content: center;
	}
	
	#keywordTable{
		width: 800px;
		height: 75px;
		margin-bottom: 20px;
		border: solid 1px rgb(230, 230, 230);
		border-radius: 10px; 
	}
	
	#keywordTable_ment{
		font-size: large;
		color: rgb(100, 100, 100);
		padding-left: 20px;
	}
	
	#keywordInput{
		height: 30px;
		border: solid 2px rgb(0, 121, 188);
		border-radius: 20px;
		padding-left: 10px;
		margin-right: 10px;
		font-size: medium;
	}
	
	#keywordSubmit{
		width: 50px;
		height: 35px;
		border: white;
		border-radius: 20px;
		margin-right: 20px;
		background-color: rgb(0, 121, 188);
		color: white;
		font-size: medium;
		font-family: 'BMDOHYEON', sans-serif;
	}
	
	#keywordSubmit:hover{
		cursor: pointer;
	}
	
	#tourList{
		width: 800px;
	}
	
	.tourImage_td{
		width: 230px;
		height: 160px;
	}
	
	.tourImage{
		width: 210px;
		height: 140px;
		border-radius: 5px;
	}
	
	
	.tourTitle{
		height: 75px;
		font-size: large;
		padding-left: 50px;
		transition-duration: 0.3s;

	}

	.tourTitle:hover{
		font-size: 1.3em;
		transition-duration: 0.3s;
	}

	.tourArea{
		padding-left: 50px;
		border-bottom: 1px solid rgb(230, 230, 230);
	}
	
	#page{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	#page a, b{
		padding: 5px;
		background: rgb(230, 230, 230);
		border-radius: 5px;
	}
	
	#toTop{
		width:50px;
	 	height:50px;
	 	background: rgb(0, 121, 188);
	 	border-radius: 10px;
	 	line-height:50px;
	 	text-decoration:none;
	 	text-align: center;
		color: white;	 	
	 	position: fixed;
	 	bottom:20px;
	 	right:20px;
	}
	

</style>

<script src="./jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
	//지역구별 검색 
		$(function(){
			$.getJSON('http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?'+
					'ServiceKey=<%=Keys.SERVICE_KEY%>'+
					'&areaCode=1'+
					'&numOfRows=25'+
					'&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json',
				function(data){
					$.each(data.response.body.items.item, function(){
						$('#areaNames').append(
							'<div class="areaName"><a href="getTourList.do?areaSearch='+this.code+'">'+this.name+'</a></div>'
							
						);
					});	
				});
		});
	
	//
		$(function(){
			$.getJSON('http://api.visitkorea.or.kr/openapi/service/rest/KorService/'+
					
					<% if(request.getParameter("searchKeyword") != null){ %>
					'searchKeyword?'+
					<% } else {%>
					'areaBasedList?'+
					<% } %>
					
					'ServiceKey=<%=Keys.SERVICE_KEY%>'+
					'&areaCode=1'+
					
					<% if(request.getParameter("areaSearch")!=null){
					request.setAttribute("areaSearch", request.getParameter("areaSearch"));%>
					'&sigunguCode='+${param.areaSearch}+
					<% } %>
					
					<% if(request.getParameter("searchKeyword") != null){ 
					request.setAttribute("searchKeyword", request.getParameter("searchKeyword"));%>
					'&keyword='+'${searchKeyword}'+
					'&listYN=Y'+
					<% } %>
					
					'&contentTypeId=12'+
					'&arrange=B'+
					'&numOfRows=20'+
					
					<% if(request.getParameter("pageNo")!=null){ %>
					'&pageNo='+${param.pageNo}+
					<% } %>
					'&MobileOS=ETC&MobileApp=AppTest&_type=json', function(data){
				
				if(data.response.body.totalCount == 0){
					$('#tourList').append(
						"<tr>"+
							"<td colspan='3' align='center'>검색된 정보가 없습니다.</td>"+
						"</tr>"
					);
				};
				$.each(data.response.body.items.item, function(){
					$('#tourList').append(
							"<tr>"+
								"<td align='left' rowspan='2' class='tourImage_td'>"+
									"<a href='getTourInfo.do?contentId="+this.contentid+"'>"+
									"<img class='tourImage' src=\""+this.firstimage2+"\" /></a>"+
								"</td>"+
								"<td class='tourTitle' align='left'>"+
									"<a href='getTourInfo.do?contentId="+this.contentid+"'><h2>"+this.title+"</h2></a>"+
								"</td>"+
							"</tr>"+
							"<tr>"+
								"<td class='tourArea' align='left'>"+this.addr1.split(" ")[1]+"<br><br><br></td>"+
							"</tr>"
							);
				});
				
				var totalCount = parseInt(data.response.body.totalCount); //총 결과 수 
				var numOfRows = parseInt(data.response.body.numOfRows); // 한 페이지 출력 개수
				var nowPage = parseInt(data.response.body.pageNo); // 현재 페이지
				var endPage = Math.floor(totalCount/numOfRows+0.95); // 마지막 페이지
				var startPage = (Math.floor((nowPage/10)+0.9)-1)*10+1 //현 페이지에서의 시작 페이지(1, 11, 21, ...)
				var maxPage = startPage+9 //현 페이지에서의 최대 페이지(10, 20, 30, ...)
				
				if(maxPage>=endPage){
					maxPage=endPage
				}
				
				function page () {
				
					var str = '';
					
					if(nowPage == 1){
						str += '이전페이지&nbsp;'
					}else{
						str += '<a href="getTourList.do?pageNo='
						str += (nowPage-1)
						
						<% if(request.getAttribute("areaSearch")!=null){%>
						str +='&areaSearch='
						str += ${requestScope.areaSearch}
						<% } %>
						
						<% if(request.getAttribute("searchKeyword")!=null){%>
						str +='&searchKeyword='
						str += '${searchKeyword}'
						<% } %>
						
						str += '">이전페이지</a>&nbsp;'
					}
					
					for(var i=startPage; i<=maxPage; i++){
						
						if(nowPage == i){
							str += '&nbsp;<b>'
							str += i
							str += '</b>&nbsp;'
						}else{
							str += '&nbsp;<a href="getTourList.do?pageNo='
							str += i
							
							<% if(request.getAttribute("areaSearch")!=null){%>
							str +='&areaSearch='
							str += ${requestScope.areaSearch}
							<% } %>
							
							<% if(request.getAttribute("searchKeyword")!=null){%>
							str +='&searchKeyword='
							str += '${searchKeyword}'
							<% } %>
							
							str += '">'
							str += i
							str += '</a>&nbsp;'
						}
					}
					
					if(nowPage == endPage){
						str += '&nbsp;다음페이지'
					}else{
						str += '&nbsp;<a href="getTourList.do?pageNo='
						str += (nowPage+1)
						
						<% if(request.getAttribute("areaSearch")!=null){%>
						str +='&areaSearch='
						str += ${requestScope.areaSearch}
						<% } %>	
						
						<% if(request.getAttribute("searchKeyword")!=null){%>
						str +='&searchKeyword='
						str += '${searchKeyword}'
						<% } %>
						
						str += '">다음페이지</a>'
					}
					
					return str;
				}
				
				$('#page').append(page());
				
			});
			
		});
	
	
	//지역별 검색 슬라이드 동작
	$(function(){
		$('#areaSearch').hover(function(){
				$('#areaNames').css('height', '1450px');
		}, function(){
				$('#areaNames').css('height', '0');
		});
	});
	
	
</script>


</head>
<body>
<div id="wrapper">
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
					<a href="getTourList.do"><h1 align="center">서울 관광지</h1></a>
				</div>
			<hr>
		
			<div align="center" id="areaSearch">
				<div id="areaSearch_head">지역별 검색</div>
				<div id="areaNames">
					<div class="areaName"><a href="getTourList.do">전체</a></div>
				</div>
			</div>
		
			
		<div id="content">	
			<div align="center" id="keywordSearch">		
				<form action="./getTourListSearch.do">
					<table id="keywordTable">
						<tr>
							<td id="keywordTable_ment">
								500건 이상의 서울 시내 관광지 정보를 검색하세요.
							</td>
							<td align="right">
								<input id="keywordInput" type="text" name="searchKeyword">
								<input id="keywordSubmit" type="submit" value="검색" />
							</td>
						</tr>
					</table>
				</form>
			</div>
			
		
			<table id="tourList" align="center"></table>
			
			<div id="page" align="center"></div>
		</div>
	

	<div>
		<a id="toTop" href="#">▲</a>
	</div>
</div>
</body>
</html>
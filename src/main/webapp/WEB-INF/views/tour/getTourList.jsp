<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springcompany.prz.tour.controller.Keys"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>서울 콕: 당신의 서울을 즐겁게</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sticky-footer-navbar/">

    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      
      
    </style>

    
    <!-- Custom styles for this template -->
    <link href="CSS/getTourList.css" rel="stylesheet">
    <link href="CSS/header_footer.css" rel="stylesheet">
    
    <script src="./jQuery/jquery-3.6.0.js"></script>
	<script type="text/javascript">

	// 지역구별 검색
	$(function(){
		$.getJSON('http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?'+
				'ServiceKey=<%=Keys.SERVICE_KEY%>'+
				'&areaCode=1'+
				'&numOfRows=25'+
				'&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json',
			function(data){
				$.each(data.response.body.items.item, function(){
					$('#areaNames').append(
						'<li><a class="dropdown-item" href="getTourList.do?areaSearch='+this.code+'">'+this.name+'</a></li>'
						
					);
				});	
			}
		);
	});
	
	// 키워드 검색
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
			'&MobileOS=ETC&MobileApp=AppTest&_type=json', 
			
			function(data){
				if (data.response.body.totalCount == 0){
					$('#tourList').append(
						'<div class="container text-center">'+
							'<h4>검색된 정보가 없습니다.</h4>'+
						'</div>'
					);
				}
				else if (data.response.body.totalCount == 1){
					$('#tourList').append(
						'<div class="col">'+
				          '<div class="card shadow-sm">'+
				            '<a href="getTourInfo.do?contentId='+data.response.body.items.item.contentid+'">'+
				            	'<img class="bd-placeholder-img card-img-top" width="200" height="150" '+ 
				            	'src="'+data.response.body.items.item.firstimage2+'">'+
				            '</a>'+
				            '<div class="card-body">'+
				              '<h5>'+
				                '<a class="tourTitle" href="getTourInfo.do?contentId='+data.response.body.items.item.contentid+'">'+data.response.body.items.item.title+'</a>'+
				              '</h5>'+
				              '<small class="text-muted">'+data.response.body.items.item.addr1.split(" ")[1]+'</small>'+
				            '</div>'+
				         '</div>'+
				        '</div>'
					);
				}
				else {
				$.each(data.response.body.items.item, function(){
					$('#tourList').append(
						'<div class="col">'+
				          '<div class="card shadow-sm">'+
				            '<a href="getTourInfo.do?contentId='+this.contentid+'">'+
				            	'<img class="bd-placeholder-img card-img-top" width="200" height="150" '+ 
				            	'src="'+this.firstimage2+'">'+
				            '</a>'+
				            '<div class="card-body">'+
				              '<h5>'+
				                '<a class="tourTitle" href="getTourInfo.do?contentId='+this.contentid+'">'+this.title+'</a>'+
				              '</h5>'+
				              '<small class="text-muted">'+this.addr1.split(" ")[1]+'</small>'+
				            '</div>'+
				         '</div>'+
				        '</div>'
					);
				});
				};
				
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
				
					var str = '<nav aria-label="Page navigation example">'+
					   			'<ul class="pagination pagination-sm justify-content-center">';
					
					if(nowPage == 1){
					   	str += '<li class="page-item disabled"><a class="page-link">◀</a></li>'
					}else{
						str += '<li class="page-item"><a class="page-link" href="getTourList.do?pageNo='
						str += (nowPage-1)
						
						<% if(request.getAttribute("areaSearch") != null){%>
						str +='&areaSearch='
						str += ${requestScope.areaSearch}
						<% } %>
						
						<% if(request.getAttribute("searchKeyword") != null){%>
						str +='&searchKeyword='
						str += '${searchKeyword}'
						<% } %>
						
						str += '">◀</a></li>'
					}
					
					for(var i=startPage; i<=maxPage; i++){
						
						if(nowPage == i){
							str += '<li class="page-item disabled"><a class="page-link">'
							str += i
							str += '</a></li>'
						}else{
							str += '<li class="page-item"><a class="page-link" href="getTourList.do?pageNo='
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
							str += '</a></li>'
						}
					}
					
					if(nowPage == endPage){
						str += '<li class="page-item disabled"><a class="page-link">▶</a></li></ul></nav>'
					}else{
						str += '<li class="page-item"><a class="page-link" href="getTourList.do?pageNo='
						str += (nowPage+1)
						
						<% if(request.getAttribute("areaSearch")!=null){%>
						str +='&areaSearch='
						str += ${requestScope.areaSearch}
						<% } %>	
						
						<% if(request.getAttribute("searchKeyword")!=null){%>
						str +='&searchKeyword='
						str += '${searchKeyword}'
						<% } %>
						
						str += '">▶</a></li></ul></nav>'
					}
					
					return str;
				}
				
				$('#page').append(page());
				
			});
		
		});

	</script>
  </head>
  <body class="d-flex flex-column h-100">
    
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
			<%if(session.getAttribute("loginId") == null){ %>
			&nbsp;<a class="memberMenu"  href="loginForm.me">로그인</a>&nbsp;
			<%} else{%>
			&nbsp;<a class="memberMenu" href="logout.me" data-bs-toggle="modal" data-bs-target="#exampleModal">로그아웃</a>&nbsp;
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
      </div>
    </div>
  </nav>
</header>

<!-- Begin page content -->
<main class="flex-shrink-0">
<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        서울콕에서 로그아웃합니다. 계속하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <a role="button" class="btn btn-primary" href="logout.me">로그아웃</a>
	      </div>
	    </div>
	  </div>
	</div>

  <div class="container">
	<!--
	테스트용 이미지 
	<img src="http://tong.visitkorea.or.kr//cms2//website//20//2504320.jpg">
	<img src="http://tong.visitkorea.or.kr/cms2/website/31/1415931.jpg">
	<img src="http://tong.visitkorea.or.kr/cms2/website/73/2029273.jpg"> 
	-->
	<br><br><br><br>
  </div>
  <div class="container">
    <div class="row">
	  <div class="dropdown col-4">
	    <a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
	      지역별 검색
	    </a>
	
	    <ul id="areaNames" class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	      <li><a class="dropdown-item" href="getTourList.do">전체</a></li>
	    </ul>
	  </div>
	  <form class="auto text-center col-8" action="./getTourListSearch.do">
	    <div class="input-group mb-3 col">
		  <input name="searchKeyword" type="text" class="form-control" placeholder="키워드 검색 ex) 궁, 산, 공원 등" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
		</div>
	  </form>
	</div>
  </div>
  
  <div class="album py-5 bg-light">
    <div class="container">

      <div id="tourList" class="row row-cols-2 row-cols-sm-3 row-cols-md-4 g-4">

      </div>

      <div id="page" class="my-5">
      
      </div>
      
    </div>
  </div>
  
  
</main>

<footer class="footer mt-auto py-3 bg-light">
  <div class="container-fluid text-center">
    <span class="text-muted">ⓒSeoulkok. All rights reserved.</span>
  </div>
</footer>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>

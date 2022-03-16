<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="CSS/header_footer.css" rel="stylesheet">
    <link href="CSS/index.css" rel="stylesheet">
    
    <script src="./jQuery/jquery-3.6.0.js"></script>
	<script type="text/javascript">

		$(function() {
		     $('#box').animate({opacity: 0.7}, 800, function(){
		      	$('#your').animate({opacity: 1}, 800, function(){
		      		$('#seoul').animate({opacity: 1}, 800, function(){
		      			$('#joyful').animate({opacity: 1}, 800, function(){
		      		        $('#seoulKok').animate({opacity: 1}, 800);
		      		    });	
		      		});
		      	});
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
      </div>
    </div>
  </nav>
</header>

<!-- Begin page content -->
<main class="flex-shrink-0">
  <div class="container">
	<!--
	테스트용 이미지 
	<img src="http://tong.visitkorea.or.kr//cms2//website//20//2504320.jpg">
	<img src="http://tong.visitkorea.or.kr/cms2/website/31/1415931.jpg">
	<img src="http://tong.visitkorea.or.kr/cms2/website/73/2029273.jpg"> 
	-->
	
	<div class="container-fluid" id="box">
		
	</div>
	<div class="container-fluid" id="text">
		<div class="row">
			<span class="col fs-2">
				<span id="your">당신의</span>
				<span id="seoul">서울을</span>
				<span id="joyful">즐겁게</span>
			</span>
		</div>
		<div class="row">
			<div id="seoulKok" class="fs-1">서울 콕</div>
		</div>
	</div>
  </div>
</main>

<footer class="footer mt-auto py-3 bg-light">
  <div class="container-fluid row">
    <span class="text-muted col">ⓒSeoulkok. All rights reserved.</span>
    <span class="text-muted col" id="imgCopyright">사진제공(박근형)-한국관광공사</span>
  </div>
</footer>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>

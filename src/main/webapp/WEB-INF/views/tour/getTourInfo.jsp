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
    <link href="CSS/getTourInfo.css" rel="stylesheet">
    <link href="CSS/header_footer.css" rel="stylesheet">
    
    <script src="./jQuery/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=Keys.APP_KEY%>"></script>
	<script type="text/javascript">

	$(function(){
		$.getJSON('http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?'+
				'ServiceKey=<%=Keys.SERVICE_KEY%>'+
				'&contentId='+${param.contentId}+
				'&defaultYN=Y'+
				'&firstImageYN=Y'+
				'&addrinfoYN=Y'+
				'&overviewYN=Y'+
				'&mapinfoYN=Y'+
				'&MobileOS=ETC&MobileApp=AppTest&_type=json', function(data){
					
			$('#img').append('<img width="100%" src="'+data.response.body.items.item.firstimage+'" />');
			$('#title').append('<h1><b>'+data.response.body.items.item.title+'</b></h1>');
			$('#address').append(''+data.response.body.items.item.addr1+'');
			$('#homepage').append(''+data.response.body.items.item.homepage+'');
			$('#overview').append('<p align="justify">'+data.response.body.items.item.overview+'</p>');
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(data.response.body.items.item.mapy, data.response.body.items.item.mapx), // 지도의 중심좌표
		        level: 4 // 지도의 기본 확대 레벨 
		        		 //*(Json에서 가져오는 값이 6으로 고정값이기 때문에 '4'로 입력 
		        		 //1~14까지 입력가능 or 'data.response.body.items.item.mlevel' 로 입력가능 
		    };
		
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
			
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의, TOPRIGHT는 오른쪽 위를 의미
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 줌 컨트롤
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			var markerPosition  = new kakao.maps.LatLng(data.response.body.items.item.mapy, data.response.body.items.item.mapx); 

            // 마커 생성
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커 지도 위에 표시
            marker.setMap(map);
            
         	// 커스텀 오버레이를 생성하고 지도에 표시
    		var customOverlay = new kakao.maps.CustomOverlay({
    			map: map,
    			clickable : true, // 커스텀 오버레이 클릭 시 지도에 이벤트를 전파하지 않도록 설정
    			content: '<div><a id="mapOverray" href="https://map.kakao.com/link/to/'+
        		data.response.body.items.item.title+','+
        		data.response.body.items.item.mapy+','+
        		data.response.body.items.item.mapx+
        		'">카카오맵 길찾기</a></div>', 
    			position: new kakao.maps.LatLng(data.response.body.items.item.mapy, data.response.body.items.item.mapx), // 커스텀 오버레이를 표시할 좌표
    			xAnchor: 0.5, // 컨텐츠의 x 위치
    			yAnchor: -1 // 컨텐츠의 y 위치
    		});
            
            $('#map').append(
            		'<a href="https://map.kakao.com/link/to/'+
            		data.response.body.items.item.title+','+
            		data.response.body.items.item.mapy+','+
            		data.response.body.items.item.mapx+
            		'">카카오 지도 길찾기 바로가기</a>');
			
		});
	});
	
	$(function(){
		$.getJSON('http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?'+
				'ServiceKey=<%=Keys.SERVICE_KEY%>'+
				'&contentId='+${param.contentId}+
				'&contentTypeId=12'+
				'&MobileOS=ETC&MobileApp=AppTest&_type=json', function(data){
			
			$('#chkpet').append(''+data.response.body.items.item.chkpet+'');
			$('#parking').append(''+data.response.body.items.item.parking+'');
			$('#restdate').append(''+data.response.body.items.item.restdate+'');
			$('#usetime').append(''+data.response.body.items.item.usetime+'');
			$('#infocenter').append('<span class="user-select-all">'+data.response.body.items.item.infocenter+'</span>');
			
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
	<br><br><br><br>
  </div>
  <div class="container-fluid">
  	<div class="row justify-content-center">
  		<div class="col-1 d-none d-sm-block">
  		</div>
  		<div class="col-1 d-none d-md-block">
  		</div>
  		<div class="col-1 d-none d-lg-block">
  		</div>
	    <div id="tourInfo" class="col row row-cols-1 justify-content-md-center">
			<div id="img" class="col">
			</div>
			<div id="title" class="col py-3">
			</div>
			<div id="address" class="col py-3">
				<b>주소</b><hr class="my-1">
			</div>
			<div id="homepage" class="col py-3">
				<b>홈페이지</b><hr class="my-1">
			</div>
			<div id="overview" class="col py-3">
				<b>개요</b><hr class="my-1">
			</div>
			<div id="map" class="col py-3" style="width:100%; height:300px;">
			</div>
			<div id="chkpet"  class="col py-3">
				<b>반려동물 동반 가능 여부</b><hr class="my-1">
			</div>
			<div id="parking" class="col py-3">
				<b>주차</b><hr class="my-1">
			</div>
			<div id="restdate" class="col py-3">
				<b>휴무일</b><hr class="my-1">
			</div>
			<div id="usetime" class="col py-3">
				<b>이용시간</b><hr class="my-1">
			</div>
			<div id="infocenter" class="col py-3">
				<b>문의</b><hr class="my-1">
			</div>
	    </div>
	    <div class="col-1 d-none d-lg-block">
  		</div>
  		<div class="col-1 d-none d-md-block">
  		</div>
  		<div class="col-1 d-none d-sm-block">
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

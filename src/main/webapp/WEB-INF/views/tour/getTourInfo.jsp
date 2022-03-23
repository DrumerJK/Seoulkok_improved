<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springcompany.prz.tour.controller.Keys"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
    
	<%@ include file="../../../head_info.jsp" %>
    
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
    
	<%@ include file="../../../header.jsp" %>


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

	<%@ include file="../../../footer.jsp" %>
   
  </body>
</html>

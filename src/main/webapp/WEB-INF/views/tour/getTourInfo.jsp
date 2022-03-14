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
	@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
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
	
 	body{
		font-family: 'Nanum Gothic', sans-serif;
	}  /* 한자를 지원하지 않아 개요정보에 뜨지 않는 경우 있음. 한문 지원 폰트 필요 */

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
	
	#tourInfo{
		width:1000px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	img{
		width: 1000px;
	}
	.infoSubject{
		width: 150px;
		font-size: 1.2em;
		
	}
	
	.infoDetail {
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid rgb(200, 200, 200);
		font-size: 1.2em;
		text-align: justify;
	}

	#tourDetailInfo{
		width: 1000px;
		margin-top: 20px;
		margin-bottom: 20px;
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=Keys.APP_KEY%>">
	</script>	
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
						
				$('#pageTitle').append(
						
						'<h1>'+data.response.body.items.item.title+'</h1>'
						
						);
			
				$('#tourInfo').append(
							
						'<tr>'+
							'<td id="infoImage" align="center" colspan="2"><img src=\''+data.response.body.items.item.firstimage+'\' /></td>'+
						'</tr>'+		
						'<tr>'+
							'<td class="infoSubject" align="left"><b>주소</b></td>'+
							'<td class="infoDetail" align="left">'+data.response.body.items.item.addr1+'</td>'+
						'</tr>'+
						'<tr>'+
							'<td class="infoSubject" align="left"><b>홈페이지</b></td>'+
							'<td class="infoDetail" align="left">'+data.response.body.items.item.homepage+'</td>'+
						'</tr>'+
						'<tr>'+
							'<td class="infoSubject" align="left"><b>개요</b></td>'+
							'<td class="infoDetail" align="left"><p>'+data.response.body.items.item.overview+'</p></td>'+
						'</tr>'+	
						'<tr>'+
							
							'<td colspan="2" align="left">'+
								'<div id="map" style="width:1000px; height:600px;"></div>'+
							'</td>'+
						'</tr>'
						
						);
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(data.response.body.items.item.mapy, data.response.body.items.item.mapx), // 지도의 중심좌표
			        level: 4 // 지도의 기본 확대 레벨 *(Json에서 가져오는 값이 6으로 고정값이기 때문에 '4'로 입력 1~14까지 입력가능 or 'data.response.body.items.item.mlevel' 로 입력가능 
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
				
			});
		});
		
		$(function(){
			$.getJSON('http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?'+
					'ServiceKey=<%=Keys.SERVICE_KEY%>'+
					'&contentId='+${param.contentId}+
					'&contentTypeId=12'+
					'&MobileOS=ETC&MobileApp=AppTest&_type=json', function(data){
			
				$('#tourDetailInfo').append(
					'<tr>'+
						'<td class="infoSubject" align="left"><b>반려동물<br>동반가능 여부</b></td>'+
						'<td class="infoDetail" align="left">'+data.response.body.items.item.chkpet+'</td>'+
					'</tr>'+
					'<tr>'+
						'<td class="infoSubject" align="left"><b>주차</b></td>'+
						'<td class="infoDetail" align="left">'+data.response.body.items.item.parking+'</td>'+
					'</tr>'+
					'<tr>'+
						'<td class="infoSubject" align="left"><b>휴무일</b></td>'+
						'<td class="infoDetail" align="left">'+data.response.body.items.item.restdate+'</td>'+
					'</tr>'+
					'<tr>'+
						'<td class="infoSubject" align="left"><b>이용시간</b></td>'+
						'<td class="infoDetail" align="left">'+data.response.body.items.item.usetime+'</td>'+
					'</tr>'+
					'<tr>'+
						'<td class="infoSubject" align="left"><b>문의</b></td>'+
						'<td class="infoDetail" align="left">'+data.response.body.items.item.infocenter+'</td>'+
					'</tr>'
					
						);
				
			});
		});
		
		
	</script>

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
<div align="center">
	<!-- 관광지 정보 영역 -->
	
		<hr>
			<div id="pageTitle">
		
			</div>
		<hr>
		
		<table id="tourInfo"></table>
		
		

	
		<table id="tourDetailInfo"></table>

		<hr>
		
</div>


	<div>
		<a id="toTop" href="#">▲</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
  
  <%@ include file="head_info.jsp" %>

    <!-- Custom styles for this template -->
    <link href="CSS/index.css" rel="stylesheet">
    <link href="CSS/header_footer.css" rel="stylesheet">
    
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
    
  <%@ include file="header.jsp" %>

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

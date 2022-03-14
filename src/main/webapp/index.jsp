<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	/* Section 영역 CSS*/
	
	img{
		position: fixed;
		top: 85px;
		left: 0;
		width: 100%;
	}
	
	#box{
		position: fixed;
		left: 0;
		top: 33%;
		width:100%;
		height: 270px;
		background:rgb(100, 100, 100);
		opacity: 0.7;
		display: none;
	}
	
	#text{
		color: white;
		font-size: 2.5em;
		font-family: 'Hanna', sans-serif;
		opacity: 1;
	}
	
	#your{
		position: fixed;
		left: 40%;
		top: 42%;
		display: none;
		
	}
	
	#seoul{
		position: fixed;
		left: 47%;
		top: 42%;
		display: none;
		
	}
	
	#joyful{
		position: fixed;
		left: 54%;
		top: 42%;
		display: none;		
	}
	
	#seoulKok{
		position: fixed;
		left: 46%;
		top: 53%;
		font-size: 1.2em;
		display: none;
	}
	
	#imgCopyright{
		position: fixed;
		right: 0;
		bottom: 60px;
		font-size: small;
		background: black;
		color: rgb(230, 230, 230);
	}
	
	
	/* Section 영역 CSS 끝 */
	
	/* Footer 영역 CSS */
	footer{
		position: absolute;
		left:0;
		bottom: 0;
		width:100%;
		height: 60px;
		background: rgb(230, 230, 230); 
		align-items: center;
		justify-content: center;
	}
	
	#copyright{
		position: absolute;
		bottom: 20px;
		left: 25px;
	}
	
	#devsName{
		position: absolute;
		bottom: 20px;
		right:25px;
	}
	/* Footer 영역 CSS 끝*/
	
</style>

<script src="./jQuery/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(function() {
	     $('#box').fadeIn(800, function(){
	      	$('#your').fadeIn(800, function(){
	      		$('#seoul').fadeIn(800, function(){
	      			$('#joyful').fadeIn(800, function(){
	      		        $('#seoulKok').fadeIn(800);
	      		    });	
	      		});
	      	});
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
	
	<section>
		<div>
			<img src="http://tong.visitkorea.or.kr//cms2//website//20//2504320.jpg">
		</div>
		
		<div id="box">
			
		</div>
			<div id="text">
				<span id="your">당신의</span><span id="seoul">서울을</span><span id="joyful">즐겁게</span>
				<div id="seoulKok">
					서울 콕
				</div>
			</div>
		
		<div id="imgCopyright">
			사진제공(박근형)-한국관광공사
		</div>
		
	</section>
	
	<footer>
		<span id="copyright">
			ⓒ서울 콕. Maps API Operated By
			<a id="kakao" href="https://developers.kakao.com/"><b>kakao developers</b></a>
		</span>
		<span id="devsName">
			Developed By Kim Jun Gi / Kim Eui Soo / Kim Yu Jin / Yun So-Yul / Lee Kyung Jin / Namgoong MJ
		</span>
	</footer>
	

</body>
</html>
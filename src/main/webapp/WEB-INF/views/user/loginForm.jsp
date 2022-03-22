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
    <link href="CSS/loginForm.css" rel="stylesheet">
    <link href="CSS/header_footer.css" rel="stylesheet">
    
    <script src="./jQuery/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	
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
<div class="container text-center">

	<main class="form-signin">
	  <div class="container">
		<br><br><br><br>
	  </div>
	  <form action="loginForm.me"  method="post">
	    <h1 class="h3 mb-3 fw-normal">로그인</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name="id" placeholder="ID">
	      <label for="floatingInput">ID</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
	      <label for="floatingPassword">Password</label>
	    </div>
	    <div>
	      <a href="membershipForm.me">회원가입</a>
	    </div>
	
	    <button class="w-100 btn btn-lg btn-primary my-2" id="loginBtn" type="button">로그인</button>
		
		<div id="loginMessage"></div>
		
	    <p class="mt-5 mb-3 text-muted">&copy;Seoulkok. All rights reserved.</p>
	  </form>
	  	<!-- Modal -->
		<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">로그인 실패</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        아이디 또는 비밀번호를 확인해주세요.
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
	  
	</main>	
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    
  </body>
  <script src="./jQuery/jquery-3.6.0.js"></script>
	<script type="text/javascript">
    $('#floatingPassword').keydown(function(key) {
        if(key.keyCode == 13) {
            $('#loginBtn').click();
        }
    });
    
    var loginModal = new bootstrap.Modal(document.getElementById('loginModal'), {
    	  keyboard: true
    })
    
    $(function() {
		$('#loginBtn').click(function() { 
			var id = $('#floatingInput').val(); 
			var password = $('#floatingPassword').val();
			
			$.ajax({ 
				type : "POST", 
				url : 'loginForm.me', 
				data : {id:id, password:password}, 
				success : function(data) { 
					if (data == 'false') { 
						loginModal.show();
					} else { 
						location.href = 'home.me'; 
					} 
				}
			});
		});
	});
    
    </script>
</html>

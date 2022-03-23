<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
    <%@ include file="../../../head_info.jsp" %>

    
    <!-- Custom styles for this template -->
    <link href="CSS/loginForm.css" rel="stylesheet">
    <link href="CSS/header_footer.css" rel="stylesheet">
    
    <script src="./jQuery/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	
	</script>
  </head>
  <body class="d-flex flex-column h-100">
    
  <%@ include file="../../../header.jsp" %>

<!-- Begin page content -->
<div class="container text-center">

	<main class="form-signin">
	  <div class="container">
		<br><br><br><br>
	  </div>
	  <form action="loginForm.me"  method="post">
	    <h1 class="h3 mb-3 fw-normal">로그인</h1>
	
	    <div class="form-floating">
	      <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
	      <label for="floatingInput">Email</label>
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
			var email = $('#floatingInput').val(); 
			var password = $('#floatingPassword').val();
			
			$.ajax({ 
				type : "POST", 
				url : 'loginForm.me', 
				data : {email:email, password:password}, 
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

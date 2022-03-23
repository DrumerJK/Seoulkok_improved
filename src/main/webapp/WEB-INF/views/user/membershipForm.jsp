<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="h-100">
  <head>
    <%@ include file="../../../head_info.jsp" %>

    
    <!-- Custom styles for this template -->
    <link href="CSS/membershipForm.css" rel="stylesheet">
    <link href="CSS/header_footer.css" rel="stylesheet">
    
    <script src="./jQuery/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		
	</script>
  </head>
  <body class="d-flex flex-column h-100">
    
    <%@ include file="../../../header.jsp" %>


<!-- Begin page content -->
	<main>
	  <div class="container">
		<br><br><br><br>
	  </div>
	  <div class="container">
		  <form class="row" action="membershipForm.me" method="post">
		  	  <h1 class="h3 mb-3 fw-normal">회원가입</h1>
		  	  <div class="form-floating mb-3">
  		   	    <input type="email" class="form-control" id="floatingEmail" name="email" placeholder="name@example.com">
			    <label for="floatingInput">E-mail</label>
			  </div>
			  <div class="form-floating col-md-6 mb-3">
			    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
			    <label for="floatingPassword">비밀번호</label>
			  </div>
			  <div class="form-floating col-md-6 mb-3">
			    <input type="password" class="form-control" id="floatingCheckPassword" name="checkPassword" placeholder="Password">
			    <label for="floatingPassword">비밀번호 확인</label>
			  </div>
			  <div class="mb-3 text-muted">
			  	※비밀번호는 4 ~ 12자의 영문 대소문자와 숫자 조합이어야 합니다.
			  </div>
			  <div class="form-floating mb-3">
  		   	    <input type="text" class="form-control" id="floatingNickname" name="nickname" placeholder="name">
			    <label for="floatingInput">닉네임</label>
			  </div>
			  <div class="mb-3 text-muted">
			  	※닉네임은 2 ~ 8자의 한글이어야 합니다.
			  </div>
			  <div class="mb-3">
			  	<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="agree" id="agreeCheck" name="agreeCheck">
				  <label class="form-check-label" for="flexCheckDefault">
		        	<a href="#" data-bs-toggle="modal" data-bs-target="#agreementModal">[필수]개인정보 수집 및 이용 동의</a>
				  </label>
				</div>
		      </div>
			  
			  <div class="col-12">
			    <button type="button" class="btn btn-primary" id="joinBtn">회원가입</button>
			  </div>
		</form>
	  </div>
		
		<!-- Modal -->
		<div class="modal fade" id="agreementModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">개인정보 처리방침</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <%@ include file="serviceAgreement.jsp" %>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="agreeBtn">예, 동의합니다.</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="joinSuccessModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">회원가입 성공</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        환영합니다. 회원가입에 성공하였습니다.
		      </div>
		      <div class="modal-footer">
		        <a role="button" class="btn btn-primary" href="home.me">홈으로 이동</a>
		      </div>
		    </div>
		  </div>
		</div>
	</main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <script src="./jQuery/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		var joinSuccessModal = new bootstrap.Modal(document.getElementById('joinSuccessModal'), {
	  	    keyboard: true
	    })
			
		$('#agreeBtn').click(function(){
			$('#agreeCheck').click();
		});
		
		function formCheck() {
			var email = $('#floatingEmail').val(); 
			var password = $('#floatingPassword').val();
			var checkPassword = $('#floatingCheckPassword').val();
			var nickname = $('#floatingNickname').val();
			var agreeCheck = $('#agreeCheck').is(':checked');
			
			var emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
			var passwordRegex = /^[A-Za-z0-9]{4,12}$/;
			var nicknameRegex = /^[가-힣]{2,8}$/;
			
			if (email == '') {
				alert('이메일을 입력해주십시오');
				$('#floatingEmail').focus();
				return false;
			}
			
			if (password == '') {
				alert('비밀번호를 입력해주십시오');
				$('#floatingPassword').focus();
				return false;
			}
			
			if (checkPassword == '') {
				alert('비밀번호를 한번 더 입력해주십시오');
				$('#floatingCheckPassword').focus();
				return false;
			}
			
			if (nickname == '') {
				alert('닉네임을 입력해주십시오');
				$('#floatingNickname').focus();
				return false;
			}
			
			if (agreeCheck == false) {
				alert('개인정보 수집 및 이용에 동의해주십시오.');
				return false;
			}
			
			if (password != checkPassword) {
				alert('입력하신 비밀번호가 일치하지 않습니다.');
				$('#floatingPassword').focus();
				return false;
			}
			
			if (emailRegex.test(email) == false) {
				alert('이메일 양식에 맞지 않습니다.');
				$('#floatingEmail').focus();
				return false;
			}
			
			if (passwordRegex.test(password) == false) {
				alert('비밀번호는 4 ~ 12자의 영문 대소문자와 숫자 조합이어야 합니다.');
				$('#floatingPassword').focus();
				return false;
			}
			
			if (nicknameRegex.test(nickname) == false) {
				alert('닉네임은 2 ~ 8자의 한글이어야 합니다.');
				$('#floatingNickname').focus();
				return false;
			}
			return true;
		}
		
		$(function() {
			$('#joinBtn').click(function() {
				var email = $('#floatingEmail').val(); 
				var password = $('#floatingPassword').val();
				var nickname = $('#floatingNickname').val();
				
				if (formCheck()) {
					$.ajax({ 
						type : "POST", 
						url : 'membershipForm.me', 
						data : {email:email, password:password, nickname:nickname}, 
						success : function(data) { 
							if (data == 'false') { 
								alert('이미 가입된 이메일입니다.');
								$('#floatingEmail').focus();
							} else { 
								joinSuccessModal.show();
							} 
						}
					});
				}
			});
		});
	</script>
  </body>
</html>

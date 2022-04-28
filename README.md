# 서울콕 개선 프로젝트
본 프로젝트는 팀으로 진행했던 프로젝트를 개인적으로 개선하는 작업을 진행 중인 프로젝트입니다.<br>
팀으로 진행했던 프로젝트 레포지토리를 보시려면 아래의 링크로 이동하시면 됩니다.<br>
서울콕 프로젝트 -> https://github.com/DrumerJK/Seoul_Tour_WebProject

### 프로젝트 목표
  - 서울 시내 관광지 정보를 제공하고 이에 대한 리뷰를 작성 및 확인할 수 있는 서비스를 구현하고자 함.
### 작업기간 : 2022. 03. 14. ~ 작업 중
### 사용기술
  - JDK 1.8
  - Oracle Database 11g Express Edition 11.2.0.2.0
  - Spring Framework 5.2.17.
  - mybatis 3.5.7.
  - Apache Tomcat v9.0
  - jQuery
  - Bootstrap
### 현재(2022. 03. 24.)까지 주요 개선점
1. Bootstrap 적용으로 UI 대폭 개선, 반응형 웹 지원
2. 로그인 및 회원가입 시 Ajax 적용으로 Modal 및 Alert 창 통한 UX 개선
3. CSS 및 Header, Footer 등 중복되는 요소는 별도의 파일로 분기하여 의존성 절감
4. 관광지 정보 페이지에서 지도 상에 카카오맵 길찾기로 연결되는 커스텀 오버레이 적용 

<details><summary>상세 설명(클릭)</summary>
<p>

#### 홈 화면
  
<img width="720" alt="홈" src="https://user-images.githubusercontent.com/92901381/159850607-9eef20e6-2b59-406c-8f91-541697550b8d.png">
<br>
<img width="300" alt="모바일홈" src="https://user-images.githubusercontent.com/92901381/159853806-71c206b2-5b33-47db-ab0a-86487d172587.png">
<img width="300" alt="모바일홈_메뉴" src="https://user-images.githubusercontent.com/92901381/159853876-96b0eef7-c65e-4481-9788-e6de43b265b5.png">


#### 관광지 리스트 화면
  
<img width="720" alt="관광지리스트" src="https://user-images.githubusercontent.com/92901381/159850707-45a23829-6a46-4152-882d-574e4f211e32.png">
  
 <br>
 
<img width="300" alt="모바일관광지리스트" src="https://user-images.githubusercontent.com/92901381/159854225-11189762-1a0a-458e-8438-b7a77adfb022.png">

#### UI
  - 관광지 이미지 썸네일과 이름이 목록 형식으로 보여지던 이전 버전과 달리, 카드 형식으로 보여지는 것이 반응형 웹 컨셉에 더욱 적합하다고 판단하였습니다. 
#### REST API
  - 각 관광지 정보들은 공공데이터포털에서 제공하는 한국관광공사 국문관광정보 API를 활용하였으며, JSON 형식의 데이터를 스크립트 단에서 처리하여 출력하도록 구현하였습니다. 당초 Java의 GSON 라이브러리를 통해 비즈니스 레이어에서 처리한 뒤 출력하는 컨셉으로의 수정을 고려하였으나, 타 서버에서 웹 통신 방식으로 데이터를 받아오는 REST API의 특성상 저희 측 서버에 대한 부담을 최소화하는 것이 맞다고 판단하였습니다.  


#### 관광지 정보 화면
  
https://user-images.githubusercontent.com/92901381/159850851-507ed375-3746-415f-a778-2516c3199c0f.mp4
  
<br>
<img width="300" alt="모바일관광지정보1" src="https://user-images.githubusercontent.com/92901381/159856162-bca9cbe6-45da-45ed-88bf-ff4c494b1542.png">
<img width="300" alt="모바일관광지정보2" src="https://user-images.githubusercontent.com/92901381/159856169-6d25e851-c597-46de-871e-a688adc03aaa.png">
<img width="300" alt="모바일관광지정보3" src="https://user-images.githubusercontent.com/92901381/159856174-e2cbe741-6cee-4c3b-b781-43cf470796c4.png">

#### UI
  - 이전 버전과 비교하여 레이아웃 상의 큰 차이는 없으나, 브라우저 창의 크기에 따라 컨텐츠의 크기가 너무 크게 보이거나 너무 작게 보이는 상황을 방지하기 위해 화면 크기에 따라 좌우 여백이 다르게 보여지도록 처리하였습니다.
#### KAKAO MAPS API
  - 이전 버전에서는 관광지의 위치 정보를 지도 위에 마커를 표시하는데 그쳤지만, KAKAO MAPS API에서 제공하는 커스텀 오버레이 기능을 이용하여 '카카오맵 길찾기'라는 버튼을 눌렀을 때 즉시 해당 관광지까지 길찾기 기능을 제공하는 카카오맵 링크로 연결되도록 처리하였습니다. 모바일 환경에서는 카카오맵 어플이 설치되어 있을 경우 어플로 이동할 수 있습니다.

아래는 커스텀 오버레이를 위해 추가된 코드입니다.
```
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
  
```

#### 로그인 화면
  
<img width="720" alt="로그인" src="https://user-images.githubusercontent.com/92901381/159851090-9ab0c6a5-f11d-4f5b-9d4e-f28f729fd550.png">

#### 로그인 실패 시 Modal 창 구현
  
<img width="720" alt="로그인_모달" src="https://user-images.githubusercontent.com/92901381/159851125-14e36d2a-66ed-4fd2-999f-cb45a7a07c64.png">

#### 로그아웃 시 Modal 창 구현
  
<img width="720" alt="로그아웃_모달" src="https://user-images.githubusercontent.com/92901381/159851181-dd55e174-d677-458e-a33d-8adddfe8cf40.png">
 <br>
 
<img width="300" alt="모바일로그인" src="https://user-images.githubusercontent.com/92901381/159854127-e3072e2e-4171-4950-be51-49b133b1c472.png">
<img width="300" alt="모바일홈_로그아웃" src="https://user-images.githubusercontent.com/92901381/159854142-0d04e803-1a95-40dc-9ade-2bb1f202d2c5.png">


#### 회원가입 시연

https://user-images.githubusercontent.com/92901381/159851231-bb66a543-dd4c-40e7-8359-e0d98b9934a5.mp4

<br>
  
<img width="300" alt="모바일회원가입" src="https://user-images.githubusercontent.com/92901381/159856242-d6859577-4d50-4eed-8942-98fdd34f2c33.png">
<img width="300" alt="모바일회원가입_알림창" src="https://user-images.githubusercontent.com/92901381/159856244-2a3bb7fa-3713-420d-ba71-b196753745da.png">
 
#### AJAX
  - 이전 버전에서는 로그인 및 회원가입 기능에 양식을 강제하는 기능이나 아이디의 중복 여부를 확인하고 알림창을 띄우는 기능이 없었습니다. 서버에 접근해 필요한 데이터만을 비동기적으로 불러오는 AJAX 방식으로 처리하여 가입할 이메일의 중복여부를 Alert 창으로 확인할 수 있도록 하였습니다. 로그인 화면에서 입력된 이메일이 DB에 있는지, 비밀번호는 매칭되는지 확인하고 로그인 실패 시 Modal 창을 띄워주는 동작 또한 마찬가지입니다. 나머지 이메일, 비밀번호, 닉네임의 양식에 대해서는 정규표현식을 통해 검증하도록 하고 Alert창을 띄우도록 하였습니다.
  
아래는 회원가입 절차를 기존 코드에서 Ajax를 적용하고 어떻게 수정하였는지 보여주고 있습니다.
- 기존코드 : 단순히 submit 버튼으로 양식이 제출됐을 때 ID 중복검사를 하고, ID 중복 시 회원가입 양식을 다시 로드하고 있습니다.
  ```
  @RequestMapping(value = "/membershipForm.me", method = RequestMethod.POST)
	public String insertUser(userVO vo, HttpServletRequest request) {
			
			if(userService.checkIdService(request.getParameter("id")) 
				&& request.getParameter("password").equals(request.getParameter("checkPassword"))) {
				userService.insertUserService(vo);
				return "user/loginForm";
			} else {
				return "user/membershipForm";
			}
			
	}
  
  ```
  
- 개선된 코드 : 회원가입 양식을 체크하는 formCheck() 함수를 따로 정의하고, true가 return 될 때 ajax를 통해 POST방식으로 요청하고 응답 메시지에 따라 이메일을 다시 입력하도록 하거나 회원가입 성공을 알리는 Modal 창을 띄우도록 처리하였습니다.

```
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

```
  
```
	@RequestMapping(value = "/membershipForm.me", method = RequestMethod.POST)
	public void insertUser(@RequestParam("email") String email, 
							@RequestParam("password") String pw, 
							@RequestParam("nickname") String nickname,
							HttpServletRequest request, HttpServletResponse response) throws IOException {

		UserVO vo = new UserVO();
		vo.setEmail(email);
		vo.setPassword(pw);
		vo.setNickname(nickname);
		
		if (userService.checkEmailService(request.getParameter("email"))) {
			// 이메일 사용가능
			userService.insertUserService(vo);
			response.getWriter().print(true);
		} else {
			// 이메일 중복
			response.getWriter().print(false);
		}

	}
  
```  
  
</p>
</details>


### 추후 개선 계획

#### 1. 리뷰기능 대폭 개편
  - 이전 버전에서는 리뷰게시판이 실제 이 웹에서 제공하고 있는 관광지 정보들과 호환성이 없고, 게시물 확인 및 편집 측면에서도 불편합니다. 아예 리뷰를 댓글 형식으로 개편하고 각 관광지 정보를 나타내는 페이지 하단에 해당 관광지에 대한 리뷰 댓글을 작성하고 확인할 수 있도록 처리하는 편이 더 쾌적한 사용자 경험일 것이라 판단하여, 리뷰 댓글을 위한 DB 및 관련 로직 수정 계획입니다.
#### 2.  O Auth 적용
  - 매번 회원가입 폼을 작성하고 아이디와 비밀번호를 입력하여 로그인하는 것보다 O Auth 인증 절차를 통한 로그인이 사용자 입장에서 더 편리하다는 것은 이미 당연한 트렌드가 되었습니다. 이번 버전에서는 ID가 아닌 이메일 로그인 방식으로 변경하고, 입력할 사용자 정보 또한 최소화하였는데, 이 또한 O Auth를 조금 더 안정적으로 적용할 수 있도록 하기 위함입니다.

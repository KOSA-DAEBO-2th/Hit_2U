<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

<link href="${pageContext.request.contextPath }/resources/css/reset.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 부트스트랩 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Jquery -->
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/login.css?after"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/util.css"
	rel="stylesheet">

</head>

<body>
	<div class="login_main">

		<div class="login_form">
			<div class="logo">
				<a href="/"><img
					src="${pageContext.request.contextPath}/resources/images/rec_logo.png"
					height="150px" /></a>
			</div>
			<div class="font_bold font_28 margin_top_12">HIT에 오신것을 환영합니다.</div>
			<div class="margin_top_8 font_gray">커뮤니티. HIT!</div>
			<div class="line">
				<hr>
				<div class="font_16 line_text">HIT 아이디로 로그인</div>
				<hr>
			</div>
			<form id="login_input" method="post" action="/login">
				<div class="font_16 text_left">아이디</div>
				<input class="form-control" type="text" name="member_id">

				<div class="font_16 text_left password">비밀번호</div>
				<input class="form-control" type="password" name="password">

				<div class="font_16 text_right font_blue margin_top_20">
					<a href="#">계정찾기</a>
				</div>
				<button class="btn btn-primary btn-pulse btn-blue login_button"
					type="submit">로그인</button>
			</form>
			<div id="naverIdLogin" style="display: none;"></div>
			<button class="btn btn-primary btn-pulse btn-blue login_button"
				type="button" style="background-color: #54BD54" onclick="showLoginPopup();">네이버ID로 로그인
			</button>
			<script>

    // 네이버 로그인을 위한 팝업창 생성
    function showLoginPopup(){
        let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
            'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
            '&client_id=M2kIBHJWwsAGlcttIoT8' +     // 발급받은 client_id 를 입력
            '&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
            '&redirect_uri=http://localhost:8080/login/oauth2/code/naver';   // 어플케이션에서 등록했던 CallBack URL를 입력

        // 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
        window.open(uri, "Naver Login Test PopupScreen", "width=450, height=600");
    }

</script>
			<div>
				아직 회원이 아니신가요? <a href="#" onclick="location.href='signup'">회원가입</a>
			</div>
		</div>


	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<script src="https://www.google.com/recaptcha/api.js" async defer></script>

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
				<div class="font_16 line_text">회원가입에 필요한 정보를 입력해주세요</div>
				<hr>
			</div>
			<form id="login_input" method="post"
				action="signok">
				<div class="font_16 text_left">아이디</div>
				<input class="form-control" type="text" name="member_id" autocomplete="username"
					placeholder="4~15자 이내로 입력해주세요">

				<div class="font_16 text_left margin_top_20">비밀번호</div>
				<input class="form-control" type="password" name="password"
					autocomplete="new-password" placeholder="최소 6자 이상">

				<div class="font_16 text_left margin_top_20">비밀번호 확인</div>
				<input class="form-control" type="password" name="password_verify"
					autocomplete="off" placeholder="비밀번호 확인">

				<div class="font_16 text_left margin_top_20">이메일</div>
				<input class="form-control" type="email" name="email"
					placeholder="example@hit.com">

				<div class="font_16 text_left margin_top_20">닉네임</div>
				<input class="form-control" type="text" name="nickname"
					placeholder="2~8자 이내로 입력해주세요">


 				<div class="g-recaptcha margin_top_20"
					data-sitekey="6Lda2a0nAAAAAAfoQIS8lZDKG6gQ6IntD453FAQB"
					data-callback="onSubmit"></div>

				<button id="signup_button"
					class="btn btn-primary login_button btn-blue" type="submit"
					>회원가입</button>

			</form> 
		</div>


	</div>

 	<script type="text/javascript">
		function onSubmit() {
			$("#signup_button").attr("disabled", false);
		}
	
				</script>



</body>
</html>
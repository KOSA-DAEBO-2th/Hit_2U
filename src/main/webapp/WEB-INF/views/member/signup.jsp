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

<script src="${pageContext.request.contextPath }/resources/js/join.js"
	defer="defer"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
			<form id="login_input" method="post" onsubmit="return joinChk();"
				name="join" action="signok">
				<div class="font_16 text_left">아이디</div>
				<input class="form-control" type="text" name="member_id"
					autocomplete="username" id="member_id"
					placeholder="4~15자 이내로 입력해주세요" style="margin-bottom: 10px">
				<div>
					<span id="result_checkId" style="font-size: 12px;"></span>
				</div>
				<button class="btn btn-primary btn-blue" type="button" id="checkId"
					style="display: block; margin: auto;">중복 검사</button>

				<div class="font_16 text_left margin_top_20" style="margin-top: 0px;">비밀번호</div>
				<input class="form-control" type="password" name="password"
					autocomplete="new-password" placeholder="최소 6자 이상">

				<div class="font_16 text_left margin_top_20">비밀번호 확인</div>
				<input class="form-control" type="password" name="password_verify"
					autocomplete="off" placeholder="비밀번호 확인">

				<div class="font_16 text_left margin_top_20">닉네임</div>
				<input class="form-control" type="text" name="nickname"
					id="nicknameInput" placeholder="2~8자 이내로 입력해주세요">

				<div class="font_16 text_left margin_top_20">연락처</div>
				<input class="form-control" type="text" name="contact"
					placeholder="010-1234-5678">

				<div class="font_16 text_left margin_top_20">깃허브 주소</div>
				<input class="form-control" type="text" name="git_link"
					placeholder="선택사항">

				<div class="font_16 text_left margin_top_20">백준 주소</div>
				<input class="form-control" type="text" name="baekjoon"
					placeholder="선택사항">

				<div class="font_16 text_left margin_top_20">이메일</div>
				<input class="form-control emailInput" type="email" name="email"
					placeholder="example@hit.com" style="width: 60%;">
				<!-- <input class="btn-primary btn" type="button" value="인증코드 전송"> -->
				<input type="text" class="form-control" id="codeInput"
					disabled="disabled" style="margin-bottom: 10px">
				<button class="btn btn-primary btn-blue" type="button"
					onclick="sendCode()" id="sCode"
					style="width: 100px; display: block; margin: auto;">인증코드
					발송</button>
				<button class="btn btn-primary btn-blue" type="button"
					onclick="checkCode()" id="confirmCode"
					style="width: 100px; display: none; margin: auto;">인증코드 확인</button>


				<div class="g-recaptcha margin_top_20"
					data-sitekey="6Lda2a0nAAAAAAfoQIS8lZDKG6gQ6IntD453FAQB"
					data-callback="onSubmit"></div>

				<button id="signup_button"
					class="btn btn-primary login_button btn-blue" type="submit">회원가입</button>

			</form>
		</div>


	</div>

	<script type="text/javascript">
		$("#checkId").click(
				function() {
					var member_id = $("#member_id").val();
					console.log(member_id);
					$.ajax({
						type : "post", //post 형식으로 controller 에 보내기위함!!
						url : "/member/checkId", // 컨트롤러로 가는 mapping 입력
						dataType : "json",
						data : {
							"member_id" : member_id
						}, // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
						success : function(data) {
							if (data == "0") { // 만약 성공할시
								result = "사용 가능한 아이디입니다.";
								$("#result_checkId").html(result).css("color",
										"green");
								$("#password").trigger("focus");
								$("#member_id").attr("readonly",true);

							} else { // 만약 실패할시
								result = "이미 사용중인 아이디입니다.";
								$("#result_checkId").html(result).css("color",
										"red");
								$("#member_id").val("").trigger("focus");
							}

						},
						error : function(error) {
							alert('왜안됨');
						}
					});

				});

		function onSubmit() {
			$("#signup_button").attr("disabled", false);
		}

		function sendCode() {
			var email = $(".emailInput").val();
			console.log(email);
			var data = {
				"email" : email
			}

			document.getElementById("sCode").style.display = "none";
			document.getElementById("confirmCode").style.display = "block";

			$.ajax({
				type : "POST",
				url : "confirm",
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(data) {
					console.log("success");
					console.log(data);

					$("#confirmCode").val(data);
					$('#codeInput').attr('disabled', false);
					$('#codeInput').focus();

				}
			});
		}

		function checkCode() {
			var code = $('#codeInput').val();
			console.log(code);
			var send = $("#confirmCode").val();

			if (send == code) {
				//alert("확인되었습니다.");
				Swal.fire({
					position : 'top-end',
					icon : 'success',
					title : '확인되었습니다',
					showConfirmButton : false,
					timer : 1000
				});
				$('#codeInput').attr('readonly', true);
			} else {
				//alert("다시 확인해주세요");
				Swal.fire({
					icon : 'error',
					title : '다시 확인해주세요',
					text : '인증코드가 일치하지 않습니다',
					footer : '<a href="">Why do I have this issue?</a>'
				})
				$('#codeInput').val("");
				$('#codeInput').focus();
			}
		}
	</script>



</body>
</html>
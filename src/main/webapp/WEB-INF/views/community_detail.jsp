<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<c:import url="includes/header.jsp"></c:import>
<link
	href="${pageContext.request.contextPath }/resources/css/main.css?after"
	rel="stylesheet">
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath }/resources/css/community.css?after" --%>
<!-- 	rel="stylesheet"> -->

<!-- <link -->
<%-- 	href="${pageContext.request.contextPath }/resources/css/community_write.css" --%>
<!-- 	rel="stylesheet" /> -->

<link
	href="${pageContext.request.contextPath }/resources/css/community_detail.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/util.js"
	type="text/javascript" defer></script>

<script async
	src="${pageContext.request.contextPath}/resources/js/community.js"
	type="text/javascript" defer></script>

<script
	src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"
	type="text/javascript"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"
	type="text/javascript"></script>

<link
	href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css"
	rel="stylesheet">
</head>
<body>
	<main class='main_content_sm'>
		<div class="content_label font_32">
			<a>community_detail</a>
		</div>
		<div>
			<div>
				<h5>
					<a href="/community">커뮤니티</a> / <a href="">사는 얘기</a>
				</h5>
			</div>
		</div>
		<div class="detail_form">
			<div>
				<div class="box">
					<img class="profile" alt=""
						src="/resources/images/profile_logo.png">
				</div>
				<div class="nickname_area">
					<a href="/community/profile" class="nickname">윤성호빵맨</a> <span
						class="mc">.</span> <i class="fa-solid fa-flask"></i> <span
						class="hp_point">33</span> <span class="mc">.</span><span>약
						2 시간 전</span><span class="mc">.</span> <i
						class="fa-regular fa-eye font_12 icon_area"></i><span>510</span>
				</div>
			</div>
			<div>
				<h1>사람들 키보드 소리가 너무 시끄러운데 제가 예민한건가요?</h1>
			</div>
			<div>
				<p>영어 발음이야 하나만 옳다고 하기도 그렇고 의사만 전달되면 크게 중요한건 아니니 그냥 가벼운 고민정도로
					들어주시면 감사하겠습니다. 제 사수는 width는 와이드로, border는 볼더로 발음하는데 저는 width는 윋에 끝에
					th 발음 조금 주고 border는 보더라고 발음하는데 같이 얘기할 때 한 단어를 말해도 서로 다른 발음으로 얘기하는
					경우가 잦더라고요. 이게 혹시라도 사수 눈에는 제가 고집부리고 뻗대는걸로 비춰질까싶어서 제가 사수 발음에 그냥 맞춰주는게
					맞는건지 고민이 되네요.</p>
			</div>
			<div>
				<h5 id="notes-title">16 개의 댓글</h5>
			</div>
			<div>
				<section>
					<div>
						<div class="box">
							<img class="profile" alt=""
								src="/resources/images/profile_logo.png">
						</div>
						<div class="reply-container">
							<textarea rows="" cols="" placeholder="댓글을 작성하세요."></textarea>
						</div>
						<div class="reply-button">
							<button type="button">댓글 쓰기</button>
						</div>
					</div>
				</section>
			</div>
			<div>
				<ul>
					<li>
						<div class="box">
							<a href="/community/profile"> <img class="profile" alt=""
								src="/resources/images/profile_logo.png"></a> <a
								href="/community/profile"> </a>
						</div>
						<div>2</div>
						<div>3</div>
					</li>
				</ul>
			</div>
		</div>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
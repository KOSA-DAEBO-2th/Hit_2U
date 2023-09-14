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

<script type="text/javascript">
	function board_update() {
		//alert("수정");
		location.href = "community_update_form?b_no=${dto.b_no}";
	}
	
	function board_delete() {
		//alert("삭제");
		location.href = "deleteform?b_no=${dto.b_no}";
	}
	function board_reply() {
		//alert("답변");
		location.href = "replyform?b_no=${dto.b_no}";
	}
</script>

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
					<div>${dto.b_no}</div>
					<a href="/community/profile" class="nickname">윤성호빵맨</a> <span
						class="mc">.</span> <i class="fa-solid fa-flask"></i> <span
						class="hp_point">33</span> <span class="mc">.</span><span>약
						2 시간 전</span><span class="mc">.</span> <i
						class="fa-regular fa-eye font_12 icon_area"></i><span>510</span>
				</div>
			</div>
			<div>
				<h1>${dto.b_title}</h1>
				<div>
					<input type="button" value="수정" onclick="board_update()" /> <input
						type="button" value="삭제" onclick="board_delete()" />
				</div>
			</div>
			<div>
				<p>${dto.b_content}</p>
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
							<input type="button" value="답변" onclick="board_reply()" />

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
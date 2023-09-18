<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<c:import url="includes/header.jsp"></c:import>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<link
	href="${pageContext.request.contextPath }/resources/css/main.css?after"
	rel="stylesheet">

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
		// 		alert("삭제");
		// 		location.href = "/community_delete/${dto.b_no}";

		if (confirm("정말 삭제하시겠습니까?") == true) {
			location.href = "/community_delete/${dto.b_no}";
		} else {
			return false;
		}
	}
	function board_reply() {
		//alert("답변");

		var r_content = document.getElementById('r_content').value;

		if (r_content == '') {
			alert("댓글에 내용을 입력해주세요.");
			return false;
		}

		location.href = "/community/community_detail?b_no=${dto.b_no}";
	}

	$(document)
			.ready(
					function() {
						$("form")
								.on(
										'submit',
										function(event) {
											event.preventDefault();

											var formData = $(this).serialize();

											$
													.ajax({
														url : "${pageContext.request.contextPath}/community/${dto.b_no}/replies",
														type : "POST",
														data : formData,
														success : function(data) {
															var div = $("<div>")
																	.append(
																			"<span>"
																					+ data.nickname
																					+ "</span> <p>"
																					+ data.r_content
																					+ "</p>");
															$("#comments")
																	.prepend(
																			div);
														},
														error : function() {
															alert("Error adding comment");
														}
													});
										});
					});
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
					<a href="/profile" class="nickname">윤성호빵맨</a> <span class="mc">.</span>
					<i class="fa-solid fa-flask"></i> <span class="hp_point">33</span>
					<span class="mc">.</span><span>약 2 시간 전</span><span class="mc">.</span>
					<i class="fa-regular fa-eye font_12 icon_area"></i><span>${dto.b_view}</span>
				</div>
			</div>
			<div>
				<div class="update_delete_container">
					<%-- <form action="/community_delete" method="post" name="form">
						<input type="hidden" name="b_no" id="b_no" value="${dto.b_no}"> --%>
					<input class="btn btn-primary btn-ghost btn-open" type="button" value="수정" onclick="board_update()" />
					 <input class="btn btn-primary btn-jelly btn-blue" type="button" value="삭제" onclick="board_delete()" />
					<!-- </form> -->
				</div>
				<h1>${dto.b_title}</h1>

			</div>
			<div>
				<p>${dto.b_content}</p>
			</div>
			<div>
				<h5 id="notes-title">16 개의 댓글</h5>
			</div>


			<h2>Comments</h2>

			<h3>Add a Comment</h3>

			<form
				action="${pageContext.request.contextPath}/community/community_detail?b_no=${dto.b_no}&pg=${pg}"
				method="post">
				<label for="r_content">Comment:</label><br />
				<textarea id="r_content" name="r_content"></textarea>
				<br /> <input type="hidden" name="nickname" value="Test User">

				<!-- Submit button -->
				<div class="submit_btn_container">
					<button class="btn btn-primary btn-jelly btn-blue" type="submit" onclick="board_reply()">댓글
						등록</button>
				</div>
			</form>
			<div class="border_line"></div>

			<div id="comments">
				<c:forEach var="reply" items="${replies}">
					<div class="reply_list">
						<div>
							<span>${reply.nickname}</span>
							<p>${reply.r_content}</p>
						</div>
						<div>
							<button class="btn btn-primary btn-jelly btn-blue">삭제</button>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
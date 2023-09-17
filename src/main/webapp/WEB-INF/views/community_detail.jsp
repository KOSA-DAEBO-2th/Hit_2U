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
					<a href="/profile" class="nickname">윤성호빵맨</a> <span class="mc">.</span>
					<i class="fa-solid fa-flask"></i> <span class="hp_point">33</span>
					<span class="mc">.</span><span>약 2 시간 전</span><span class="mc">.</span>
					<i class="fa-regular fa-eye font_12 icon_area"></i><span>${dto.b_view}</span>
				</div>
			</div>
			<div>
				<h1>${dto.b_title}</h1>
				<div>
					<%-- <form action="/community_delete" method="post" name="form">
						<input type="hidden" name="b_no" id="b_no" value="${dto.b_no}"> --%>
					<input type="button" value="수정" onclick="board_update()" /> <input
						type="button" value="삭제" onclick="board_delete()" />
					<!-- </form> -->
				</div>

			</div>
			<div>
				<p>${dto.b_content}</p>
			</div>
			<div>
				<h5 id="notes-title">16 개의 댓글</h5>
			</div>


			<!-- =====================================	뤼튼		===================================== -->


			<h2>Comments</h2>

<%-- 			<c:forEach items="${reply}" var="reply"> --%>
<!-- 				<div class="comment"> -->
<!-- 					<p> -->
<%-- 						<strong>${reply.nickname}</strong> --%>
<!-- 					</p> -->
<%-- 					<p>${reply.r_content}</p> --%>
<!-- 					<p> -->
<%-- 						<small>${reply.reply_date}</small> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>

			<h3>Add a Comment</h3>

			<form
				action="${pageContext.request.contextPath}/community/${board_no}/replies"
				method="post">
				<input type="hidden" name="_method" value="post" />

				<!-- Input fields for nickname and comment -->
				<label for="nickname">Nickname:</label><br /> <input type="text"
					id="nickname" name="nickname"><br /> <label for="r_content">Comment:</label><br />
				<textarea id="r_content" name="r_content"></textarea>
				<br />

				<!-- Submit button -->
				<button type="submit">Submit Comment</button>

			</form>


			<!-- =====================================		뤼튼			===================================== -->














			<!-- =====================================	임시적으로 주석처리하였음 (여기서 아래로)		===================================== -->


			<!-- 			<div> -->
			<!-- 				<section> -->
			<!-- 					<div> -->
			<!-- 						<div class="box"> -->
			<!-- 							<img class="profile" alt="" -->
			<!-- 								src="/resources/images/profile_logo.png"> -->
			<!-- 						</div> -->
			<!-- 						<div class="reply-container"> -->
			<!-- 							<textarea rows="" cols="" placeholder="댓글을 작성하세요."></textarea> -->
			<!-- 						</div> -->
			<!-- 						<div class="reply-button"> -->
			<!-- 							<button type="button">댓글 쓰기</button> -->
			<!-- 							<input type="button" value="답변" onclick="board_reply()" /> -->

			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</section> -->
			<!-- 			</div> -->
			<!-- 			<div> -->
			<!-- 				<ul> -->
			<!-- 					<li> -->
			<!-- 						<div class="box"> -->
			<!-- 							<a href="/community/profile"> <img class="profile" alt="" -->
			<!-- 								src="/resources/images/profile_logo.png"></a> <a -->
			<!-- 								href="/community/profile"> </a> -->
			<!-- 						</div> -->
			<!-- 						<div>2</div> -->
			<!-- 						<div>3</div> -->
			<!-- 					</li> -->
			<!-- 				</ul> -->
			<!-- 			</div> -->


			<!-- =====================================	임시적으로 주석처리하였음 (여기서 위로)		===================================== -->

		</div>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
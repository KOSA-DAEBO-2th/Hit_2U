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

<link
	href="${pageContext.request.contextPath }/resources/css/community_write_form.css"
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
			<a>커뮤니티</a>
		</div>

		<form name="writeform" method="post"
			action="/community/community_write">
			<div>
				<div>
					<!-- 				밑에는 임시적으로 주석처리하였음 추후에 주석을 풀어야됨 -->
										<div class="topic">
											<label>토픽</label> <select>
												<option>토픽을 선택해주세요.</option>
												<option>자유</option>
												<option>고민</option>
												<option>운동</option>
												<option>익명</option>
											</select>
										</div>
					<div class="title">
						<label>제목</label> <input type="text" id="b_title" name="b_title"
							placeholder="제목을 입력해주세요.">
					</div>
					
									
										<div class="tagtag">
											<label>태그 - <span>내용을 대표하는 태그 3개 정도 입력해주세요.</span>
											</label> <input class="tag1-input" placeholder="태그를 입력해주세요."></input>

										</div>
					<div class="textarea">
						<label>본문</label>
						<textarea id="b_content" name="b_content"
							placeholder="내용을 입력해주세요."></textarea>
					</div>
				</div>
				<div class="button-container">
					<button>취소</button>
					<button type="submit">등록</button>
				</div>
			</div>
		</form>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
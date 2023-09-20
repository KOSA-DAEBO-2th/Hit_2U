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
			<a>커뮤니티 (수정)</a>
		</div>

		<form name="writeform" method="post" action="/qna_update"
			onsubmit="return board_write()">
			<div>
				<div>

					<!-- 				밑에는 임시적으로 주석처리하였음 추후에 주석을 풀어야됨 -->
					<div class="topic">
						<label><div class="write_tab">토픽 *</div></label>

						<div class="input_section select">
							<select class="form-select" name="topic">
								<option value="">토픽을 선택해주세요.</option>
								<option value="11">커리어</option>
								<option value="12">기술</option>
								<option value="13">알고리즘</option>
								<option value="14">기타</option>
							</select>
						</div>
					</div>
					<div class="title">
						<label><div class="write_tab">제목 *</div></label> <input
							type="hidden" name="b_no" value="${dto.b_no}" /> <input
							class="form-control" type="text" id="b_title" name="b_title"
							value="${dto.b_title}">
					</div>
					<div class="tagtag">
						<label><div class="write_tab">태그 *</div>
							<div class="sub_explain font_14 font_lightgray">내용을 대표하는 태그
								3개 정도 입력해주세요.</div> <!-- 						<span>내용을 대표하는 태그 3개 정도 입력해주세요.</span> -->
						</label> <input class="form-control" placeholder="태그를 입력해주세요."></input>

					</div>
					<div class="textarea">
						<label><div class="write_tab">본문 *</div></label>

						<div class="input_section text">
							<textarea id="summernote" name="b_content">${dto.b_content}</textarea>
						</div>

						<!-- 						<textarea id="b_content" name="b_content" -->
						<%-- 							placeholder="내용을 입력해주세요.">${dto.b_content}</textarea> --%>
					</div>
				</div>
				<div class="button-container">
					<!-- 					<button>취소</button> -->
					<!-- 					<button type="submit" onclick="board_write()">수정 등록</button> -->

					<button class="btn btn-primary btn_main">취소</button>
					<button type="submit" class="btn btn-primary btn_main"
						onclick="board_write()">수정 등록</button>


				</div>
			</div>
		</form>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
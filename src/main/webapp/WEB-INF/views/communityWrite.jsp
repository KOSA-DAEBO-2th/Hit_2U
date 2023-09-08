<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<c:import url="header.jsp"></c:import>
<link
	href="${pageContext.request.contextPath }/resources/css/main.css?after"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/community.css?after"
	rel="stylesheet">



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
		<div class="content_categoty flex content_center padding_bottom_20">
			<button class="btn btn_category btn_category_click">전체</button>
			<button class="btn btn_category">자유</button>
			<button class="btn btn_category">고민</button>
			<button class="btn btn_category">운동</button>
			<button class="btn btn_category btn_anonymous">익명</button>
		</div>
		<div class="flex content_center">
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name="" placeholder="전체에서 검색">
				<a class="search-btn" href="#"> <i class="fas fa-search"></i>
				</a>
			</div>
		</div>

		여기 밑에다 적으면 될듯



		<form method="post">
			<div>
				<div>
					<div>
						<label>토픽~</label> <select>
							<option>선택</option>
							<option>자유</option>
							<option>고민</option>
							<option>운동</option>
							<option>익명</option>
						</select>
					</div>
					<div>
						<label>제목</label> <input type="text" id="title" name="title"
							placeholder="제목을 입력해주세요.">
					</div>
					<div>
						<label>태그 - <span>내용을 대표하는 태그 3개 정도 입력해주세요.</span>
						</label>

						<div>
							<div>
								<div>
									<input placeholder="태그를 입력해주세요."></input>
								</div>
							</div>
						</div>
					</div>
					<div>
						<label>본문</label>
						<textarea id="summernote" name="editordata"></textarea>
					</div>
				</div>
				<div>
					<button>취소</button>
					<button type="button">등록</input>
				</div>
			</div>
		</form>


	</main>
	<c:import url="footer.jsp"></c:import>
</body>


</html>
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
</head>
<body>


	<main class='main_content_sm'>
		<div class="community_page_head font_32">
			<a>커뮤니티</a>
		</div>
		<div class="community_categoty flex content_center padding_bottom_20">
			<button class="btn btn_category btn_category_click">전체</button>
			<button class="btn btn_category">자유</button>
			<button class="btn btn_category">고민</button>
			<button class="btn btn_category">운동</button>
			<button class="btn btn_category btn_anonymous">익명</button>
		</div>
		<div class="flex item_center">
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name=""
					placeholder="전체에서 검색"> <a class="search-btn"
					href="#"> <i class="fas fa-search"></i>
				</a>
			</div>
		</div>
	</main>
	<c:import url="footer.jsp"></c:import>
</body>


</html>
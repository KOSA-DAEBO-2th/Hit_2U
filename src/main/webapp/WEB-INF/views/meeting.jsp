<%@ include file="includes/header.jsp" %>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/resources/css/header.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/meeting.css"
	rel="stylesheet" />
<script async
	src="${pageContext.request.contextPath}/resources/js/util.js"
	type="text/javascript" defer></script>

<script async
	src="${pageContext.request.contextPath}/resources/js/community.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class="main_content_sm">
		<div class="content_label font_32">
			<a>모임</a>
		</div>
		<div class="content_category flex content_center padding_bottom_20">
			<button class="btn btn_category btn_category_click">전체</button>
			<button class="btn btn_category">프로젝트</button>
			<button class="btn btn_category">스터디</button>
		</div>
		<div class="flex content_center">
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name="" placeholder="전체에서 검색" />
				<a class="search-btn" href="#"> <i class="fas fa-search"></i>
				</a>
			</div>
		</div>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>

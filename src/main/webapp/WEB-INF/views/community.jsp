<%@ include file="includes/header.jsp"%>
<html>
<head>
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath }/resources/css/header.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/community.css"
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
			<a>커뮤니티</a>
		</div>
		<div class="content_category flex content_center padding_bottom_20">
			<button class="btn btn_category btn_category_click">전체</button>
			<button class="btn btn_category">자유</button>
			<button class="btn btn_category">고민</button>
			<button class="btn btn_category">운동</button>
			<button class="btn btn_category btn_anonymous">익명</button>
		</div>
		<div class="flex content_center">
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name="" placeholder="전체에서 검색" />
				<a class="search-btn" href="#"> <i class="fas fa-search"></i>
				</a>
			</div>
		</div>

		<button class="btn btn_write">
			<a href="/community/community_write">작성하기</a>
		</button>
		<article>
			<div class="board_list">
				<!-- 				<div class="topic"> -->
				<!-- 					<a href="#">자유</a> -->
				<!-- 				</div> -->
				<br>
				<div style="width: 100%;">
					<div class="main_user">
						<div style="flex: 1;">
							<c:forEach var="list" items="${list}">
								<div class="board_list">
									<div class="board_list_inside">
										<div class="flex item_center">
											<div class="nickname_area">
												<a href="/community/profile" class="nickname">${list.member_no}</a>
											</div>
											<span class="mc">·</span>
											<div class="icon_area font_12">
												<i class="fa-solid fa-flask"></i>
											</div>
											<span class="hp_point">33</span>
										</div>
										<div class="main_title_box flex item_center">
											<div class="main_title">
												<a href="/community/community_detail">${list.b_content}</a>
											</div>
											<div class="like_comment_box">
												<!-- 										<div class="box"> -->
												<!-- 											<img class="profile" -->
												<%-- 											src="${pageContext.request.contextPath }/resources/images/profile_logo.png"> --%>
												<!-- 										</div> -->
											</div>
										</div>
										<div class="main_title_box flex item_center">
											<div class="topic">
												<a href="#">자유</a>
											</div>
											<div class="like_comment_box">
												<!-- 										<div class="box"> -->
												<!-- 											<img class="profile" -->
												<%-- 											src="${pageContext.request.contextPath }/resources/images/profile_logo.png"> --%>
												<!-- 										</div> -->
												<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
													class="like_count">${list.b_recommend}</span> <i
													class="fa-regular fa-comment font_12 icon_area"></i> <span
													class="comment_count">${list.b_reply }</span> <i
													class="fa-regular fa-eye font_12 icon_area"></i> <span
													class="view_count">${list.b_view }</span>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<br>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</article>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>

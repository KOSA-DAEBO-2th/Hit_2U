<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link
	href="${pageContext.request.contextPath }/resources/css/community.css"
	rel="stylesheet" />
<script async
	src="${pageContext.request.contextPath}/resources/js/community2.js"
	type="text/javascript" defer></script>
<script async
	src="${pageContext.request.contextPath}/resources/js/util.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class='main_content_sm'>
		<div class="content_label font_32">
			<a>커뮤니티</a>
		</div>
		<div class="content_category flex padding_bottom_20">
			<div class="flex full_width content_center">
				<c:choose>
					<c:when test="${empty currunt_topic}">
						<form action="/community/search" onsubmit="return formChk();">
							<div id="total" class="btn btn_category btn_category_click"
								value="total" name="topic_option"
								onclick="location.href='/community/search/total'">전체</div>
							<div id="btn_free" class="btn btn_category" value="free"
								name="topic_option"
								onclick="location.href='/community/search/free'">자유</div>
							<div id="btn_komin" class="btn btn_category" value="komin"
								name="topic_option"
								onclick="location.href='/community/search/komin'">고민</div>
							<div id="btn_health" class="btn btn_category" value="health"
								name="topic_option"
								onclick="location.href='/community/search/health'">운동</div>
							<div id="btn_anonymous" class="btn btn_category"
								value="anonymous" name="topic_option"
								onclick="location.href='/community/search/anonymous'">익명</div>
						</form>

					</c:when>
					<c:otherwise>
						<form action="/community/search/${currunt_topic}"
							onsubmit="return formChk(this);">
							<div id="total"
								class="btn btn_category <c:if test="${currunt_topic eq 'total'}">btn_category_click</c:if>"
								value="total" name="topic_option"
								onclick="location.href='/community/search/total'">전체</div>
							<div id="btn_sell"
								class="btn btn_category <c:if test="${currunt_topic eq 'free'}">btn_category_click</c:if>"
								value="free" name="topic_option"
								onclick="location.href='/community/search/free'">자유</div>
							<div id="btn_buy"
								class="btn btn_category <c:if test="${currunt_topic eq 'komin'}">btn_category_click</c:if>"
								value="komin" name="topic_option"
								onclick="location.href='/community/search/komin'">고민</div>
							<div id="btn_buy"
								class="btn btn_category <c:if test="${currunt_topic eq 'health'}">btn_category_click</c:if>"
								value="health" name="topic_option"
								onclick="location.href='/community/search/health'">운동</div>
							<div id="btn_buy"
								class="btn btn_category <c:if test="${currunt_topic eq 'anonymous'}">btn_category_click</c:if>"
								value="anonymous" name="topic_option"
								onclick="location.href='/community/search/anonymous'">익명</div>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="middle_form">
			<div class="search_div flex content_center">
				<div class="" style="flex-basis: 15%;">
					<div class="btn btn_write font_14" data-bs-toggle="collapse"
						href="#collapseExample" role="button" aria-expanded="false"
						aria-controls="collapseExample">상세검색</div>
				</div>
				<div class="search-box flex content_center">
					<input type="text" class="search-txt" name="b_title" placeholder=""
						<c:if test="${!empty search_option.b_title}">value="${search_option.b_title }"</c:if>>
					<a class="search-btn"> <i class="fas fa-search"></i>
					</a>
				</div>
				<div class="flex"
					style="flex-basis: 15%; justify-content: flex-end;">
					<div class="btn btn_write font_14"
						onclick="location.href='/community/community_write_form'">
						<i class="fa-solid fa-pen margin_right_6"></i>작성하기
					</div>
				</div>
			</div>
			<div class="collapse " id="collapseExample">
				<div class="">상세 검색 옵션 추가</div>
			</div>
		</div>
		<section class="board_section">
			<c:forEach items="${list }" var="list" varStatus="i">
				<article>
					<a class="a_link" href="/community/${list.b_no }">
						<div class="board_form width_full">
							<div class="main_user flex item_center font_14">
								<div class="flex_1">
									<div class="flex item_center">
										<div class="profile_form">
											<img class="profile"
												src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
										</div>
										<div class="nickname_form">${list.nickname }</div>
										<span class="mc">·</span>
										<div class="flex item_center icon_form">
											<i class="fa-solid fa-flask flask"></i>
										</div>
										<sapn class="hp_point">${list.grade }</sapn>
									</div>
								</div>
								<div class="flex item_center write_date"></div>
							</div>
							<div class="main_title_box flex item_center">
								<div class="main_title">${list.b_title }</div>
							</div>
							<div class="flex content_between font_14">
								<div class="flex">
									<div class="board_in_topic margin_right_6">${list.topic_name }</div>
								</div>
								<div class="flex item_center like_comment_box">
									<i class="fa-regular fa-thumbs-up"></i> <span
										class="like_count margin_right_6">${list.b_recommend }</span>
									<i class="fa-regular fa-comment"></i> <span
										class="comment_count margin_right_6">${list.b_reply }</span> <i
										class="fa-regular fa-eye"></i> <span class="view_count">${list.b_view }</span>
								</div>
							</div>
					</a>
				</article>
			</c:forEach>
		</section>

		<!-- 페이징 왼쪽, 오른쪽 버튼, 페이지 번호 검색 -->
		<form action="/community/search">
			<div class="flex content_center item_center">
				<i class="fa-solid fa-chevron-left font_20 font_main page_arrow"></i>

				<c:choose>
					<c:when test="${page_init eq 1}">
						<input type="text"
							class="form-control page_test margin_left_20 current_page"
							name="page" value="1" />
					</c:when>

					<c:otherwise>
						<input type=" text "
							class=" form - control page_test margin_left_20 current_page "
							name=" page " value=" ${ search_option.page } " />
					</c:otherwise>

				</c:choose>
					
					<text class=" font_main font_bold"
						style="font-size: 25px; margin: 0px 15px;">/</text> <input
					type="text" class="form-control page_test margin_right_20 max_page"
					value="${maxPage }" disabled /> <i
					class="fa-solid fa-chevron-right font_20 font_main page_arrow">
				</i>
					<button class="hidden"></button>
			</div>
		</form>

		<!-- 새로추가된 코드 -->

<!-- 		<div class="flex content_center item_center"> -->
<!-- 			<i class="fa-solid fa-chevron-left font_20 font_main page_arrow"></i> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${page_init eq 1}"> --%>
<!-- 					<input type="text" -->
<!-- 						class="form-control page_test margin_left_20 current_page" -->
<!-- 						name="page" value="1" /> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<input type="text" -->
<!-- 						class="form-control page_test margin_left_20 current_page" -->
<%-- 						name="page" value="${search_option.page }" /> --%>
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>

<!-- 			<text class=" font_main font_bold" -->
<!-- 				style="font-size: 25px; margin: 0px 15px;">/</text> -->
<!-- 			<input type="text" -->
<!-- 				class="form-control page_test margin_right_20 max_page" -->
<%-- 				value="${maxPage }" disabled /> <i --%>
<!-- 				class="fa-solid fa-chevron-right font_20 font_main page_arrow"> -->
<!-- 			</i> -->
<!-- 			<button class="hidden"></button> -->
<!-- 		</div> -->

	</main>
	<c:import url="../includes/footer.jsp"></c:import>
	<form action="/market/search">
</body>
</html>
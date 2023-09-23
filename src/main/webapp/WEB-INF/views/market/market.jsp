<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>


<link
	href="${pageContext.request.contextPath }/resources/css/market.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/market.js"
	type="text/javascript" defer></script>

<script async
	src="${pageContext.request.contextPath}/resources/js/util.js"
	type="text/javascript" defer></script>
</head>
<body>

	<main class='main_content_sm'>
		<div class="content_label font_32">
			<a>HIT 마켓</a>
		</div>
		<div class="content_category flex padding_bottom_20">
			<div class="flex full_width content_center">

				<c:choose>
					<c:when test="${empty currunt_topic}">
						<form action="/market/search" onsubmit="return formChk();">
							<div id="total" class="btn btn_category btn_category_click"
								value="total" name="topic_option"
								onclick="location.href='/market/search/total'">전체</div>
							<div id="btn_sell" class="btn btn_category" value="sell"
								name="topic_option"
								onclick="location.href='/market/search/sell'">팝니다</div>
							<div id="btn_buy" class="btn btn_category" value="buy"
								name="topic_option" onclick="location.href='/market/search/buy'">삽니다</div>
					</c:when>
					<c:otherwise>
						<form action="/market/search/${currunt_topic}"
							onsubmit="return formChk(this);">
							<div id="total"
								class="btn btn_category <c:if test="${currunt_topic eq 'total'}">btn_category_click</c:if>"
								value="total" name="topic_option"
								onclick="location.href='/market/search/total'">전체</div>
							<div id="btn_sell"
								class="btn btn_category <c:if test="${currunt_topic eq 'sell'}">btn_category_click</c:if>"
								value="sell" name="topic_option"
								onclick="location.href='/market/search/sell'">팝니다</div>
							<div id="btn_buy"
								class="btn btn_category <c:if test="${currunt_topic eq 'buy'}">btn_category_click</c:if>"
								value="buy" name="topic_option"
								onclick="location.href='/market/search/buy'">삽니다</div>
					</c:otherwise>
				</c:choose>




			</div>
		</div>
		<div class="middle_form">
			<div class="search_div flex content_center">
				<div class="" style="flex-basis: 15%;">


					<div class="btn btn_search_option font_14"
						data-bs-toggle="collapse" href="#collapseExample" role="button"
						aria-expanded="false" aria-controls="collapseExample">
						<i class="fa-solid fa-bars"></i> 상세검색
					</div>


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
						onclick="location.href='/market/write'">
						<i class="fa-solid fa-pen margin_right_6"></i>작성하기
					</div>
				</div>

			</div>

			<c:choose>
				<c:when
					test="${!empty search_option.market_category or !empty search_option.state 
					or !empty search_option.trading or !empty search_option.discount or !empty search_option.completed}">
					<div class="collapse show" id="collapseExample">
				</c:when>

				<c:otherwise>
					<div class="collapse " id="collapseExample">
				</c:otherwise>


			</c:choose>
			<div class="padding_top_20">
				<div class="flex">
					<div class="input_section select">
						<select class="form-select font_12" name="market_category">
							<option value="" selected>카테고리</option>
							<option value="기타"
								<c:if test="${search_option.market_category eq '기타'}">selected</c:if>>기타</option>
							<option value="취미"
								<c:if test="${search_option.market_category eq '취미'}">selected</c:if>>취미</option>
							<option value="전자제품"
								<c:if test="${search_option.market_category eq '전자제품'}">selected</c:if>>전자제품</option>
							<option value="도서"
								<c:if test="${search_option.market_category eq '도서'}">selected</c:if>>도서</option>
						</select>
					</div>


					<div class="input_section select">
						<select class="form-select font_12" name="state">
							<option value="" selected>상품상태</option>
							<option value="중고"
								<c:if test="${search_option.state eq '중고'}">selected</c:if>>중고</option>
							<option value="새상품"
								<c:if test="${search_option.state eq '새상품'}">selected</c:if>>새상품</option>
						</select>
					</div>

					<div class="input_section select">
						<select class="form-select font_12" name="trading">
							<option value="" selected>교환방법</option>
							<option value="택배"
								<c:if test="${search_option.trading eq '택배'}">selected</c:if>>택배</option>
							<option value="직거래"
								<c:if test="${search_option.trading eq '직거래'}">selected</c:if>>직거래</option>

						</select>
					</div>

					<div class="input_section select">
						<select class="form-select font_12" name="discount">
							<option value="" selected>네고여부</option>
							<option value="가능"
								<c:if test="${search_option.discount eq '가능'}">selected</c:if>>가능</option>
							<option value="불가능"
								<c:if test="${search_option.discount eq '불가능'}">selected</c:if>>불가능</option>

						</select>
					</div>
					
					<div class="input_section select">
						<select class="form-select font_12" name="completed">
							<option value="" selected>전체보기</option>
							<option value="0"
								<c:if test="${search_option.completed eq '0'}">selected</c:if>>거래중</option>
							<option value="1"
								<c:if test="${search_option.completed eq '1'}">selected</c:if>>거래완료</option>
							
						</select>
					</div>


				</div>
			</div>
		</div>

		</div>


		<section class="board_section">
			<c:forEach items="${list }" var="list" varStatus="i">

				<article>
					<a class="a_link" href="/market/${list.b_no }">
						<div class="board_form width_full">
							<div class="main_user flex item_center font_14">
								<div class="flex_1">
									<div class="flex item_center">
										<div class="profile_form">
											<img class="profile"
												src="${list.profile}">
										</div>
										<div class="nickname_form">${list.nickname }</div>
										<span class="mc">·</span>
										<div class="flex item_center icon_form">
											<i class="fa-solid fa-flask flask"></i>
										</div>
										<sapn class="hp_point">${list.grade }</sapn>
									</div>
								</div>

								<div class="flex item_center write_date">
									<fmt:formatDate value="${list.b_write_date}"
										pattern="yyyy-MM-dd HH:mm" />
								</div>
							</div>

							<div class="main_title_box flex item_center">
								<div class="main_title">${list.b_title }</div>
							</div>

							<div class="flex content_between font_14">
								<div class="flex">
									<div class="board_in_topic margin_right_6">${list.topic_name }</div>
									<div class="market_category margin_right_6">${list.market_category }</div>
									<div class="price_form margin_right_6">
										<text>&#8361; </text>

										<text class="price"> <fmt:formatNumber
											value="${list.price}" pattern="#,###" /></text>
									</div>
									<c:if test="${list.completed eq '1'}"><div class="completed_category">거래완료</div></c:if>
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

		<div class="flex content_center item_center">
			<i class="fa-solid fa-chevron-left font_20 font_main page_arrow"></i>

			<c:choose>
				<c:when test="${page_init eq 1}">
					<input type="text"
						class="form-control page_test margin_left_20 current_page"
						name="page" value="1" />
				</c:when>

				<c:otherwise>
					<input type="text"
						class="form-control page_test margin_left_20 current_page"
						name="page" value="${search_option.page }" />
				</c:otherwise>


			</c:choose>

			<text class=" font_main font_bold"
				style="font-size: 25px; margin: 0px 15px;">/</text>
			<input type="text"
				class="form-control page_test margin_right_20 max_page"
				value="${maxPage }" disabled /> <i
				class="fa-solid fa-chevron-right font_20 font_main page_arrow">
			</i>
			<button class="hidden"></button>
		</div>


	</main>
	<c:import url="../includes/footer.jsp"></c:import>
	<form action="/market/search">
</body>
</html>

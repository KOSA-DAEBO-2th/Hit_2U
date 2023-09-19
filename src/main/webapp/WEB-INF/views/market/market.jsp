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
				<button id="total" class="btn btn_category btn_category_click"
					value="total">전체</button>
				<button id="btn_sell" class="btn btn_category" value="sell">팝니다</button>
				<button id="btn_buy" class="btn btn_category" value="buy">삽니다</button>
			</div>


		</div>
		<div class="search_div flex content_center">
			<div class="flex" style="flex-basis: 15%;">
				<button class="btn btn_write font_14"
					onclick="location.href='/market/write'">
					<i class="fa-solid fa-pen margin_right_6"></i>작성하기
				</button>
			</div>
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name="" placeholder="전체에서 검색">
				<a class="search-btn" href="#"> <i class="fas fa-search"></i>
				</a>
			</div>
			<div class="" style="flex-basis: 15%;"></div>
		</div>


		<section class="board_section">
			<c:forEach items="${list }" var="list" varStatus="i">

				<article>
					<a class="a_link" href="market/${list.b_no }">
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
									<div class="price_form">
										<text>&#8361; </text>

										<text class="price">
										<fmt:formatNumber value="${list.price}" pattern="#,###" /></text>
									</div>
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

	</main>
	<c:import url="../includes/footer.jsp"></c:import>
</body>
</html>

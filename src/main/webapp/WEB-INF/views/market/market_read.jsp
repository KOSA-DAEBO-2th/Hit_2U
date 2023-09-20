<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>


<link
	href="${pageContext.request.contextPath }/resources/css/market_read.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/market_read.js"
	type="text/javascript" defer></script>
</head>
<body>

	<main class="main_content flex content_center">

		<div style="width: 872.75px; min-width: 872.75px;">
			<div class="content_label font_32">
				<a>HIT 마켓</a>
			</div>

			<div class="market_read_top flex">
				<div id="carouselExampleFade" class="carousel slide carousel-fade">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="https://2teams3.s3.ap-northeast-2.amazonaws.com/Board/Meeting/9d76d146-3699-406b-9da6-6211494d7c36_KakaoTalk_20230905_101123810.jpg"
								class="d-block " alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://2teams3.s3.ap-northeast-2.amazonaws.com/Board/Meeting/10846923-d996-4695-92f3-3c254e5d0049_KakaoTalk_20230919_102736404.png"
								class="d-block " alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://2teams3.s3.ap-northeast-2.amazonaws.com/Board/Meeting/dc26f1bb-cab3-45cd-a324-6897ee1c0f16_KakaoTalk_20230919_091252679.png"
								class="d-block " alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

				<div class="padding_left_40"
					style="width: 570px; max-width: 570px; height: 300px;">
					<div class="market_title">${list.b_title }</div>
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

						<div class="flex item_center write_date margin_right_6">
							<fmt:formatDate value="${list.b_write_date}"
								pattern="yyyy-MM-dd HH:mm" />
						</div>
						<div class="day_cal font_12"></div>
					</div>
					<div class="flex content_end">
						<div class="flex item_center like_comment_box">
							<i class="fa-regular fa-thumbs-up"></i> <span
								class="like_count margin_right_6">${list.b_recommend }</span> <i
								class="fa-regular fa-comment"></i> <span
								class="comment_count margin_right_6">${list.b_reply }</span> <i
								class="fa-regular fa-eye"></i> <span class="view_count">${list.b_view }</span>
						</div>
					</div>
					<div class="flex item_end">
						<div class="price" style="font-size: 40px;">
							<fmt:formatNumber value="${list.price}" pattern="#,###" />
						</div>
						<div class="flex">
							<div style="font-size: 24px; padding: 8px 8px;">원</div>
							<div class="topic_name">${list.topic_name }</div>
						</div>
					</div>

					<div class="margin_top_12 margin_bottom_12 font_gray">
						· 카테고리<span class="product_value">${list.market_category }</span>
					</div>
					<div class="margin_bottom_12 font_gray">
						· 상품상태<span class="product_value">${list.state }</span>
					</div>
					<div class="margin_bottom_12 font_gray">
						· 교환방법<span class="product_value">${list.trading }</span>
					</div>
					<div class="margin_bottom_12 font_gray">
						· 네고여부<span class="product_value">${list.discount }</span>
					</div>
				</div>



			</div>
			<div class="market_read_content">${list.b_content}</div>

			<sec:authorize access="isAnonymous()">
				<!-- <div class="btn_form">
					<button class="btn btn_market_list" onclick="history.back()">목록으로</button>
				</div> -->
				<div class="btn_form">
					<div class="flex" style="justify-content: space-between;">
						<div>
							<button class="btn btn_market_list" onclick="history.back()">목록으로</button>
						</div>
						<div>
							<button class="btn btn_update margin_right_6" onclick="location.href='/market/update/${list.b_no}'">수정</button>
							<button class="btn btn_delete" onclick="location.href='/market/delete/${list.b_no}'">삭제</button>
						</div>
					</div>
				</div>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<div class="flex btn_form">
					<div class="flex">
						<button class="btn btn_market_list" onclick="history.back()">목록으로</button>
						<div class="flex_1">
							<button class="btn btn_market_list" onclick="location.href='/market/update/${list.b_no}'">수정</button>
							<button class="btn btn_market_list" onclick="history.back()">삭제</button>
						</div>
					</div>
				</div>
			</sec:authorize>




		</div>
	</main>
	<script type="text/javascript">
		var date = "${list.b_write_date}";
	</script>
</body>
<c:import url="../includes/footer.jsp"></c:import>

</html>

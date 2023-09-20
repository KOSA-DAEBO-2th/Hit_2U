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

				<div class="padding_left_40 font_24" style="max-width: 570px;">안녕하세요오오오옹</div>

			</div>




		</div>
	</main>
	<c:import url="../includes/footer.jsp"></c:import>
</body>
</html>

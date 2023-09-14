<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<link
	href="${pageContext.request.contextPath }/resources/css/meeting.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/meeting.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class="main_content">
		<div class="content_label font_32">
			<a>모임</a>
		</div>
		<div class="content_category flex padding_bottom_20">
			<div class="" style="flex-basis: 15%;"></div>

			<div class="flex full_width content_center">
				<button class="btn btn_category btn_category_click">전체</button>
				<button class="btn btn_category">프로젝트</button>
				<button class="btn btn_category">스터디</button>
			</div>

			<div class="flex" style="justify-content: flex-end; flex-basis: 15%;">
				<button class="btn btn_category btn_category_click"
					style="margin: 0px;" onclick="location.href='/meeting/write'">작성하기</button>

			</div>
		</div>
		<div class="flex content_center">
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name="" placeholder="전체에서 검색" />
				<a class="search-btn" href="#"> <i class="fas fa-search"></i>
				</a>
			</div>
		</div>

		<div class="album">
			<div class="container">
				<div class="row">
					<c:forEach begin="0" end="${fn:length(list)-1}" var="i">
						<div class="col-md-3" style="min-width: 300px;">
							<!-- 							<div class="card mb-4 shadow-sm"> -->
							<div class="card mb-4">
								<a href="meeting/${list[i].b_no }"
									style="text-decoration: none; color: black"> <svg
										class="bd-placeholder-img card-img-top" width="100%"
										height="120" xmlns="http://www.w3.org/2000/svg"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img" aria-label="Placeholder: Thumbnail">
                                            <title>Placeholder</title>
                                            <image
											href="${pageContext.request.contextPath }/resources/images/logo.png"
											width="100%" height="100%"></image>
                                            <rect x="10" y="10"
											width="69" height="25" rx="1" ry="1" />
                                            <text x="17" y="29"
											fill="#EEE">${list[i].meet_topic_name}</text>
                                        </svg>
									<div class="card-body">
										<h3 class="font_12 font_category">${list[i].meet_field }</h3>

										<h2 class="font_14">${list[i].b_title }</h2>
										<div class="icons_form margin_bottom_8">
											<c:forEach begin="0" end="${fn:length(tags[i])-1}" var="j">
												<img class="icons"
													src="${pageContext.request.contextPath}/resources/icons/${tags[i][j]}.svg" />
											</c:forEach>
										</div>
										<div
											class="card_middle flex font_gray font_12 margin_bottom_8">
											<div>
												<i class="fa-regular fa-thumbs-up icon_area"></i> <span
													class="like_count">${list[i].b_recommend }</span>
											</div>
											<div>
												<i class="fa-regular fa-eye icon_area"></i> <span
													class="view_count">${list[i].b_view }</span>
											</div>

										</div>

										<div class="font_12 font_gray">${list[i].meet_state }</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>

	<c:import url="../includes/footer.jsp"></c:import>
</body>
</html>

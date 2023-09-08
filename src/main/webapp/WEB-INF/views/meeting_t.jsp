<%@ include file="includes/header.jsp"%>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/resources/css/header.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/meeting_t.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/community.js"
	type="text/javascript" defer></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">
</head>
<body>
	<main class="main_content">
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

		<div class="album">
			<div class="container">
				<div class="row">
					<c:forEach begin="1" end="20">
						<div class="col-md-3" style="min-width: 300px;">
<!-- 							<div class="card mb-4 shadow-sm"> -->
							<div class="card mb-4">
								<a href="lecture_detail"
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
											fill="#EEE">프로젝트</text>
                                        </svg>
									<div class="card-body">
										<h3 class="font_12 font_category">소셜네트워크</h3>

										<h2 class="font_14">개발자들의 모임 플랫폼</h2>
										<div class="icons_form margin_bottom_8">
										<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/java.svg" />
												<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/jsp.svg" />
												<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/javascript.svg" />
											<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/aws.svg" />
											<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/spring.svg" />
												<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/figma.svg" />
												<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/oracle.svg" />
												<img class="icons"
												src="${pageContext.request.contextPath}/resources/icons/github.svg" />
										</div>
										<div class="card_middle flex font_gray font_12 margin_bottom_8">
										<div><i class="fa-regular fa-thumbs-up icon_area"></i> <span
												class="like_count">50</span></div>
											<div><i class="fa-regular fa-eye icon_area"></i> <span
												class="view_count">300</span></div>
											
										</div>
										
										<div class="font_12 font_gray">모집중</div>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>

	<c:import url="includes/footer.jsp"></c:import>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>');
	</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
</body>
</html>

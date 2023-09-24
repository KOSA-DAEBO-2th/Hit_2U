<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/resources/css/main.css?after"
	rel="stylesheet">
</head>
<body>
	<main class='main_content'>
		<div class="flex">
			<div class="main_left_column">


				<!-- 	좌측 상단 -->
				<div class="main_board_title">
					<div>
						<label><i class="fa-solid fa-fire"></i> H I T</label>
					</div>
					<div>
						<!-- 						<a href="#">더보기 ></a> -->
					</div>
				</div>
				<c:forEach var="hitList" items="${hitList}">
					<div class="main_hit_list">
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">${hitList.topic_name }</a>
								</div>
								<div style="width: 100%;">
									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<!-- 													<img class="profile" -->
													<%-- 														src="${pageContext.request.contextPath }/resources/images/profile_logo.png"> --%>

													<%-- 														<img class="profile" src="${hitList.profile}"> --%>
<img class="profile" src="${hitList.profile}">

												</div>
												<div class="nickname_area">${hitList.nickname }</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">${hitList.grade}</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">${hitList.b_view }</span>
										</div>
									</div>

									<div class="main_title_box flex item_center">
										<div class="main_title">${hitList.b_title }</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">${hitList.b_recommend }</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">${hitList.b_reply }</span>
										</div>
									</div>
								</div>
							</div>
						</article>
					</div>
				</c:forEach>



				<!-- 좌측 하단 -->

				<section class="main_community_board">
					<div class="main_board_title" style="padding-top: 32px">
						<div>
							<label><i class="fa-solid fa-clipboard-question"></i> Q &
								A</label>
						</div>
						<div>
							<a href="/qna">더보기 ></a>
						</div>
					</div>
					<c:forEach var="qnaList" items="${qnaList}">


						<div class="main_community_list">
							<article>
								<%-- 								<a class="a_link" href="/qna/${qnaList.b_no}"> --%>
								<div>
									<div class="board_list">
										<div class="topic">
											<a href="#">${qnaList.topic_name}</a>

										</div>
										<div style="width: 100%;">
											<div class="main_user">
												<div style="flex: 1;">
													<div class="flex item_center">
														<div class="box">
<!-- 															<img class="profile" -->
<%-- 																src="${pageContext.request.contextPath }/resources/images/profile_logo.png"> --%>
																
																<img class="profile" src="${qnaList.profile}">
																
														</div>
														<div class="nickname_area">${qnaList.nickname}</div>
														<span class="mc">·</span>
														<div class="icon_area font_12">
															<i class="fa-solid fa-flask"></i>
														</div>
														<!-- 														<sapn class="hp_point">0</sapn> -->
														<span class="hp_point">${qnaList.grade}</span>

													</div>
												</div>
												<div>
													<i class="fa-regular fa-eye font_12 icon_area"></i> <span
														class="view_count">${qnaList.b_view}</span>
												</div>
											</div>
											<div class="main_title_box flex item_center">
												<div class="main_title">${qnaList.b_title}</div>
												<div class="like_comment_box">
													<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
														class="like_count">${qnaList.b_recommend}</span> <i
														class="fa-regular fa-comment font_12 icon_area"></i> <span
														class="comment_count">${qnaList.b_reply}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 								</a> -->

							</article>
						</div>

						</a>
					</c:forEach>
				</section>
			</div>

			<!-- 			우측 상단 -->

			<div class="main_right_column"">
				<section class="main_notice_board margin_bottom_32">
					<div class="main_board_title">
						<div>
							<label><i class="fa-solid fa-chalkboard-user"></i></i> 커뮤니티</label>
						</div>
						<div>
							<a href="/community">더보기 ></a>
						</div>
					</div>
					<c:forEach var="communityList" items="${communityList}">
						<div class="main_community_list">
							<article>
								<div class="board_list">
									<div class="topic">
										<a href="#">${communityList.topic_name}</a>
									</div>
									<div style="width: 100%;">

										<div class="main_user">
											<div style="flex: 1;">
												<div class="flex item_center">
													<div class="box">
														<!-- 														<img class="profile" -->
														<%-- 															src="${pageContext.request.contextPath }/resources/images/profile_logo.png"> --%>
														<img class="profile" src="${communityList.profile}">

													</div>
													<div class="nickname_area">${communityList.nickname}</div>
													<span class="mc">·</span>
													<div class="icon_area font_12">
														<i class="fa-solid fa-flask"></i>
													</div>
													<!-- 													<sapn class="hp_point">0</sapn> -->
													<span class="hp_point">${communityList.grade}</span>
												</div>
											</div>
											<div>
												<i class="fa-regular fa-eye font_12 icon_area"></i> <span
													class="view_count">${communityList.b_view}</span>
											</div>
										</div>
										<div class="main_title_box flex item_center">
											<div class="main_title">${communityList.b_title}</div>
											<div class="like_comment_box">
												<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
													class="like_count">${communityList.b_recommend}</span> <i
													class="fa-regular fa-comment font_12 icon_area"></i> <span
													class="comment_count">${communityList.b_reply}</span>
											</div>
										</div>
									</div>
							</article>
						</div>
					</c:forEach>
				</section>



				<!-- 				우측하단 -->
				<section class="main_qna_board">
					<div class="main_board_title">
						<div>
							<label><i class="fa-solid fa-shop"></i> 마켓</label>
						</div>
						<div>
							<a href="/market">더보기 ></a>
						</div>
					</div>
					<c:forEach var="marketList" items="${marketList}">

						<div class="main_community_list">

							<article>
								<div class="board_list">
									<div class="topic">
										<a href="#">${marketList.topic_name}</a>
									</div>
									<div style="width: 100%;">

										<div class="main_user">
											<div style="flex: 1;">
												<div class="flex item_center">
													<div class="box">
<!-- 														<img class="profile" -->
<%-- 															src="${pageContext.request.contextPath }/resources/images/profile_logo.png"> --%>
															
															<img class="profile" src="${marketList.profile}">
													</div>
													<div class="nickname_area">${marketList.nickname}</div>
													<span class="mc">·</span>
													<div class="icon_area font_12">
														<i class="fa-solid fa-flask"></i>
													</div>
													<!-- 													<sapn class="hp_point">0</sapn> -->
													<span class="hp_point">${marketList.grade}</span>
												</div>
											</div>
											<div>
												<i class="fa-regular fa-eye font_12 icon_area"></i> <span
													class="view_count">${marketList.b_view}</span>
											</div>
										</div>
										<div class="main_title_box flex item_center">
											<div class="main_title">${marketList.b_title}</div>
											<div class="like_comment_box">
												<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
													class="like_count">${marketList.b_recommend}</span> <i
													class="fa-regular fa-comment font_12 icon_area"></i> <span
													class="comment_count">${marketList.b_reply}</span>
											</div>
										</div>
									</div>
							</article>
						</div>
					</c:forEach>
				</section>
			</div>
		</div>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
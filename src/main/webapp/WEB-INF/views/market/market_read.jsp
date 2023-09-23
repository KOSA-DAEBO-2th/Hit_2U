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
						<c:if test="${empty img_list}">
							<div class="carousel-item active">
								<img
									src="${pageContext.request.contextPath}/resources/images/no_img.jpg"
									class="d-block " alt="...">
							</div>
						</c:if>

						<c:forEach items="${img_list }" var="img_list" varStatus="i">
							<c:choose>
								<c:when test="${i.index == 0}">
									<div class="carousel-item active">
										<img src="${img_list.file_url }" class="d-block " alt="...">
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-item">
										<img src="${img_list.file_url }" class="d-block " alt="...">
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 						<div class="carousel-item">
							<img
								src="https://2teams3.s3.ap-northeast-2.amazonaws.com/Board/Meeting/10846923-d996-4695-92f3-3c254e5d0049_KakaoTalk_20230919_102736404.png"
								class="d-block " alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://2teams3.s3.ap-northeast-2.amazonaws.com/Board/Meeting/dc26f1bb-cab3-45cd-a324-6897ee1c0f16_KakaoTalk_20230919_091252679.png"
								class="d-block " alt="...">
						</div> -->
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

					<div class="margin_top_8 margin_bottom_4 font_gray">
						· 카테고리<span class="product_value">${list.market_category }</span>
					</div>
					<div class="margin_bottom_4 font_gray">
						· 상품상태<span class="product_value">${list.state }</span>
					</div>
					<div class="margin_bottom_4 font_gray">
						· 교환방법<span class="product_value">${list.trading }</span>
					</div>
					<div class=" margin_bottom_8 font_gray">
						· 네고여부<span class="product_value">${list.discount }</span>
					</div>
					<div class="flex">
						<%-- 						<button class="btn btn_like margin_right_12" onclick="location.href='/market/${list.b_no}/like'"> --%>


						<sec:authorize access="isAnonymous()">
							<button class="btn btn_like margin_right_12">
								<i class="fa-solid fa-heart"></i> 관심 (${list.b_recommend })
							</button>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<c:set var="login_no">
								<sec:authentication property="principal.member_no" />
							</c:set>

							<c:choose>
								<c:when test="${fn:contains(like, login_no)}">
									<button class="btn btn_like margin_right_12"
										onclick="location.href='/market/${list.b_no}/likeCancle'">
										<i class="fa-solid fa-heart"></i> 관심 중(${list.b_recommend })
									</button>
								</c:when>

								<c:otherwise>
									<button class="btn btn_like margin_right_12"
										onclick="location.href='/market/${list.b_no}/like'">
										<i class="fa-solid fa-heart"></i> 관심(${list.b_recommend })
									</button>
								</c:otherwise>
							</c:choose>
						</sec:authorize>

						<c:if test="${list.completed eq 1 }">
							<button class="btn btn_apply2 market_cmp_btn">거래완료</button>
						</c:if>

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
							<button class="btn btn_market_list btn_14"
								onclick="history.back()">목록으로</button>
						</div>
					</div>
				</div>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<div class="btn_form">
					<div class="flex" style="justify-content: space-between;">
						<div>
							<button class="btn btn_market_list btn_14"
								onclick="history.back()">목록으로</button>
						</div>
						<div>
							<c:if test="${list.completed eq 0 }">
								<button class="btn btn_update margin_right_6 btn_14"
									onclick="location.href='/market/completed/${list.b_no}'">거래완료</button>
							</c:if>

							<c:if test="${list.nickname eq '주영회(33세)'}">
								<button class="btn btn_update margin_right_6 btn_14"
								onclick="location.href='/market/update/${list.b_no}'">수정</button>
							<button class="btn btn_delete btn_14">삭제</button>
							</c:if>

			<%-- 				<button class="btn btn_delete btn_14"
								onclick="location.href='/market/delete/${list.b_no}'">삭제</button> --%>
						</div>
					</div>
				</div>
			</sec:authorize>









			<div class="question_form">
				<span class="content_tab">댓글 (${fn:length(reply_list)}) </span>
				<div class="question_section padding_top_20 padding_bottom_20">
					<div class="reply_update_load_form">
						<div class="reply_section font_14">
							<sec:authorize access="isAnonymous()">
								<textarea cols="20" wrap="hard" class="reply_input"
									placeholder="로그인한 사용자만 댓글 입력이 가능합니다." readonly></textarea>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<textarea cols="20" wrap="hard" class="reply_input"
									placeholder="댓글을 입력해주세요."></textarea>
							</sec:authorize>


							<div class="flex reply_add">
								<div>
									<text class="reply_current_value"></text>
									/
									<text class="font_gray">1,000</text>
								</div>
								<div>
									<button class="btn reply_submit">등록</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="reply_ajax">
					<c:choose>
						<c:when test="${reply_list == null or fn:length(reply_list) == 0}">
							<div
								class="reply_answer_section flex no_reply item_center font_14 content_center">등록된
								댓글이 없습니다.</div>
						</c:when>

						<c:otherwise>
							<c:forEach items="${reply_list }" var="reply_list" varStatus="i">
								<div class="question_section padding_top_20 padding_bottom_20">


									<div class="reply_answer_section">
										<input class="reply_no" type="hidden"
											value="${reply_list.reply_no }">

										<div class="userid_form flex">
											<div class="img_form margin_right_20">
												<a href="#"><img class="reply_profile" title="profile"
													src="${reply_list.profile}" /></a>
											</div>
											<div class="flex direction_column">
												<div class="flex item_center">

													<div class="userid">${reply_list.nickname}</div>
												</div>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i> 300
												</div>


											</div>
											<div class="flex content_end reply_date font_12"">
												<div class="flex" style="flex-direction: column;">
													<div>
														<fmt:formatDate value="${reply_list.reply_date }"
															pattern="yy.MM.dd HH:mm" />
													</div>
													<div class="flex"
														style="justify-content: flex-end; color: #212529; font-weight: 500;">

														<sec:authorize access="isAuthenticated()">
															<c:set var="reply_id">
																<sec:authentication property="principal.nickname" />
															</c:set>
															<c:set var="test">${reply_list.nickname }</c:set>

															<c:if test="${test eq '주영회(33세)'}">
																<div class="reply_cursor reply_update">수정</div>
																<div style="margin: 0px 8px;">/</div>
																<div class="reply_cursor reply_delete">삭제</div>
															</c:if>

														</sec:authorize>





													</div>
												</div>

											</div>

										</div>
										<div class="reply_update_form">
											<div class="padding_top_20 font_14">
												<%-- <textarea cols="20"  class="reply_output" readonly>${reply_list.r_content }</textarea> --%>
												<span class="reply_output">${reply_list.r_content }</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

			</div>




		</div>
	</main>
	<script type="text/javascript">
		var date = "${list.b_write_date}";
		var b_no = "${list.b_no}";
	</script>
</body>
<c:import url="../includes/footer.jsp"></c:import>

</html>

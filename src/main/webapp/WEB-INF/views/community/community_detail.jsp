<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/resources/css/community_detail.css"
	rel="stylesheet" />
<script async
	src="${pageContext.request.contextPath}/resources/js/community_detail_form.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class="main_content flex content_center">
		<div style="width: 872.75px; min-width: 872.75px;">
			<div class="content_label font_32">
				<a>커뮤니티 상세보기</a>
			</div>
			<div class="market_read_top flex">
				<div class="padding_left_40"
					style="width: 860px; max-width: 860px; height: 110px;">
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
						<div class="flex">
							<div style="font-size: 24px; padding: 8px 8px;"></div>
							<div class="topic_name">${list.topic_name }</div>
						</div>
					</div>
				</div>
			</div>
			<div class="market_read_content">${list.b_content}</div>
			<sec:authorize access="isAnonymous()">
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
							<button class="btn btn_update margin_right_6 btn_14"
								onclick="location.href='/community/update/${list.b_no}'">수정</button>
							<!-- 							<button class="btn btn_delete btn_14" -->
							<%-- 								onclick="location.href='/community/delete/${list.b_no}'">삭제</button> --%>
															<button class="btn btn_delete btn_14" 
															onclick="deleteAndAlert('/community/delete/${list.b_no}')">삭제</button>
	


						</div>
					</div>
				</div>
			</sec:authorize>
			<div class="question_form">
				<span class="content_tab">댓글 (${fn:length(reply_list)}) </span>
				<div class="question_section padding_top_20 padding_bottom_20">
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
										<div class="flex item_center">
											<div class="img_form margin_right_20">
												<a href="#"><img class="reply_profile" title="profile"
													src="${pageContext.request.contextPath}/resources/images/maple.jpg" /></a>
											</div>
											<div class="userid">${reply_list.nickname}</div>

											<div class="flex content_end reply_date font_12"></div>
										</div>
										<div class="padding_top_20 font_14 reply_output">
											${reply_list.r_content }</div>
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
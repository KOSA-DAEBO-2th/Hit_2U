<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="/resources/css/assets/star.css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/lecture_read.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/lecture_read.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class="main_content">

		<div
			class="flex content_center item_center direction_column padding_bottom_20">
			<div class="category_header font_16">${list.lecture_topic_name}</div>
			<div class="read_title  ">${list.b_title }</div>
			<div class="meeting_state ">${list.lecture_state }</div>

		</div>

		<div class="flex">

			<div class="read_main">
				<div class="test">
					<ul class="flex">
						<li class="read_select active info">정보</li>
						<li class="read_select question">수강평 (${list.b_reply})</li>
					</ul>
				</div>
				<div class="read_content">
					<div class="info_form">

						<div class="skill_section">
							<span class="content_tab"># 태그</span>
							<div class="skill_icons margin_top_20 padding_bottom_20">
								<c:forEach begin="0" end="${fn:length(tags)-1}" var="i">
									<img class="icons_30" title="${tags[i]}"
										src="${pageContext.request.contextPath}/resources/icons/${tags[i]}.svg" />
								</c:forEach>
							</div>
						</div>

						<div class="main_section padding_bottom_20 padding_top_20">
							<span class="content_tab">소개</span>
							<div class="main_text font_14 margin_top_20">
								${list.b_content }</div>
						</div>

						<div class="memeber_section padding_bottom_20 padding_top_20">
							<span class="content_tab">강사 정보</span>
							<div class="flex member_scroll">
								<c:forEach items="${lecture_member }" var="lecture_member"
									varStatus="i">
									<div class="member_form margin_top_20 margin_right_12">
										<div class="flex">
											<div>
												<a href="${lecture_member.git_link }"><img
													class="icons_40" title="profile"
													src="${pageContext.request.contextPath}/resources/images/maple.jpg" /></a>
											</div>
											<div class="flex direction_column">
												<div class="flex item_center">
													<div class="userid">${lecture_member.nickname }</div>
													<a href="${lecture_member.git_link }"><img
														class="icons_16 margin_left_8" title="github"
														src="${pageContext.request.contextPath}/resources/icons/github.svg" /></a>
												</div>

												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i> 300
												</div>
											</div>

										</div>
										<div class="user_interest font_14 margin_top_12">관심분야:
											스프링</div>
										<div class="user_role font_14">역할:
											${lecture_member.lecture_position}</div>
										<%-- <c:choose>
									<c:when test="${lecture_member.lecture_leader == 1 }">
										<div class="leader_position margin_top_12">리더</div>
									</c:when>
									<c:otherwise>
										<div class="member_position margin_top_12">멤버</div>
									</c:otherwise>
								</c:choose> --%>

									</div>
								</c:forEach>



							</div>
						</div>

						<div class="recommend_section padding_bottom_20 padding_top_20">
							<span class="content_tab">[추천] 다른 모임도 둘러보세요.</span>
							<div class="flex recommend_scroll">

								<c:forEach items="${recommend_list }" var="recommend_list"
									varStatus="i">
									<div class="member_form margin_top_20 margin_right_12">
										<div class="flex item_center">
											<div>
												<img class="recommend_thumbnail margin_right_12"
													title="Thumbnail"
													src="${pageContext.request.contextPath }/resources/images/logo.png" />
											</div>
											<div class="flex direction_column">

												<div class="recommend_title">${recommend_list.b_title }</div>


												<div class="recommend_content">
													${recommend_list.b_content }</div>
											</div>
										</div>
										<div class="flex">
											<div class="flex font_12 recommend_state margin_right_12">
												<div>모집 중</div>
												<div class="font_blue">${recommend_list.apply }/
													${recommend_list.apply_max }</div>

											</div>
											<div class="recommend_field">${recommend_list.lecture_field }</div>
										</div>
										<a href="/lecture/${recommend_list.b_no }"><div
												class="recomend_link margin_top_10">바로가기</div></a>

									</div>
								</c:forEach>


							</div>
						</div>

					</div>

					<div class="question_form">
						<span class="content_tab">👍 이 강의에 질문/리뷰를 올려주세요!</span>
						<div class="question_section padding_top_20 padding_bottom_20">

							<div class="reply_section font_14">
								<form class="mb-3" action="/lecture/insertReview" name="myform" id="myform" method="post">
									<fieldset>
										<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
											name="reviewStar" value="5" id="rate1"><label
											for="rate1">★</label> <input type="radio" name="reviewStar"
											value="4" id="rate2"><label for="rate2">★</label> <input
											type="radio" name="reviewStar" value="3" id="rate3"><label
											for="rate3">★</label> <input type="radio" name="reviewStar"
											value="2" id="rate4"><label for="rate4">★</label> <input
											type="radio" name="reviewStar" value="1" id="rate5"><label
											for="rate5">★</label>
									</fieldset>
									<div>
										<textarea class="col-auto form-control" id="reviewContents"
											placeholder="좋은 수강평을 남겨주세요!!!"></textarea>
										<div class="flex reply_add">
											<div>
												<text class="reply_current_value"></text>
												/
												<text class="font_gray">1,000</text>
											</div>
										</div>
											<div class="flex content_end margin_top_40">
												<input type="submit" class="btn btn-primary btn_main"
													value="리뷰 등록">
											</div>

									</div>
								</form>
							</div>

						</div>
						<c:choose>
							<c:when
								test="${reply_list == null or fn:length(reply_list) == 0}">
								<div
									class="reply_answer_section flex no_reply item_center font_14 content_center">아직
									글이 없습니다.첫번째 글을 작성해보세요 😁</div>
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
												<div class="flex content_end reply_date font_12">
													<fmt:formatDate value="${reply_list.reply_date }"
														pattern="yy.MM.dd HH:mm" />
												</div>
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
			<div class="read_right_form">
				<div class="leader_form">
					<span class="font_18 font_bold">강사 정보</span>
					<div class="userid_form flex">
						<div>
							<img class="icons_40" title="profile"
								src="${pageContext.request.contextPath}/resources/images/maple.jpg" />
						</div>
						<div class="flex direction_column">
							<div class="flex item_center">
								<div class="userid">${lecture_member[0].nickname }</div>
								<a href="${lecture_member[0].git_link }"><img
									class="icons_16 margin_left_8" title="github"
									src="${pageContext.request.contextPath}/resources/icons/github.svg" /></a>
							</div>

							<div class="icon_area font_12">
								<i class="fa-solid fa-flask"></i> 300
							</div>
						</div>
					</div>
					<div class="project_date">
						<div class="font_18 font_bold margin_bottom_12">${list.lecture_topic_name}
							기간</div>
						<div class="font_14">2023.09.08 ~ 2023.09.17</div>
					</div>
					<div class="project_date">
						<div class="font_18 font_bold margin_bottom_12">${list.lecture_topic_name}
							분야</div>
						<div class="font_14">${list.lecture_field }</div>
					</div>
					<div class="margin_top_12">
						<button class="btn btn_apply2">좋아요</button>
					</div>
				</div>
			</div>
		</div>


	</main>

	<c:import url="../includes/footer.jsp"></c:import>

	<script type="text/javascript">
		var boardIdx = $
		{
			list.b_no
		};
	</script>
</body>
</html>

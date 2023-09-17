<%@ include file="../includes/header.jsp"%>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/resources/css/meeting_read.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/meeting_read.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class="main_content">

		<div
			class="flex content_center item_center direction_column padding_bottom_20">
			<div class="category_header font_16">${list.meet_topic_name}</div>
			<div class="read_title  ">${list.b_title }</div>
			<div class="meeting_state ">${list.meet_state }</div>
			<div>${list }</div>


		</div>

		<div class="flex">

			<div class="read_main">
				<div class="test">
					<ul class="flex">
						<li class="read_select active info">정보</li>
						<li class="read_select question">질문 (${list.b_reply})</li>
					</ul>
				</div>
				<div class="read_content">
					<div class="info_form">
						<div class="state_section">
							<span class="content_tab">모집 현황</span>
							<div class=" margin_top_20 padding_bottom_20 font_14 ">

								<c:if test="${list.backend > 0 }">
									<div class="flex ">
										<div class ="position_name" style="width: 200px;">백엔드</div>
										<div style="width: 50px;">${list.backend_apply }/${list.backend }</div>
										<div>
											<c:choose>
												<c:when test="${list.backend_apply == list.backend }">
													<button class="btn btn_apply_end btn_backend"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<button class="btn btn_apply btn_backend" value="backend" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
														style="width: 80px;">지원</button>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
									<div></div>
								</c:if>
								<c:if test="${list.frontend > 0 }">
									<div class="flex margin_top_12">
										<div class ="position_name" style="width: 200px;">프론트엔드</div>
										<div style="width: 50px;">${list.frontend_apply }/${list.frontend }</div>
										<div>
											<c:choose>
												<c:when test="${list.frontend_apply == list.frontend }">
													<button class="btn btn_apply_end btn_frontend"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<button class="btn btn_apply btn_frontend" value="frontend" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
														style="width: 80px;">지원</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>

								<c:if test="${list.server > 0 }">
									<div class="flex margin_top_12">
										<div class ="position_name" style="width: 200px;">웹 서버</div>
										<div style="width: 50px;">${list.server_apply }/${list.server }</div>
										<div>
											<c:choose>
												<c:when test="${list.server_apply == list.server }">
													<button class="btn btn_apply_end btn_server"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<button class="btn btn_apply btn_server" value="server"  data-bs-toggle="modal" data-bs-target="#staticBackdrop"
														style="width: 80px;">지원</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>

								<c:if test="${list.pm > 0 }">
									<div class="flex margin_top_12">
										<div class ="position_name" style="width: 200px;">프로젝트 매니저</div>
										<div style="width: 50px;">${list.pm_apply }/${list.pm }</div>
										<div>
											<c:choose>
												<c:when test="${list.pm_apply == list.pm }">
													<button class="btn btn_apply_end btn_pm"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<button class="btn btn_apply btn_pm" value="pm"  data-bs-toggle="modal" data-bs-target="#staticBackdrop"
														style="width: 80px;">지원</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>
							</div>

						</div>

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
							<span class="content_tab">멤버</span>
							<div class="flex member_scroll">
								<c:forEach items="${meeting_member }" var="meeting_member"
									varStatus="i">
									<div class="member_form margin_top_20 margin_right_12">
										<div class="flex">
											<div>
												<a href="${meeting_member.git_link }"><img
													class="icons_40" title="profile"
													src="${pageContext.request.contextPath}/resources/images/maple.jpg" /></a>
											</div>
											<div class="flex direction_column">
												<div class="flex item_center">
													<div class="userid">${meeting_member.nickname }</div>
													<a href="${meeting_member.git_link }"><img
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
											${meeting_member.meeting_position}</div>
										<c:choose>
											<c:when test="${meeting_member.meeting_leader == 1 }">
												<div class="leader_position margin_top_12">리더</div>
											</c:when>
											<c:otherwise>
												<div class="member_position margin_top_12">멤버</div>
											</c:otherwise>
										</c:choose>

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
											<div class="recommend_field">${recommend_list.meet_field }</div>
										</div>
										<a href="/meeting/${recommend_list.b_no }"><div
												class="recoomend_link margin_top_10">바로가기</div></a>

									</div>
								</c:forEach>


							</div>
						</div>

					</div>

					<div class="question_form">
						<span class="content_tab">👍 이 모임에 응원·질문을 올려주세요!</span>
						<div class="question_section padding_top_20 padding_bottom_20">

							<div class="reply_section font_14">
								<textarea class="reply_input" placeholder="이 모임에 응원·질문을 올려주세요!"></textarea>
								<div class="flex reply_add">
									<div>
										<text class="reply_current_value"></text>
										/
										<text class="font_gray">1,000</text>
									</div>
									<div>
										<button class="reply_submit">등록</button>
									</div>
								</div>
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
					<span class="font_18 font_bold">리더 정보</span>
					<div class="userid_form flex">
						<div>
							<img class="icons_40" title="profile"
								src="${pageContext.request.contextPath}/resources/images/maple.jpg" />
						</div>
						<div class="flex direction_column">
							<div class="flex item_center">
								<div class="userid">${meeting_member[0].nickname }</div>
								<a href="${meeting_member[0].git_link }"><img
									class="icons_16 margin_left_8" title="github"
									src="${pageContext.request.contextPath}/resources/icons/github.svg" /></a>
							</div>

							<div class="icon_area font_12">
								<i class="fa-solid fa-flask"></i> 300
							</div>
						</div>
					</div>
					<div class="project_date">
						<div class="font_18 font_bold margin_bottom_12">${list.meet_topic_name}
							기간</div>
						<div class="font_14">2023.09.08 ~ 2023.09.17</div>
					</div>
					<div class="project_date">
						<div class="font_18 font_bold margin_bottom_12">${list.meet_topic_name}
							분야</div>
						<div class="font_14">${list.meet_field }</div>
					</div>
					<div class="margin_top_12">
						<button class="btn btn_apply2">좋아요</button>
					</div>
				</div>
			</div>
		</div>
		


	</main>

		<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">포지션 지원</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        해당 포지션에 지원하시겠습니까? <text class="apply_position font_blue"></text>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn_apply_cancle" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary btn_apply_submit">지원</button>
      </div>
    </div>
  </div>
</div>


	<c:import url="../includes/footer.jsp"></c:import>
	
<script type="text/javascript">
	var boardIdx = ${list.b_no};
</script>
</body>
</html>

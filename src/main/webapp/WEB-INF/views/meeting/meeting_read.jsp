﻿<%@ include file="../includes/header.jsp"%>
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

		</div>

		<div class="flex">

			<div class="read_main">
				<div class="test">
					<ul class="flex">
						<li class="read_select active info">정보</li>
						<li class="read_select question">질문
							(${fn:length(reply_list)})</li>
					</ul>
				</div>
				<div class="read_content">
					<div class="info_form">
						<div class="state_section">
							<div class="flex" style="justify-content: space-between;">
								<div class="content_tab">모집 현황</div>
								<sec:authorize access="isAuthenticated()">
									<c:set var="login_no">
										<sec:authentication property="principal.member_no" />
									</c:set>

									<c:choose>
										<c:when test="${list.member_no eq login_no}">
											<button class="btn btn-primary btn_normal btn_14"
												data-bs-toggle="modal" data-bs-target="#apply_modal">지원
												현황 (${fn:length(apply_list)})</button>
										</c:when>



										<c:otherwise>

										</c:otherwise>
									</c:choose>


								</sec:authorize>

							</div>
							<div class=" margin_top_20 padding_bottom_20 font_14 ">


								<c:if test="${list.backend > 0 }">
									<div class="flex ">
										<div class="position_name" style="width: 200px;">백엔드</div>
										<div style="width: 50px;">${list.backend_apply }/${list.backend }</div>
										<div>
											<c:choose>
												<c:when test="${list.backend_apply == list.backend }">
													<button class="btn btn_apply_end btn_backend"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<sec:authorize access="isAnonymous()">

													</sec:authorize>

													<sec:authorize access="isAuthenticated()">
														<c:set var="login_no">
															<sec:authentication property="principal.member_no" />
														</c:set>

														<c:choose>
															
															<c:when test="${login_no eq list.member_no}">
																<button class="btn btn_apply_end btn_backend"
																	value="backend" style="width: 80px; background-color: gray" disabled>모집 중</button>
																	<script>var test = "${login_no}"</script>
															</c:when>
															
															<c:when test="${fn:contains(like, login_no)}">
																<button class="btn btn_apply_cancle btn_backend"
																	value="backend" style="width: 80px;">지원 중</button>
																	<script>var test = "${login_no}"</script>
															</c:when>

															<c:when test="${fn:contains(apply_in, login_no)}">
																<button class="btn btn_apply_cancle btn_backend"
																	value="backend" style="width: 80px;"
																	onclick="location.href='/meeting/apply_cancle/${list.b_no}/${login_no}'">참여
																	중</button>
															</c:when>

															<c:otherwise>
																<button class="btn btn_apply btn_backend"
																	value="backend" data-bs-toggle="modal"
																	data-bs-target="#staticBackdrop" style="width: 80px;">지원</button>
															</c:otherwise>
														</c:choose>


													</sec:authorize>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
									<div></div>
								</c:if>
								<c:if test="${list.frontend > 0 }">
									<div class="flex margin_top_12">
										<div class="position_name" style="width: 200px;">프론트엔드</div>
										<div style="width: 50px;">${list.frontend_apply }/${list.frontend }</div>
										<div>
											<c:choose>
												<c:when test="${list.frontend_apply == list.frontend }">
													<button class="btn btn_apply_end btn_frontend"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<sec:authorize access="isAnonymous()">

													</sec:authorize>
													<sec:authorize access="isAuthenticated()">
														<c:set var="login_no">
															<sec:authentication property="principal.member_no" />
														</c:set>
														<c:choose>
															
															<c:when test="${login_no eq list.member_no}">
																<button class="btn btn_apply_end btn_backend"
																	value="backend" style="width: 80px; background-color: gray" disabled>모집 중</button>
																	<script>var test = "${login_no}"</script>
															</c:when>
															

															<c:otherwise>
																<button class="btn btn_apply btn_backend"
																	value="backend" data-bs-toggle="modal"
																	data-bs-target="#staticBackdrop" style="width: 80px;">지원</button>
															</c:otherwise>
														</c:choose>
														

														<!-- <button class="btn btn_apply btn_frontend"
															value="frontend" data-bs-toggle="modal"
															data-bs-target="#staticBackdrop" style="width: 80px;">지원</button> -->


													</sec:authorize>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>

								<c:if test="${list.server > 0 }">
									<div class="flex margin_top_12">
										<div class="position_name" style="width: 200px;">웹 서버</div>
										<div style="width: 50px;">${list.server_apply }/${list.server }</div>
										<div>
											<c:choose>
												<c:when test="${list.server_apply == list.server }">
													<button class="btn btn_apply_end btn_server"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<sec:authorize access="isAnonymous()">

													</sec:authorize>
													<sec:authorize access="isAuthenticated()">
													<c:choose>
															
															<c:when test="${login_no eq list.member_no}">
																<button class="btn btn_apply_end btn_backend"
																	value="backend" style="width: 80px; background-color: gray" disabled>모집 중</button>
																	<script>var test = "${login_no}"</script>
															</c:when>
															

															<c:otherwise>
																<button class="btn btn_apply btn_backend"
																	value="backend" data-bs-toggle="modal"
																	data-bs-target="#staticBackdrop" style="width: 80px;">지원</button>
															</c:otherwise>
														</c:choose>
														
													<!-- 	<button class="btn btn_apply btn_server" value="server"
															data-bs-toggle="modal" data-bs-target="#staticBackdrop"
															style="width: 80px;">지원</button> -->
													</sec:authorize>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:if>

								<c:if test="${list.pm > 0 }">
									<div class="flex margin_top_12">
										<div class="position_name" style="width: 200px;">프로젝트
											매니저</div>
										<div style="width: 50px;">${list.pm_apply }/${list.pm }</div>
										<div>
											<c:choose>
												<c:when test="${list.pm_apply == list.pm }">
													<button class="btn btn_apply_end btn_pm"
														style="width: 80px;" disabled>완료</button>
												</c:when>
												<c:otherwise>
													<sec:authorize access="isAnonymous()">

													</sec:authorize>
													<sec:authorize access="isAuthenticated()">
													<c:choose>
															
															<c:when test="${login_no eq list.member_no}">
																<button class="btn btn_apply_end btn_backend"
																	value="backend" style="width: 80px; background-color: gray" disabled>모집 중</button>
																	<script>var test = "${login_no}"</script>
															</c:when>
															

															<c:otherwise>
																<button class="btn btn_apply btn_backend"
																	value="backend" data-bs-toggle="modal"
																	data-bs-target="#staticBackdrop" style="width: 80px;">지원</button>
															</c:otherwise>
														</c:choose>
										<!-- 				<button class="btn btn_apply btn_pm" value="pm"
															data-bs-toggle="modal" data-bs-target="#staticBackdrop"
															style="width: 80px;">지원</button> -->
													</sec:authorize>
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
													src="${meeting_member.profile}" /></a>
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
										<div class="user_interest font_14 margin_top_12">아이디: ${meeting_member.member_id }</div>
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
													src="${recommend_list.file_url }" />
											</div>
											<div class="flex direction_column">

												<div class="recommend_title">${recommend_list.b_title }</div>


												<div class="recommend_content">

													<c:out
														value='${recommend_list.b_content.replaceAll("\\\<.*?\\\>","")}' />
												</div>
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
							<div class="reply_update_load_form">
								<div class="reply_section font_14">
									<sec:authorize access="isAnonymous()">
										<textarea cols="20" wrap="hard" class="reply_input"
											placeholder="이 모임에 응원·질문을 올려주세요!" readonly></textarea>
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
								<c:when
									test="${reply_list == null or fn:length(reply_list) == 0}">
									<div
										class="reply_answer_section flex no_reply item_center font_14 content_center">이
										모임에 응원·질문을 올려주세요!</div>
								</c:when>

								<c:otherwise>
									<c:forEach items="${reply_list }" var="reply_list"
										varStatus="i">
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

															<div class="userid" style="width: auto;">${reply_list.nickname}</div>
															<a href="${meeting_member[0].git_link }"><img
																class="icons_16 margin_left_8" title="github"
																src="${pageContext.request.contextPath}/resources/icons/github.svg" /></a>
														</div>

														<div class="icon_area font_12">
															<sapn class="fa-solid fa-flask margin_right_6"></sapn>
															<span>300</span>
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
																	<c:if test="${reply_list.nickname eq '주영회(33세)'}">
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

			</div>
			<div class="read_right_form">
				<div class="leader_form">
					<span class="font_18 font_bold">리더 정보</span>
					<div class="userid_form2 flex"
						onclick="location.href='/memberProfile/${meeting_member[0].member_id}'"
						style="cursor: pointer;">

						<div>
							<img class="icons_40" title="profile"
								src="${meeting_member[0].profile}" />
						</div>
						<div class="flex direction_column">
							<div class="flex item_center">
								<div class="userid">${meeting_member[0].nickname }</div>
								<a href="${meeting_member[0].git_link }"><img
									class="icons_16 margin_left_8" title="github"
									src="${pageContext.request.contextPath}/resources/icons/github.svg" /></a>
							</div>
							<div class="icon_area font_12">
								<i class="fa-solid fa-flask"></i> 256
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
	<div class="modal fade" id="apply_modal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">지원 현황</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:forEach items="${apply_list }" var="apply_list" varStatus="i">
						<div class="flex font_14 item_center" style="margin-bottom: 10px;">
							<div class="apply_id" style="flex: 1">${ apply_list.member_id}</div>
							<div class="apply_position" style="flex: 1">${ apply_list.meeting_position}</div>
							<div class="flex apply_btn_form"
								style="flex: 1; justify-content: flex-end;">
								<button class="btn btn_update margin_right_6 btn_14"
									onclick="location.href='/meeting/apply/${list.b_no}/${apply_list.member_no}/${apply_list.meeting_position }'">수락</button>
								<button class="btn btn_delete btn_14">거절</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>











	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">포지션 지원</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					해당 포지션에 지원하시겠습니까?
					<text class="apply_position font_blue"></text>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn_apply_cancle_1"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary btn_apply_submit">지원</button>
				</div>
			</div>
		</div>
	</div>

	<c:import url="../includes/footer.jsp"></c:import>

	<script type="text/javascript">
		var boardIdx = "${list.b_no}";
		
	</script>
</body>
</html>

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
			<div class="category_header font_16">스터디</div>
			<div class="read_title  ">${list.b_title }</div>
			<div class="meeting_state ">${list.meet_state }</div>
		</div>

		<div class="flex">

			<div class="read_main">
				<div class="test">
					<ul class="flex">
						<li class="read_select active">정보</li>
						<li class="read_select">질문 (${list.b_reply})</li>
					</ul>
				</div>
				<div class="read_content">
					<div class="state_section">
						<span class="content_tab">모집 현황</span>
						<div
							class="flex margin_top_20 margin_bottom_20 padding_bottom_20 font_14 item_center">
							<div style="width: 200px;">UI/UX</div>
							<div style="width: 100px;">0/1</div>
							<!-- 				<div>
								<button class="btn btn_apply" style="width: 100px;">지원</button>
							</div> -->
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
						<div class="flex">
							<div class="member_form margin_top_20 margin_right_12">
								<div class="flex">
									<div>
										<img class="icons_40" title="profile"
											src="${pageContext.request.contextPath}/resources/images/maple.jpg" />
									</div>
									<div class="flex direction_column">
										<div class="flex item_center">
											<div class="userid">주영회33</div>
											<img class="icons_16 margin_left_8" title="github"
												src="${pageContext.request.contextPath}/resources/icons/github.svg" />
										</div>

										<div class="icon_area font_12">
											<i class="fa-solid fa-flask"></i> 300
										</div>
									</div>

								</div>
								<div class="user_interest font_14 margin_top_12">관심분야: 스프링</div>
								<div class="user_role font_14">역할: 스프링</div>

								<div class="leader_position margin_top_12">리더</div>
							</div>


							<div class="member_form margin_top_20 margin_right_12">
								<div class="flex">
									<div>
										<img class="icons_40" title="profile"
											src="${pageContext.request.contextPath}/resources/images/maple.jpg" />
									</div>
									<div class="flex direction_column">
										<div class="flex item_center">
											<div class="userid">주영회33</div>
											<img class="icons_16 margin_left_8" title="github"
												src="${pageContext.request.contextPath}/resources/icons/github.svg" />
										</div>

										<div class="icon_area font_12">
											<i class="fa-solid fa-flask"></i> 300
										</div>
									</div>

								</div>
								<div class="user_interest font_14 margin_top_12">관심분야: 칼바람</div>
								<div class="user_role font_14">역할: 숟가락</div>

								<div class="member_position margin_top_12">멤버</div>
							</div>



						</div>
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
								<div class="userid">주영회33</div>
								<img class="icons_16 margin_left_8" title="github"
									src="${pageContext.request.contextPath}/resources/icons/github.svg" />
							</div>

							<div class="icon_area font_12">
								<i class="fa-solid fa-flask"></i> 300
							</div>
						</div>
					</div>
					<div class="project_date">
						<div class="font_18 font_bold margin_bottom_12">스터디 기간</div>
						<div class="font_14">2023.09.08 ~ 2023.09.17</div>
					</div>
					<div class="project_date">
						<div class="font_18 font_bold margin_bottom_12">스터디 분야</div>
						<div class="font_14">${list.meet_field }</div>
					</div>
					<div class="margin_top_12">
						<button class="btn btn_apply2">지원하기</button>
					</div>
				</div>
			</div>
		</div>
	</main>

	<c:import url="../includes/footer.jsp"></c:import>
</body>
</html>

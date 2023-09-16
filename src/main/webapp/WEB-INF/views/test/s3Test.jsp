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
		<div class="member_form margin_top_20 margin_right_12">
			<div class="flex">
				<div>
					<img class="icons_40" title="profile"
						src="https://2teams3.s3.ap-northeast-2.amazonaws.com/Board/Meeting/76b7997d-945e-4406-be4b-b1d295b602b6_images.png" />
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
</body>
</html>

<%@ include file="includes/header.jsp"%>
<html>
<head>
<link
	href="${pageContext.request.contextPath }/resources/css/meeting_write.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/community.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class="main_content_sm">
		<div class="content_label">
			<div class=" font_30">모임 생성</div>
			<div class="font_gray font_14">만들고 싶은 모임이 있다면 HIT에서 다양한 사람과
				함께하세요.</div>
		</div>
		<form>
			<div class="content_category padding_bottom_20">
				<span class="write_tab">유형 *</span>
				<div class="input_section radio">
					<input type="radio" class="btn-check" name="select_category"
						id="vbtn-radio1" autocomplete="off" checked value="project">
					<label class="btn btn-primary margin_right_20" for="vbtn-radio1">프로젝트</label>
					<input type="radio" class="btn-check" name="select_category"
						id="vbtn-radio2" autocomplete="off" value="study"> <label
						class="btn btn-primary" for="vbtn-radio2">스터디</label>
				</div>
				<div id="project_select" class="current margin_top_40">
					<span class="write_tab ">프로젝트명 *</span>
					<div class="input_section radio">
					<input class="form-control" type="text" placeholder="3~20글자로 입력해주세요.    예)중고거래 플랫폼" id="project_name" name="project_name"/>
					</div>
				</div>

			</div>
		</form>
	</main>

	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>

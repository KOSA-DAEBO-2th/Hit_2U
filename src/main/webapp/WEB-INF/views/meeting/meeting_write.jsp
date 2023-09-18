<%@ include file="../includes/header.jsp"%>
<html>
<head>
<script
	src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css">
<link
	href="${pageContext.request.contextPath }/resources/css/meeting_write.css"
	rel="stylesheet" />

<script
	src="${pageContext.request.contextPath}/resources/js/meeting_write.js"
	type="text/javascript" defer></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js"
	integrity="sha512-LsnSViqQyaXpD4mBBdRYeP6sRwJiJveh2ZIbW41EBrNmKxgr/LFZIiWT6yr+nycvhvauz8c2nYMhrP80YhG7Cw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-34s5cpvaNG3BknEWSuOncX28vz97bRI59UnVtEEpFX536A7BtZSJHsDyFoCl8S7Dt2TPzcrCEoHBGeM4SUBDBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</head>
<body>
	<main class="main_content_sm">
		<div class="content_label">
			<div class=" font_30">모임 생성</div>
			<div class="font_gray font_14">만들고 싶은 모임이 있다면 HIT에서 다양한 사람과
				함께하세요.</div>
		</div>
		<form id="meeting_insert" action="/meeting/write" method="post"
			autocomplete="on" enctype="multipart/form-data">
			<div class="write_wrap padding_bottom_20">
				<div class="write_tab">유형 *</div>
				<div class="input_section radio">
					<input type="radio" class="btn-check" name="meet_topic_name"
						id="vbtn-radio1" autocomplete="off" checked value="프로젝트">
					<label class="btn btn-outline-primary margin_right_20"
						for="vbtn-radio1">프로젝트</label> <input type="radio"
						class="btn-check" name="meet_topic_name" id="vbtn-radio2"
						autocomplete="off" value="스터디"> <label
						class="btn btn-outline-primary" for="vbtn-radio2">스터디</label>
				</div>
				<div id="project_select" class="current margin_top_40">
					<div class="write_tab ">프로젝트명 *</div>
					<div class="sub_explain font_14 font_lightgray">직관적인 프로젝트명을
						사용하시면 클릭률이 올라갑니다.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="3~20글자로 입력해주세요.    예)중고거래 플랫폼" id="project_name"
							name="b_title" />
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">프로젝트 분야 *</div>
					<div class="sub_explain font_14 font_lightgray">아래 분야 중에 한가지를
						선택해주세요.</div>
					<div class="input_section select">
						<select class="form-select" name="meet_field">
							<option value="" disabled selected>분야를 선택해주세요.</option>
							<option value="여행">여행</option>
							<option value="소셜네트워크">소셜네트워크</option>
							<option value="뷰티/패션">뷰티/패션</option>
							<option value="헬스/스포츠">헬스/스포츠</option>
							<option value="공유서비스">공유서비스</option>
							<option value="모빌리티(교통)">모빌리티(교통)</option>
						</select>
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">대표 이미지</div>
					<div class="sub_explain font_14 font_lightgray">대표 이미지를 업로드
						해주세요. 없다면 기본 이미지가 적용됩니다.</div>
					<div class="input_section image flex">
						<div class="img_input_btn flex item_center content_center">
							<i class="fa-solid fa-camera font_30 font_gray"></i>
						</div>

						<div class="padding_left_20">
							<input type="file" id="chooseFile" name="chooseFile"
								accept="image/*" onchange="loadFile(this)">
						</div>
					</div>
				</div>

				<div id="project_explain" class="current margin_top_40">
					<div class="write_tab ">프로젝트 설명 *</div>
					<div class="sub_explain font_14 font_lightgray">설명이 풍부한 프로젝트는
						아닌 프로젝트에 비해 지원율이 높습니다.</div>
					<div class="input_section text">
						<textarea id="summernote" name="b_content" form="meeting_insert"></textarea>
					</div>
				</div>

				<div id="project_date" class="current margin_top_40">
					<div class="write_tab ">프로젝트 기간 *</div>
					<div class="sub_explain font_14 font_lightgray">프로젝트 시작 일과 종료
						일을 적어주세요.</div>

					<div class="input_section date flex">
						<div class="padding_right_20 width_full">
							<input type="text" id="start" name="meet_start_day"
								class="form-control datePicker" placeholder="시작 일 YYYY-MM-DD" />
						</div>
						<div class="padding_left_20 width_full">
							<input type="text" id="end" name="meet_end_day"
								class="form-control datePicker padding_left_20"
								placeholder="종료 일 YYYY-MM-DD" />
						</div>
					</div>


				</div>

				<div id="project_member" class="current margin_top_40">
					<div class="write_tab ">모집인원 *</div>
					<div class="sub_explain font_14 font_lightgray">자신을 제외하고 모집할
						인원을 작성해주세요. 3~4명을 추천합니다.</div>

					<div class="flex item_center">
						<div class="input_section select position_select "
							style="margin-right: 20px;">
							<select class="form-select" name="meeting_position">
								<option value="" disabled selected>포지션을 선택해주세요.</option>
								<option value="백엔드">백엔드</option>
								<option value="프론트엔드">프론트엔드</option>
								<option value="웹 서버">웹 서버</option>
								<option value="프로젝트 매니저">프로젝트 매니저</option>
							</select>
						</div>

						<text class="font_blue">내 포지션</text>


					</div>

					<div class="member_form">
						<div class="flex item_center">
							<div class="input_section select position_select_member "
								style="margin-right: 20px;">
								<select class="form-select" id="selectbox_position">
									<option value="" disabled selected>포지션을 선택해주세요.</option>
									<option value="백엔드">백엔드</option>
									<option value="프론트엔드">프론트엔드</option>
									<option value="웹 서버">웹 서버</option>
									<option value="프로젝트 매니저">프로젝트 매니저</option>
								</select>
							</div>

							<div class="flex item_center font_16">
								<text class="font_blue margin_right_60">멤버 포지션</text>
								<div class="flex" style="width: 100px;">
									<div class="margin_right_20">
										<i class="fa-solid fa-minus"></i>
									</div>
									<div class="margin_right_20 member_count font_blue"
										style="width: 20px;">1</div>
									<div class="margin_right_20">
										<i class="fa-solid fa-plus"></i>
									</div>
								</div>
								<div class="btn btn-primary member_add_btn">추 가</div>
							</div>
						</div>

						<div class="flex member_add_form font_14"></div>



					</div>



				</div>


				<div id="project_tag" class="current margin_top_40">
					<div class="write_tab ">기술/언어 (최대 10개) *</div>
					<div class="sub_explain font_14 font_lightgray">프로젝트에 적용하고자
						하는 기술/디자인 플랫폼을 적어주세요.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="예) java react figma oracle" id="meet_tags"
							name="meet_tags" />
					</div>


				</div>
				<div class="flex content_end margin_top_40">
					<input type="submit" class="btn btn-primary btn_main"
						value="Submit">
				</div>
			</div>
		</form>
	</main>

	<c:import url="../includes/footer.jsp"></c:import>

	<script>
		
	</script>
</body>
</html>
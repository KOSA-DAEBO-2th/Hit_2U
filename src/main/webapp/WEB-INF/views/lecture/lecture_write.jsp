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
		<form id="lecture_insert" action="/lecture/write" method="post"
			autocomplete="on" enctype="multipart/form-data">
			<div class="write_wrap padding_bottom_20">
				<div class="write_tab">유형 *</div>
				<div class="input_section radio">
					<input type="radio" class="btn-check" name="lecture_topic_name"
						id="vbtn-radio1" autocomplete="off" checked value="외주">
					<label class="btn btn-outline-primary margin_right_20"
						for="vbtn-radio1">외주</label> <input type="radio"
						class="btn-check" name="lecture_topic_name" id="vbtn-radio2"
						autocomplete="off" value="강의"> <label
						class="btn btn-outline-primary" for="vbtn-radio2">강의</label>
				</div>
				<div id="project_select" class="current margin_top_40">
					<div class="write_tab ">서비스명 *</div>
					<div class="sub_explain font_14 font_lightgray">직관적인 서비스명을
						사용하시면 클릭률이 올라갑니다.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="3~20글자로 입력해주세요.    예)2주만에 마스터하는 자바스크립트" id="project_name"
							name="b_title" />
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">서비스 분야 *</div>
					<div class="sub_explain font_14 font_lightgray">아래 분야 중에 한가지를
						선택해주세요.</div>
					<div class="input_section select">
						<select class="form-select" name="lecture_field">
							<option value="" disabled selected>분야를 선택해주세요.</option>
							<option value="프론트">프론트</option>
							<option value="백엔드">백엔드</option>
							<option value="웹디자인">웹디자인</option>
							<option value="앱디자인">앱디자인</option>
							<option value="서버개발">서버개발</option>
							<option value="취업">취업</option>
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
					<div class="write_tab ">서비스 설명 *</div>
					<div class="sub_explain font_14 font_lightgray">설명이 풍부한 서비스는
						아닌 서비스에 비해 지원율이 높습니다.</div>
					<div class="input_section text">
						<textarea id="summernote" name="b_content" form="lecture_insert"></textarea>
					</div>
				</div>

				<div id="project_tag" class="current margin_top_40">
					<div class="write_tab ">기술/언어 (최대 10개) *</div>
					<div class="sub_explain font_14 font_lightgray">프로젝트에 적용하고자
						하는 기술/디자인 플랫폼을 적어주세요.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="예) java react figma oracle" id="lecture_tags"
							name="lecture_tags" />
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
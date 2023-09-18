<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="../includes/header.jsp"%>
<html>
<head>

<script async
	src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.js"
	defer></script>
<script async
	src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"
	defer></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css">
<link
	href="${pageContext.request.contextPath }/resources/css/meeting_write.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/meeting_write.js"
	type="text/javascript" defer></script>


</head>
<body>
	<main class="main_content_sm">
		<div class="content_label">
			<div class=" font_30">모임 생성</div>
			<div class="font_gray font_14">만들고 싶은 모임이 있다면 HIT에서 다양한 사람과
				함께하세요.</div>
		</div>
		<form id="meeting_insert" action="/test/write" method="post" autocomplete="on" enctype="multipart/form-data">
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
							<button class="img_input_btn">
								<i class="fa-solid fa-camera font_30"></i>
								<!-- <img src="이미지 파일 경로" alt="대체 텍스트" onclick="" > -->
							</button>
							<div>
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
				
				<div id="project_tag" class="current margin_top_40">
					<div class="write_tab ">기술/언어 (최대 10개) *</div>
					<div class="sub_explain font_14 font_lightgray">프로젝트에 적용하고자 하는 기술/디자인 플랫폼을 적어주세요.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="예) java react figma oracle" id="meet_tags"
							name="meet_tags" />
					</div>
					

			</div>
			<input type="submit" value="Submit">
		</form>
	</main>

	<c:import url="../includes/footer.jsp"></c:import>
</body>
</html>

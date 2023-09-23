<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath }/resources/css/community_write_form.css"
	rel="stylesheet" />

<script
	src="${pageContext.request.contextPath}/resources/js/market_update.js"
	type="text/javascript" defer></script>


</head>
<body>
	<main class="main_content_sm">
		<div class="content_label">
			<div class=" font_30">커뮤니티 글 수정</div>
			<div class="font_gray font_14">커뮤니티 글을 수정하세요.</div>
		</div>
		<form id="meeting_insert" action="/community/update/${list.b_no }"
			method="post" autocomplete="on" enctype="multipart/form-data">
			<div class="write_wrap padding_bottom_20">
				<div class="write_tab">토픽 *</div>
				<div class="input_section radio">
				
				
					<input type="radio" class="btn-check" name="topic_no" id="vbtn-radio1" autocomplete="off"
					<c:if test="${list.topic_no eq 3}">checked</c:if> value="3">
					<label class="btn btn-outline-primary margin_right_20" for="vbtn-radio1">자유</label> 
						
						
					<input type="radio" class="btn-check" name="topic_no" id="vbtn-radio2" autocomplete="off"
					<c:if test="${list.topic_no eq 4}">checked</c:if> value="4">
					<label class="btn btn-outline-primary  margin_right_20" for="vbtn-radio2">고민</label> 
					
					<input type="radio" class="btn-check" name="topic_no" id="vbtn-radio3" autocomplete="off"
					<c:if test="${list.topic_no eq 5}">checked</c:if> value="5">
					<label class="btn btn-outline-primary margin_right_20" for="vbtn-radio3">운동</label> 
						
						
					<input type="radio" class="btn-check" name="topic_no" id="vbtn-radio4" autocomplete="off"
					<c:if test="${list.topic_no eq 6}">checked</c:if> value="6">
					<label class="btn btn-outline-primary" for="vbtn-radio4">익명</label>
					
					
					
					
				</div>
				<div id="project_select" class="current margin_top_40">
					<div class="write_tab ">제목 *</div>
					<div class="sub_explain font_14 font_lightgray">HIT 커뮤니티에 올릴
						제목을 작성해주세요.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="3~20글자로 입력해주세요." id="project_name" name="b_title"
							value="${list.b_title }" />
					</div>
				</div>
				<div id="project_explain" class="current margin_top_20">
					<div class="write_tab ">내용 *</div>
					<div class="sub_explain font_14 font_lightgray">내용을 입력해주세요.</div>
					<div class="input_section text">
						<textarea id="summernote" name="b_content" form="meeting_insert">${list.b_content }</textarea>
					</div>
				</div>

				<div class="flex content_end margin_top_40">
					<input type="submit" class="btn btn-primary btn_main" value="수정">
				</div>
			</div>
		</form>
	</main>

	<c:import url="../includes/footer.jsp"></c:import>

	<script type="text/javascript">
		var url_txt = "${list.b_no}";
	</script>
</body>
</html>
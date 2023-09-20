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
	href="${pageContext.request.contextPath }/resources/css/market_write.css"
	rel="stylesheet" />

<script
	src="${pageContext.request.contextPath}/resources/js/market_write.js"
	type="text/javascript" defer></script>


</head>
<body>
	<main class="main_content_sm">
		<div class="content_label">
			<div class=" font_30">구매 또는 판매 등록</div>
			<div class="font_gray font_14">사거나 팔고싶은 물건이 있다면 마켓을 이용해보세요.</div>
		</div>
		<form id="meeting_insert" action="/market/write" method="post"
			autocomplete="on" enctype="multipart/form-data">
			<div class="write_wrap padding_bottom_20">
				<div class="write_tab">유형 *</div>
				<div class="input_section radio">
					<input type="radio" class="btn-check" name="topic_no"
						id="vbtn-radio1" autocomplete="off" checked value="9"> <label
						class="btn btn-outline-primary margin_right_20" for="vbtn-radio1">팝니다</label>
					<input type="radio" class="btn-check" name="topic_no"
						id="vbtn-radio2" autocomplete="off" value="10"> <label
						class="btn btn-outline-primary" for="vbtn-radio2">삽니다</label>
				</div>
				<div id="project_select" class="current margin_top_40">
					<div class="write_tab ">제목 *</div>
					<div class="sub_explain font_14 font_lightgray">HIT 마켓에 올릴
						제목을 작성해주세요.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="3~20글자로 입력해주세요." id="project_name" name="b_title" />
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">카테고리 *</div>
					<div class="sub_explain font_14 font_lightgray">아래 중에 한가지를
						선택해주세요.</div>
					<div class="input_section select">
						<select class="form-select" name="market_category">
							<option value="" disabled selected>선택해주세요.</option>
							<option value="기타">기타</option>
							<option value="취미">취미</option>
							<option value="전자제품">전자제품</option>
							<option value="도서">도서</option>
						</select>
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">가격 *</div>
					<div class="sub_explain font_14 font_lightgray">원하는 가격을 숫자만
						입력해주세요.</div>
					<div class="input_section text">
						<input class="form-control" type="text" placeholder="예) 30000"
							id="project_name" name="price" />
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">기타 *</div>
					<div class="sub_explain font_14 font_lightgray">각 옵션 중 한개씩
						선택해주세요.</div>
					<div class="flex" style="justify-content: space-between;" >
						<div class="input_section select" style="flex-basis: 250px;">
							<select class="form-select" name="state">
								<option value="" disabled selected>상품상태</option>
								<option value="중고">중고</option>
								<option value="새상품">새상품</option>
							</select>
						</div>
						
						<div class="input_section select" style="flex-basis: 250px;">
							<select class="form-select" name="trading">
								<option value="" disabled selected>교환방법</option>
								<option value="택배">택배</option>
								<option value="직거래">직거래</option>

							</select>
						</div>
						
						<div class="input_section select" style="flex-basis: 250px;">
							<select class="form-select" name="discount">
								<option value="" disabled selected>네고여부</option>
								<option value="가능">가능</option>
								<option value="불가능">불가능</option>

							</select>
						</div>
					</div>
				</div>

				<div id="project_explain" class="current margin_top_20">
					<div class="write_tab ">내용 *</div>
					<div class="sub_explain font_14 font_lightgray">내용을 입력해주세요.</div>
					<div class="input_section text">
						<textarea id="summernote" name="b_content" form="meeting_insert"></textarea>
					</div>
				</div>



				<div class="flex content_end margin_top_40">
					<input type="submit" class="btn btn-primary btn_main" value="등록">
				</div>
			</div>
		</form>
	</main>

	<c:import url="../includes/footer.jsp"></c:import>

	<script>
		
	</script>
</body>
</html>
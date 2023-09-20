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
	src="${pageContext.request.contextPath}/resources/js/market_update.js"
	type="text/javascript" defer></script>


</head>
<body>
	<main class="main_content_sm">
		<div class="content_label">
			<div class=" font_30">구매 또는 판매 수정</div>
			<div class="font_gray font_14">사거나 팔고싶은 물건이 있다면 마켓을 이용해보세요.</div>
		</div>
		<form id="meeting_insert" action="/market/update/${list.b_no }" method="post"
			autocomplete="on" enctype="multipart/form-data">
			<div class="write_wrap padding_bottom_20">
				<div class="write_tab">유형 *</div>
				<div class="input_section radio">
					<input type="radio" class="btn-check" name="topic_no"
						id="vbtn-radio1" autocomplete="off" <c:if test="${list.topic_no eq 9}">checked</c:if> value="9"> <label
						class="btn btn-outline-primary margin_right_20" for="vbtn-radio1">팝니다</label>
					<input type="radio" class="btn-check" name="topic_no"
						id="vbtn-radio2" autocomplete="off" <c:if test="${list.topic_no eq 10}">checked</c:if> value="10"> <label
						class="btn btn-outline-primary" for="vbtn-radio2">삽니다</label>
				</div>
				<div id="project_select" class="current margin_top_40">
					<div class="write_tab ">제목 *</div>
					<div class="sub_explain font_14 font_lightgray">HIT 마켓에 올릴
						제목을 작성해주세요.</div>

					<div class="input_section text">
						<input class="form-control" type="text"
							placeholder="3~20글자로 입력해주세요." id="project_name" name="b_title" value="${list.b_title }"/>
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">카테고리 *</div>
					<div class="sub_explain font_14 font_lightgray">아래 중에 한가지를
						선택해주세요.</div>
					<div class="input_section select">
						<select class="form-select" name="market_category">
							<option value="" disabled selected>선택해주세요.</option>
							<option value="기타" <c:if test="${list.market_category eq '기타'}">selected</c:if>>기타</option>
							<option value="취미" <c:if test="${list.market_category eq '취미'}">selected</c:if>>취미</option>
							<option value="전자제품" <c:if test="${list.market_category eq '전자제품'}">selected</c:if>>전자제품</option>
							<option value="도서" <c:if test="${list.market_category eq '도서'}">selected</c:if>>도서</option>
						</select>
					</div>
				</div>

				<div id="project_field" class="current margin_top_40">
					<div class="write_tab ">가격 *</div>
					<div class="sub_explain font_14 font_lightgray">원하는 가격을 숫자만
						입력해주세요.</div>
					<div class="input_section text">
						<input class="form-control" type="text" placeholder="예) 30000"
							id="project_name" name="price" value="${list.price }"/>
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
								<option value="중고" <c:if test="${list.state eq '중고'}">selected</c:if>>중고</option>
								<option value="새상품" <c:if test="${list.state eq '새상품'}">selected</c:if>>새상품</option>
							</select>
						</div>
						
						<div class="input_section select" style="flex-basis: 250px;">
							<select class="form-select" name="trading">
								<option value="" disabled selected>교환방법</option>
								<option value="택배" <c:if test="${list.trading eq '택배'}">selected</c:if>>택배</option>
								<option value="직거래" <c:if test="${list.trading eq '직거래'}">selected</c:if>>직거래</option>

							</select>
						</div>
						
						<div class="input_section select" style="flex-basis: 250px;">
							<select class="form-select" name="discount">
								<option value="" disabled selected>네고여부</option>
								<option value="가능" <c:if test="${list.discount eq '가능'}">selected</c:if>>가능</option>
								<option value="불가능" <c:if test="${list.discount eq '불가능'}">selected</c:if>>불가능</option>

							</select>
						</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<c:import url="includes/header.jsp"></c:import>


<script
	src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css">

<link
	href="${pageContext.request.contextPath }/resources/css/main.css?after"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/resources/css/community_write_form.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/util.js"
	type="text/javascript" defer></script>

<script async
	src="${pageContext.request.contextPath}/resources/js/community.js"
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
	<main class='main_content_sm'>
		<div class="content_label font_32">
			<a>커뮤니티</a>
		</div>

		<form id="writeform" name="writeform" method="post"
			action="/community/community_write" onsubmit="return board_write()"
			enctype="form-data">

			<div>
				<div>
					<div class="topic">
						<label><div class="write_tab">토픽 *</div></label>

						<div class="input_section select">
							<select class="form-select" name="topic">

								<option value="">토픽을 선택해주세요.</option>
								<option value="자유">자유</option>
								<option value="고민">고민</option>
								<option value="운동">운동</option>
								<option value="익명">익명</option>

							</select>

						</div>
					</div>
					<div class="title">
						<label><div class="write_tab">제목 *</div></label> 
						
						<input
							class="form-control" type="text" id="b_title" name="b_title"
							placeholder="제목을 입력해주세요.">
					</div>

					<div class="tagtag">
						<label><div class="write_tab">태그 *</div>
							<div class="sub_explain font_14 font_lightgray">내용을 대표하는 태그
								3개 정도 입력해주세요.</div> <!-- <span>내용을 대표하는 태그 3개 정도 입력해주세요.</span> --> </label>
						<!-- 	class="tag1-input"   -->
						<input class="form-control" placeholder="태그를 입력해주세요."></input>

					</div>
					<div class="textarea">
						<label><div class="write_tab">본문 *</div></label>
						<!-- 						<textarea id="b_content" name="b_content" -->
						<!-- 							placeholder="내용을 입력해주세요."></textarea> -->
						<!-- 					</div> -->

						<div class="input_section text">
							<textarea id="summernote" name="b_content"></textarea>
						</div>



					</div>
					<div class="button-container">
						<button class="btn btn-primary btn_main">취소</button>
						<button type="submit" class="btn btn-primary btn_main"
							onclick="board_write()">등록</button>
					</div>
				</div>
			</div>
		</form>
	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
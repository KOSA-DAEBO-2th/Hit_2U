<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Lecture & Outsourcing</title>
<link
	href="${pageContext.request.contextPath }/resources/css/lecture.css?after"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css?after"
	rel="stylesheet">
</head>
<body>
	<c:import url="includes/header.jsp"></c:import>
	
	<main class='main_content'>
		<section class="section_cat">
			<button class="btn btn_category">외주</button>
			<button class="btn btn_category">강의</button>
		</section>
		
		
		<div class="writing_list">
			<c:forEach begin="1" end="20" >
				<article class="writing">
					<a href="lecture_detail">
						<div class="w_info">
							<div class="thumbnail"> 사진사진</div>
							<div class="w_title"> 제목 어쩌구 저쩌구</div>
							<div class="w_price"> 가격 얼마</div>
						</div>
					</a>
				</article>
			
			</c:forEach>
		</div>
	</main>
	<c:import url="includes/footer.jsp"></c:import>

</body>
</html>
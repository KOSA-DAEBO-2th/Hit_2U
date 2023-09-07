<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>  </title>
<link
	href="${pageContext.request.contextPath }/resources/css/lecture_detail.css?after"
	rel="stylesheet">
</head>
<body>
	<c:import url="includes/header.jsp"></c:import>
	
	<main class='main_content'>
		<div>
			<section class="main_">
				<div class="main_info">
					<section class="image">
						<img alt="메인 이미지" src="" height="480" width="600px">
					</section>
					<nav class="info_tab">
						<div class="tab">
							<div class="service_info service">서비스 설명</div>
							<div class="service_price service">가격 정보</div>
							<div class="service_rating service">서비스 평가</div>
						</div>
					</nav>
					<section class="info_box">
						<div class="info">
							어쩌구저쩌구 서비스 정보~~~
						</div>
					</section>
				</div>
				<aside class="side_info">
					<section class="title">
						<h1>무슨무슨 강의이름</h1>
					</section>
					<section></section>
				</aside>
			</section>
		
		</div>
	</main>
	<c:import url="includes/footer.jsp"></c:import>

</body>
</html>
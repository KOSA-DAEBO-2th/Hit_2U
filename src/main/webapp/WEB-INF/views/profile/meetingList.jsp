<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>  </title>
</head>
<body>
	
	
	<div class="col-lg-12">
		<!-- <div class="card mb-4"> -->

				<div class="row">
				<h3>모집중</h3>
					<c:forEach items="${list }" var="list" varStatus="i">
						<div class="col-md-3" style="min-width: 300px;">
							<div class="card mb-4" style="position: relative;">
								<a href="meeting/${list.b_no }"
									style="text-decoration: none; color: black">
									<div class="thum_form">
										<c:choose>
											<c:when test="${empty list.file_url}">

												<img
													src="${pageContext.request.contextPath }/resources/images/logo.png"
													width="100%" height="100%" />
											</c:when>
											<c:otherwise>
												<img src="${list.file_url}" width="100%" height="100%"></img>
											</c:otherwise>
										</c:choose>
									</div> <c:choose>
										<c:when test="${list.meet_topic_name == '스터디'}">
											<div class="topic_study">${list.meet_topic_name}</div>
											<!--     <rect class="topic_study" x="3" y="3"
													width="3" height="3" rx="1" ry="1" /> -->
										</c:when>

										<c:when test="${list.meet_topic_name == '프로젝트'}">
											<div class="topic_project">${list.meet_topic_name}</div>
											<!--   <rect class="topic_project" x="10" y="10"
													width="69" height="25" rx="1" ry="1" /> -->

										</c:when>


									</c:choose> 
									 
									<div class="card-body">
										<h3 class="font_12 font_category">${list.meet_field }</h3>

										<h2 class="font_14">${list.b_title }</h2>

										<div
											class="card_middle flex font_gray font_12 margin_bottom_8">
											<div>
												<i class="fa-regular fa-thumbs-up icon_area"></i> <span
													class="like_count">${list.b_recommend }</span>
											</div>
											<div>
												<i class="fa-regular fa-eye icon_area"></i> <span
													class="view_count">${list.b_view }</span>
											</div>

										</div>
										<c:choose>
											<c:when test="${list.meet_state == '모집 중'}">
												<div class="font_12 font_gray">${list.meet_state }
													<text class="font_blue">${list.apply }/${list.apply_max }<text>
												</div>
											</c:when>

											<c:when test="${list.meet_state == '모집 종료'}">
												<div class="font_12" style="color: red; font-weight: bold">${list.meet_state }</div>

											</c:when>


										</c:choose>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>



				</div>
				
				


			
			<br><hr>
			<!-- <div class="card-body"> -->

				<div class="row">
				<h3>지원중</h3>
					<c:forEach items="${apply }" var="list" varStatus="i">
						<div class="col-md-3" style="min-width: 300px;">
							<div class="card mb-4" style="position: relative;">
								<a href="meeting/${list.b_no }"
									style="text-decoration: none; color: black">
									<div class="thum_form">
										<c:choose>
											<c:when test="${empty list.file_url}">

												<img
													src="${pageContext.request.contextPath }/resources/images/logo.png"
													width="100%" height="100%" />
											</c:when>
											<c:otherwise>
												<img src="${list.file_url}" width="100%" height="100%"></img>
											</c:otherwise>
										</c:choose>
									</div> <c:choose>
										<c:when test="${list.meet_topic_name == '스터디'}">
											<div class="topic_study">${list.meet_topic_name}</div>
											<!--     <rect class="topic_study" x="3" y="3"
													width="3" height="3" rx="1" ry="1" /> -->
										</c:when>

										<c:when test="${list.meet_topic_name == '프로젝트'}">
											<div class="topic_project">${list.meet_topic_name}</div>
											<!--   <rect class="topic_project" x="10" y="10"
													width="69" height="25" rx="1" ry="1" /> -->

										</c:when>


									</c:choose> 
									 
									<div class="card-body">
										<h3 class="font_12 font_category">${list.meet_field }</h3>

										<h2 class="font_14">${list.b_title }</h2>
									
										<div
											class="card_middle flex font_gray font_12 margin_bottom_8">
											<div>
												<i class="fa-regular fa-thumbs-up icon_area"></i> <span
													class="like_count">${list.b_recommend }</span>
											</div>
											<div>
												<i class="fa-regular fa-eye icon_area"></i> <span
													class="view_count">${list.b_view }</span>
											</div>

										</div>
										<c:choose>
											<c:when test="${list.meet_state == '모집 중'}">
												<div class="font_12 font_gray">${list.meet_state }
													<text class="font_blue">${list.apply }/${list.apply_max }<text>
												</div>
											</c:when>

											<c:when test="${list.meet_state == '모집 종료'}">
												<div class="font_12" style="color: red; font-weight: bold">${list.meet_state }</div>

											</c:when>


										</c:choose>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
<%-- 					<div class="flex content_center item_center">
						<i class="fa-solid fa-chevron-left font_20 font_main page_arrow"></i>
						<input type="text"
							class="form-control page_test margin_left_20 current_page"
							value="1" onkeyup="if(window.event.keyCode==13){page_go()}" />
						<text class=" font_main font_bold"
							style="font-size: 25px; margin: 0px 15px;">/</text>
						<input type="text"
							class="form-control page_test margin_right_20 max_page"
							value="${maxPage }" disabled /> <i
							class="fa-solid fa-chevron-right font_20 font_main page_arrow"></i>
					</div> --%>


				</div>

			<!-- </div> -->
			
			
		<!-- </div> -->
	</div>
	
	

</body>
</html>
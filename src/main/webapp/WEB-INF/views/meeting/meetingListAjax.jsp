<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<c:forEach items="${list }" var="list" varStatus="i">
		<div class="col-md-3" style="min-width: 300px;">
			<!-- 							<div class="card mb-4 shadow-sm"> -->
			<div class="card mb-4">
				<a href="meeting/${list.b_no }"
					style="text-decoration: none; color: black"> <svg
						class="bd-placeholder-img card-img-top" width="100%" height="120"
						xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
                                            <title>Placeholder</title>
                                            <image
							href="${pageContext.request.contextPath }/resources/images/logo.png"
							width="100%" height="100%"></image>
                     
							
							<c:choose>
											        <c:when test="${list.meet_topic_name == '스터디'}">
											            <rect class="topic_study" x="10" y="10"
									width="69" height="25" rx="1" ry="1" />
											        </c:when>
										
											         <c:when test="${list.meet_topic_name == '프로젝트'}">
											            <rect class="topic_project" x="10" y="10"
									width="69" height="25" rx="1" ry="1" />
     
											         </c:when>
										
	
										      </c:choose>
                                            <text x="17" y="29"
							fill="#EEE">${list.meet_topic_name}</text>
                                        </svg>
					<div class="card-body">
						<h3 class="font_12 font_category">${list.meet_field }</h3>

						<h2 class="font_14">${list.b_title }</h2>
						<div class="icons_form margin_bottom_8">
							<c:forEach begin="0" end="${fn:length(tag_list[i.index])-1}"
								var="j">
								<img class="icons"
									src="${pageContext.request.contextPath}/resources/icons/${tag_list[i.index][j]}.svg" />
							</c:forEach>
						</div>
						<div class="card_middle flex font_gray font_12 margin_bottom_8">
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
								<div class="font_12 font_gray">${list.meet_state }</div>

							</c:when>


						</c:choose>
						<%-- <div class="font_12 font_gray">${list.meet_state }</div> --%>
					</div>
				</a>
			</div>
		</div>
	</c:forEach>
</body>
</html>
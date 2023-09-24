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

				<div class="row">
				<h3>수강중</h3>
				<c:forEach items="${list}" var="list" varStatus="i">
                  <div class="col-md-3" style="min-width: 300px;">
                     <div class="card mb-4" style="position: relative;">
                        <a href="lecture/${list.b_no }"
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
                              <c:when test="${list.lecture_topic_name == '강의'}">
                                 <div class="topic_study">${list.lecture_topic_name}</div>
                                 <!--     <rect class="topic_study" x="3" y="3"
                                       width="3" height="3" rx="1" ry="1" /> -->
                              </c:when>

                              <c:when test="${list.lecture_topic_name == '외주'}">
                                 <div class="topic_project">${list.lecture_topic_name}</div>
                                 <!--   <rect class="topic_project" x="10" y="10"
                                       width="69" height="25" rx="1" ry="1" /> -->

                              </c:when>


                           </c:choose> 
                            
                           <div class="card-body">
                              <h3 class="font_12 font_category">${list.lecture_field }</h3>

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

                           </div>
                        </a>
                     </div>
                  </div>
               </c:forEach>
				
				
				</div>
	</div>

</body>
</html>
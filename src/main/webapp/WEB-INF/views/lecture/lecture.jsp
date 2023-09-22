<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
     <%--    <link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css?after" rel="stylesheet" />
        <!-- 부트스트랩 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Jquery -->

        <link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" />
                <link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/css/footer.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath }/resources/css/util.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script>
        <script
            async
            src="${pageContext.request.contextPath}/resources/js/header.js"
            type="text/javascript"
            defer
        ></script> --%>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/lecture.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/meeting.js"
	type="text/javascript" defer></script>
</head>
<body>
	<main class="main_content">
		<div class="content_label font_32">
			<a>프리랜서</a>

		</div>
		<div class="content_category flex padding_bottom_20">
			<div class="" style="flex-basis: 15%;"></div>

			<div class="flex full_width content_center">
				<button id="total" class="btn btn_category btn_category_click"
					value="전체">전체</button>
				<button id="project" class="btn btn_category" value="외주">외주</button>
				<button id="study" class="btn btn_category" value="강의">강의</button>
			</div>

			<div class="flex" style="justify-content: flex-end; flex-basis: 15%;">
				<button class="btn btn_write font_14"
					onclick="location.href='/lecture/write'">
					<i class="fa-solid fa-pen margin_right_6"></i>작성하기
				</button>

			</div>
		</div>
		<div class="flex content_center">
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name="" id="search_box"
					placeholder="전체에서 검색"
					onkeyup="if(window.event.keyCode==13){page(1)}" />
				<div class="search-btn" href="#">
					<i class="fas fa-search"></i>
				</div>
			</div>
		</div>

		<div class="album">
			<div class="container">
				<div class="row">
		<c:forEach items="${list }" var="list" varStatus="i">
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
                              <div class="icons_form margin_bottom_8">
                                 <c:forEach begin="0" end="${fn:length(tag_list[i.index])-1}"
                                    var="j">
                                    <img class="icons"
                                       src="${pageContext.request.contextPath}/resources/icons/${tag_list[i.index][j]}.svg" />
                                 </c:forEach>
                              </div>
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
                            <%--   <c:choose>
                                 <c:when test="${list.meet_state == '모집 중'}">
                                    <div class="font_12 font_gray">${list.meet_state }
                                       <text class="font_blue">${list.apply }/${list.apply_max }<text>
                                    </div>
                                 </c:when>

                                 <c:when test="${list.meet_state == '모집 종료'}">
                                    <div class="font_12 font_gray">${list.meet_state }</div>

                                 </c:when>


                              </c:choose> --%>
                           </div>
                        </a>
                     </div>
                  </div>
               </c:forEach>
					<div class="flex content_center item_center">
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
					</div>


				</div>

			</div>
		</div>
	</main>

	<c:import url="../includes/footer.jsp"></c:import>
</body>
</html>

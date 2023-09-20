<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath }/resources/css/header.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/community.css"
	rel="stylesheet" />

<script async
	src="${pageContext.request.contextPath}/resources/js/util.js"
	type="text/javascript" defer></script>

<script async
	src="${pageContext.request.contextPath}/resources/js/community.js"
	type="text/javascript" defer></script>

<script type="text/javascript">
window.onload = function() {
	var buttons = document.getElementsByClassName('btn_category');
	var currentPath = window.location.pathname + window.location.search;

	for (var i = 0; i < buttons.length; i++) {
		if (currentPath == buttons[i].getAttribute('href')) {
			buttons[i].classList.add('active');
		} else {
			buttons[i].classList.remove('active');
		}
	}
}
</script>

</head>
<body>
	<main class="main_content_sm">
		<div class="content_label font_32">
			<a>커뮤니티</a>
		</div>
		<div class="content_category flex content_center padding_bottom_20">

			<!-- 			<a id="btn_all" href="/community" class="btn btn_category">전체</a> <a -->
<!-- 				id="btn_free" href="/category?topic_no=3" class="btn btn_category">자유</a> -->
<!-- 			<a id="btn_worry" href="/category?topic_no=4" -->
<!-- 				class="btn btn_category">고민</a> <a id="btn_exercise" -->
<!-- 				href="/category?topic_no=5" class="btn btn_category">운동</a> <a -->
<!-- 				id="btn_anonymous" href="/category?topic_no=6" -->
<!-- 				class="btn btn_category btn_anonymous">익명</a> -->

	<a id="btn_all" href="/community" data-url="/community/search"
		class="btn btn_category">전체</a> <a id="btn_free"
		href="/category?topic_no=3" data-url="/category/3/search"
		class="btn btn_category">자유</a> <a id="btn_worry"
		href="/category?topic_no=4" data-url="/category/4/search"
		class="btn btn_category">고민</a> <a id="btn_exercise"
		href="/category?topic_no=5" data-url="/category/5/search"
		class="btn btn_category">운동</a> <a id="btn_anonymous"
		href="/category?topic_no=6" data-url="/category/6/search"
		class="btn btn_category btn_anonymous">익명</a>

</div>

<div class="flex content_center">
	<div class="search-box flex content_center">
		<input type="text" class="search-txt" id="search_box"
			placeholder="전체에서 검색"
			onkeyup="if(event.keyCode==13){submitSearch()}" />
<div class="search-btn" onclick="submitSearch()">
			<i class='fas fa-search'></i>
		</div>
	</div>
</div>

<script>
function submitSearch() {
	var title = document.getElementById('search_box').value;
	if (title) {
		location.href = '/community/search?title='
				+ encodeURIComponent(title);
	}
}
</script>

<div class=write_btn_container>
	<button class="btn btn_write">
		<a href="/community/community_write_form" class="write_btn2">작성하기</a>
	</button>
</div>
<article>
	<div class="board_list">

		<div style="width: 100%;">
<div class="main_user">
	<div style="flex: 1;">
<c:forEach var="list" items="${list}">
<div class="board_list">
	<a class="write_list_container"
		href="/community/community_detail?b_no=${list.b_no}&pg=${pg}">
	<div class="board_list_inside">
		<div class="flex item_center">
			<i id="" class="fa fa-file-text-o" aria-hidden="true"></i>
					
			<div class="list_number">
				<div class="board_list_number">${list.b_no}</div>
			</div>
			<span class="mc"> </span>

			 <i id="user_icon"
				class="fa fa-user-o" aria-hidden="true"></i>

			<div class="nickname_area_container">
					<div class="nickname_area">${list.nickname}</div>
			</div>
			
			<span class="mc"> </span>
			<div class="icon_area font_12">
				<i id = "flask_icon" class="fa-solid fa-flask"></i>
			</div>
			<span class="hp_point">${list.grade}</span>
			

			<div class="write_date">
				<fmt:formatDate value="${ list.b_write_date }"
					pattern="yyyy-MM-dd HH:mm" />
			</div>

		</div>
		<div class="main_title_box flex item_center">
			<div class="main_title">${list.b_title}</div>
			<div class="like_comment_box"></div>
		</div>
		<div class="main_title_box flex item_center">
		
		<div class="topic-container">
			<div class="topic">${list.topic_name}</div>
			</div>
			
			<div class="like_comment_box">

				<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
					class="like_count">${list.b_recommend}</span> <i
					class="fa-regular fa-comment font_12 icon_area"></i> <span
					class="comment_count">${list.b_reply }</span> <i
					class="fa-regular fa-eye font_12 icon_area"></i> <span
					class="view_count">${list.b_view }</span>
				</div>
			</div>

		</div>
	</a>
</div>
</c:forEach>
				</div>
			</div>
		</div>
	</div>
</article>

<div class="paging-container">
	<table>
		<tr>
			<td>
				<!-- 처음 이전 링크 --> <c:if test="${currentPage > 1}">
[<a href="?topic_no=${param.topic_no}&amp;page=1"> ◀◀ </a>]
[<a href="?topic_no=${param.topic_no}&amp;page=${currentPage - 1}">
◀ </a>]
</c:if> <c:if test="${currentPage <= 1}">
[<span style="color: gray"> ◀◀ </span>]
[<span style="color: gray"> ◀ </span>]
</c:if> <!-- 페이지 번호 출력 --> <c:forEach begin="${startPageGroup}"
end="${endPageGroup}" step="1" varStatus="status">
<c:choose>
<c:when test="${status.index == currentPage}">
                   [${status.index}]
               </c:when>
<c:otherwise>
                   [<a
	href="?topic_no=${param.topic_no}&amp;page=${status.index}">${status.index}</a>]
               </c:otherwise>
</c:choose>
</c:forEach> <!-- 다음 이후 링크 --> <c:if test="${currentPage < totalPages}">
            [<a
href="?topic_no=${param.topic_no}&amp;page=${currentPage + 1}">
▶</a>]	
            [<a
href="?topic_no=${param.topic_no}&amp;page=${totalPages}">
▶▶</a>]	
</c:if> <c:if test="${currentPage >= totalPages}">
  [<span style="color: gray;"> ▶</span>]			
  [<span style="color: gray;"> ▶▶</span>]			
 </c:if>

				</td>
			</tr>
		</table>
	</div>
</main>
<c:import url="includes/footer.jsp"></c:import>
</body>
</html>

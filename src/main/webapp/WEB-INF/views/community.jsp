<%@ include file="includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body>
	<main class="main_content_sm">
		<div class="content_label font_32">
			<a>커뮤니티</a>
		</div>
		<div class="content_category flex content_center padding_bottom_20">

			<button onclick="window.location.href='/community'"
class="btn btn_category btn_category_click">전체</button>
	<a href="/category?topic_no=3" class="btn btn_category">자유</a> <a
		href="/category?topic_no=4" class="btn btn_category">고민</a> <a
		href="/category?topic_no=5" class="btn btn_category">운동</a> <a
		href="/category?topic_no=6" class="btn btn_category btn_anonymous">익명</a>
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
				<i id="flask_icon" class="fa-solid fa-flask"></i>
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
<!-- 		<div class="paging-container"> -->
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<td> -->
<%-- 						<!-- 처음 이전 링크 --> <c:if test="${ pg>1 }"> --%>
<!-- 				[<a href="community?pg=1"> ◀◀ </a>]				 -->
<%-- 				[<a href="community?pg=${pg-1}"> ◀ </a>]		 --%>
<%-- 			</c:if> <c:if test="${ pg<=1 }"> --%>

<!-- 				[<span style="color: gray"> ◀◀ </span>]			 -->
<!-- 				[<span style="color: gray"> ◀ </span>]			 -->

<%-- 			</c:if> <c:forEach begin="${formPage}" end="${toPage}" var="i"> --%>
<%-- 							<c:if test="${i==pg}">[${i}]</c:if> --%>
<%-- 							<c:if test="${i!=pg}">  --%>
<%-- 					[<a href="community?pg=${i}">${i}</a>] --%>
<%-- 			    </c:if> --%>

<%-- 						</c:forEach> <c:if test="${pg < allPage}"> --%>
<%-- 				[<a href="community?pg=${pg + 1}"> ▶ </a>]			 --%>
<%-- 				[<a href="community?pg=${allPage}"> ▶▶ </a>]			 --%>
<%-- 			</c:if> <c:if test="${pg >= allPage}">			 --%>
<!-- 				[<span style="color: gray"> ▶ </span>]			 -->
<!-- 				[<span style="color: gray"> ▶▶ </span>]			 -->

<%-- 			</c:if> --%>

<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</div> -->


<div class="paging-container">
	<table>
		<tr>
			<td>
				<!-- 처음 이전 링크 --> <c:if test="${ pg>1 }">
[<a href="community?pg=1"> ◀◀ </a>]				
[<a href="community?pg=${pg-1}"> ◀ </a>]		
</c:if> <c:if test="${ pg<=1 }">

[<span style="color: gray"> ◀◀ </span>]			
[<span style="color: gray"> ◀ </span>]			

</c:if> <c:forEach begin="${formPage}" end="${toPage}" var="i">
<c:if test="${i==pg}">[${i}]</c:if>
<c:if test="${i!=pg}"> 
[<a href="community?pg=${i}">${i}</a>]
</c:if>

</c:forEach> <c:if test="${pg < allPage}">
[<a href="community?pg=${pg + 1}"> ▶ </a>]			
[<a href="community?pg=${allPage}"> ▶▶ </a>]			
</c:if> <c:if test="${pg >= allPage}">			
[<span style="color: gray"> ▶ </span>]			
[<span style="color: gray"> ▶▶ </span>]			

</c:if>

				</td>
			</tr>
		</table>
	</div>


</main>
<c:import url="includes/footer.jsp"></c:import>
</body>
</html>

<%@ include file="includes/header.jsp" %>
<html>
<head>
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
			<button class="btn btn_category btn_category_click">전체</button>
			<button class="btn btn_category">자유</button>
			<button class="btn btn_category">고민</button>
			<button class="btn btn_category">운동</button>
			<button class="btn btn_category btn_anonymous">익명</button>
		</div>
		<div class="flex content_center">
			<div class="search-box flex content_center">
				<input type="text" class="search-txt" name="" placeholder="전체에서 검색" />
				<a class="search-btn" href="#"> <i class="fas fa-search"></i>
				</a>
			</div>
		</div>

		<button class="btn btn_write">
			<a href="/community/communityWrite">작성하기</a>
		</button>
		<button class="btn btn_write">
			<a href="/community/communityWriteSourceCode">작성하기 (소스코드)</a>
		</button>
		<article>
			<div class="board_list">
				<div class="topic">
					<a href="#">자유</a>
				</div>
				<div style="width: 100%;">

					<div class="main_user">
						<div style="flex: 1;">
							<div class="flex item_center">
								<div class="box">
									<img class="profile"
										src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
								</div>
								<div class="nickname_area">윤성호빵맨</div>
								<span class="mc">·</span>
								<div class="icon_area font_12">
									<i class="fa-solid fa-flask"></i>
								</div>
								<span class="hp_point">33</span>
							</div>
						</div>
						<div>
							<i class="fa-regular fa-eye font_12 icon_area"></i> <span
								class="view_count">17</span>
						</div>
					</div>

					<div class="main_title_box flex item_center">
						<div class="main_title">사람들 키보드 소리가 너무 시끄러운데 제가 예민한건가요?</div>
						<div class="like_comment_box">
							<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
								class="like_count">21</span> <i
								class="fa-regular fa-comment font_12 icon_area"></i> <span
								class="comment_count">553</span>
						</div>
					</div>
				</div>
			</div>
		</article>

		<!-- 페이징 처리 -->
		<table>
			<tr>
				<td>
					<!-- 처음 이전 링크 --> <c:if test="${ pg>1 }">
				[<a href="community?pg=1"> ◀◀ </a>]			
				[<a href="community?pg=${formPage}"> ◀ </a>]			
			</c:if> <c:if test="${ pg<=1 }">
			
				[<span style="color: gray"> ◀◀ </span>]			
				[<span style="color: gray"> ◀ </span>]			

			</c:if> <!-- 			블록 범위 출력 --> <c:forEach begin="${formPage}" end="${toPage}"
						var="i">
						<c:if test="${i==pg}">[${i}]</c:if>
						<c:if test="${i!=pg}"> 
					[<a href="community?pg=${i}">${i}</a>]
			    </c:if>

					</c:forEach> <!-- 다음 이후 링크 --> <c:if test="${pg < allPage}">
				[<a href="community?pg=${pg + 1}"> ▶ </a>]			
				[<a href="community?pg=${allPage}"> ▶▶ </a>]			
			</c:if> <c:if test="${pg >= allPage}">			
				[<span style="color: gray"> ▶ </span>]			
				[<span style="color: gray"> ▶▶ </span>]			

			</c:if>

				</td>
			</tr>
		</table>
	</main>
	<c:import url="footer.jsp"></c:import>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath }/resources/css/main.css?after"
	rel="stylesheet">
</head>
<body>
	<c:import url="includes/header.jsp"></c:import>

	<main class='main_content'>
		<div class="flex">
			<div class="main_left_column"">
				<section class="main_hit_board margin_bottom_32">
					<div class="main_board_title">
						<div>
							<label><i class="fa-solid fa-fire"></i> H I T</label>
						</div>
						<div>
							<a href="#">더보기 ></a>
						</div>
					</div>

					<div class="main_hit_list">
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">커리어</a>
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
												<sapn class="hp_point">33</sapn>
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
						</article>
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
												<sapn class="hp_point">33</sapn>
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
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">알고리즘</a>
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
												<sapn class="hp_point">33</sapn>
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
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">기타</a>
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
												<sapn class="hp_point">33</sapn>
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
						</article>
					</div>

				</section>
				<section class="main_community_board">
					<div class="main_board_title">
						<div>
							<label><i class="fa-solid fa-chalkboard-user"></i></i> 커뮤니티</label>
						</div>
						<div>
							<a href="#">더보기 ></a>
						</div>

					</div>
					<div class="main_community_list">
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
					</div>
				</section>


			</div>
			<div class="main_right_column"">
				<section class="main_notice_board margin_bottom_32">
					<div class="main_board_title">
						<div>
							<label><i class="fa-solid fa-bolt"></i> 공지사항</label>
						</div>
						<div>
							<a href="#">더보기 ></a>
						</div>

					</div>
					<div class="main_notice_list">
						<article>
							<div class="board_list">
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>

											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>

											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>

											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>

											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>

											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
									</div>
								</div>
						</article>
					</div>
				</section>

				<section class="main_qna_board">
					<div class="main_board_title">
						<div>
							<label><i class="fa-solid fa-clipboard-question"></i> Q &
								A</label>
						</div>
						<div>
							<a href="#">더보기 ></a>
						</div>

					</div>

					<div class="main_qna_list">
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
						<article>
							<div class="board_list">
								<div class="topic">
									<a href="#">취업준비</a>
								</div>
								<div style="width: 100%;">

									<div class="main_user">
										<div style="flex: 1;">
											<div class="flex item_center">
												<div class="box">
													<img class="profile"
														src="${pageContext.request.contextPath }/resources/images/profile_logo.png">
												</div>
												<div class="nickname_area">주우여엉회애</div>
												<span class="mc">·</span>
												<div class="icon_area font_12">
													<i class="fa-solid fa-flask"></i>
												</div>
												<sapn class="hp_point">300</sapn>
											</div>
										</div>
										<div>
											<i class="fa-regular fa-eye font_12 icon_area"></i> <span
												class="view_count">300</span>
										</div>
									</div>


									<div class="main_title_box flex item_center">
										<div class="main_title">롤 5연승 가즈아아아아아앗~~~~~~~~~</div>
										<div class="like_comment_box">
											<i class="fa-regular fa-thumbs-up font_12 icon_area"></i> <span
												class="like_count">50</span> <i
												class="fa-regular fa-comment font_12 icon_area"></i> <span
												class="comment_count">300</span>
										</div>

									</div>
								</div>
						</article>
					</div>
				</section>
			</div>

		</div>

	</main>
	<c:import url="includes/footer.jsp"></c:import>
</body>
</html>
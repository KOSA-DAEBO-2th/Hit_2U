<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title></title>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css?after"
	rel="stylesheet">

</head>
<body>
	<%-- <c:import url="../includes/header.jsp"></c:import> --%>


	<main role="main">

		<div class="album py-5 bg-light">
			<div class="container">

				<div class="row">


					<c:forEach items="${ list }" var="board">

						<div class="col-md-3">
							<div class="card mb-4 shadow-sm">

								<a href="lecture_detail"
									style="text-decoration: none; color: black;"> <svg
										class="bd-placeholder-img card-img-top" width="100%"
										height="225" xmlns="http://www.w3.org/2000/svg"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img" aria-label="Placeholder: Thumbnail">
                  <title>${ board.b_title }</title>
                  <rect width="100%" height="100%" fill="#55595c"></rect>
                  <text x="50%" y="50%" fill="#eceeef" dy=".3em">
                    Thumbnail
                  </text>
                </svg>
									<div class="card-body">
										<p class="card-text">${ board.b_title }</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-outline-secondary">${ board.b_view }</button>
												<button type="button"
													class="btn btn-sm btn-outline-secondary">${ board.b_recommend }</button>
											</div>
											<small class="text-muted"> <fmt:formatDate
													value="${ board.b_write_date }" pattern="yy-MM-dd [H:mm]"
													type="date" />
											</small>
										</div>
									</div>
								</a>

							</div>
						</div>




						<!-- 						<div class="col-md-3">
							<div class="card mb-4 box-shadow">

								<a href="lecture_detail"
									style="text-decoration: none; color: black;"> <img
									class="card-img-top"
									src="https://archive.org/download/placeholder-image/placeholder-image.jpg"
									alt="Card image cap">
									<div class="card-body">
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-outline-secondary">View</button>
												<button type="button"
													class="btn btn-sm btn-outline-secondary">Edit</button>
											</div>
											<small class="text-muted">9 mins</small>
										</div>
									</div>

								</a>

							</div>
						</div> -->

					</c:forEach>




				</div>
			</div>
		</div>

	</main>





	<c:import url="../includes/footer.jsp"></c:import>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>


</body>
</html>
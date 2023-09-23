<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title></title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath }/resources/js/profile.js"
	defer="defer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style type="text/css">
	.breadcrumb-item {
		cursor: pointer;
	}
	
	#searchRes {
	    overflow: auto;
	}
	
	#searchRes::-webkit-scrollbar {
	    width: 5px; /*스크롤바의 너비*/
	}
	
	#searchRes::-webkit-scrollbar-thumb {
	    background-color: dimgray; /*스크롤바의 색상*/
	}
	
	#searchRes::-webkit-scrollbar-track {
	    background-color: lightgray; /*스크롤바 트랙 색상*/
	}
	
	table>thead {
		position: sticky;
		top:0;
	}
	
	td>span>p {
		overflow: hidden;
		text-overflow: ellipsis;
		whie-space: nowrap;
		max-height: 30px;
	}
	table {
		table-layout: fixed;
	}
</style>


</head>
<body>
	<c:import url="../includes/header.jsp"></c:import>

	<c:set var="image_url" value="${dto.image_url}"/>


	<main class='main_content'>
		<section style="background-color: #eee;">
			<div class="container py-5">

				<div class="row changeSection">
					<h2></h2>
					<div class="col-lg-4">
						<div class="card mb-4">
							<div class="card-body text-center">
								<c:choose>
									<c:when test="${image_url eq 'null'}">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
											alt="avatar" class="rounded-circle img-fluid"
											style="width: 150px;">
									</c:when>
									<c:when test="${image_url ne 'null'}">
										<img src="${image_url }" alt="avatar"
											class="rounded-circle img-fluid" style="width: 150px;">
									</c:when>
								</c:choose>
								<h5 class="my-3">
									${dto.member_id }
								</h5>
								<div class="d-flex justify-content-center mb-2">
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sendMsgModal" data-bs-whatever="@getbootstrap">쪽지</button>&nbsp;&nbsp;
									<button type="button" class="btn btn-danger"  data-bs-toggle="modal" data-bs-target="#reportModal">신고</button>
								</div>
							</div>
						</div>

						<div class="card mb-4 mb-lg-0">
							<div class="card-body p-0">
								<ul class="list-group list-group-flush rounded-3">
									<li
										class="list-group-item d-flex justify-content-between align-items-center p-3">
										<img
										src="https://i.namu.wiki/i/7p1FbLbH2WJz3CsYlZi5vahinYOhhiyjlyvLX910dc9M5lFVgSCwCUmb0PDBGS5ECzRiSZI7bpFzrKn00q3-Gw.webp"
										height="20">
										<p class="mb-0">${ dto.baekjoon }</p>
									</li>
									<li
										class="list-group-item d-flex justify-content-between align-items-center p-3">
										<i class="fab fa-github fa-lg" style="color: #333333;"></i>
										<p class="mb-0"><a href="${dto.git_link }" style="text-decoration: none; color: black;" target="_blank">${ dto.git_link }</a></p>
									</li>

								</ul>
							</div>
						</div>
					</div>


					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">계정 ID</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0 memId">${ dto.member_id }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">닉네임</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${ dto.nickname }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">이메일</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${ dto.email }</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">연락처</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${ dto.contact }</p>
									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4 mb-md-0">
									<div class="card-body">
										<p class="mb-4" style="text-align: center">
											작성한 게시글
										</p>
										<div class="table-responsive " id="searchRes" style="height: 200px;">
                    <table class="table mb-0" id="tableView">
                        <thead class="small text-uppercase bg-body text-muted">
                            <tr style="position: sticky; top: 0;">
                            	<!-- <th></th> -->
                                <th style="width: 30%;">제목</th>
                                <th style="width: 50%;">내용</th>
                                <th style="width: 20%;">날짜</th>
                            </tr>
                        </thead>
                        
                        
                        <tbody>
                        
                        	<c:forEach items="${ list }" var="list">                        
                            <tr class="align-middle" style="cursor: pointer;">
<%--                                 <td>
                                    <div class="d-flex align-items-center">
                                        <input type="checkbox" class="chk" name="chk" value="${ list.b_no }">
                                    </div>
                                </td> --%>
                                
                                <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${ list.b_title }<div style="display: none;">${list.b_no}</div><div style="display: none;">${list.cat_no }</div> </td>
                                <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-height: 48px;"> <span class="d-inline-block align-middle" style="max-height: 25px;">${ list.b_content }</span></td>
                                <td> <fmt:formatDate value="${ list.b_write_date }" pattern="yy-MM-dd" type="date"/> </td>
                            </tr>
                        	
                        	</c:forEach>

                        </tbody>
                    </table>
                </div>

									</div>
								</div>
							</div>
<%-- 							<div class="col-md-6">
								<div class="card mb-4 mb-md-0">
									<div class="card-body">
										<p class="mb-4" style="text-align: center">
											게시판 별 댓글 수
										</p>
										<div>
											<canvas id="reply"></canvas>
										</div>

									</div>
								</div>
							</div> --%>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<c:import url="../includes/footer.jsp"></c:import>
	
	
	
	
	
		<!-- Message Modal -->
<div class="modal fade" id="sendMsgModal" tabindex="-1" aria-labelledby="sendMsgModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="sendMsgModalLabel">쪽지 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">받는사람:</label>
            <input type="text" class="form-control" id="receive-id" value="${ dto.member_id }">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary btn_msg_submit">보내기</button>
      </div>
    </div>
  </div>
</div>




		<!-- Report Modal -->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reportLabel">신고하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">신고 대상:</label>
            <input type="text" class="form-control" value="${ dto.member_id }">
            <div id="report-id" style="display: none;">${ dto.member_no }</div>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">사유:</label>
            <textarea class="form-control" id="report-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary btn_report_submit">신고하기</button>
      </div>
    </div>
  </div>
</div>
	
<!-- 	<script type="text/javascript">
	$("#searchRes").listView("refresh");
	</script> -->



</body>
</html>
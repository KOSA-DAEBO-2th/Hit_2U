<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title></title>
<style type="text/css">
	table {
		table-layout: fixed;
	}
</style>
</head>
<body>

	<div class="col-lg-12">
		<!-- <div class="card mb-4"> -->

				<div class="row">
					<div class="col-12 mb-3 mb-lg-5">
						<div class="overflow-hidden card table-nowrap table-card">
							<div
								class="card-header d-flex justify-content-between align-items-center">
								<h5 class="mb-0">작성글</h5>
								<!-- <a href="#!" class="btn btn-danger btn-sm" onclick="del()">삭제</a> -->
							</div>
							<div class="table-responsive" id="tableView">
								<table class="table mb-0">
									<thead class="small text-uppercase bg-body text-muted">
										<tr>
											<th style="width: 10%;">게시판</th>
											<th style="width: 30%;">제목</th>
											<th style="width: 50%;">내용</th>
											<th style="width: 10%;">날짜</th>
										</tr>
									</thead>


									<tbody>

										<c:forEach items="${ list }" var="list">

											<tr class="align-middle" style="cursor: pointer;">
												<td>${ list.cat_name } <div style="display: none;">${list.b_no}</div><div style="display: none;">${list.cat_no }</div> </td>
												<td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${ list.b_title }
													
												</td>
												<td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
													<c:out value='${list.b_content.replaceAll("\\\<.*?\\\>","")}' />
												</td>
												<td ><fmt:formatDate value="${ list.b_write_date }" pattern="yy-MM-dd" type="date" /></td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				


			
			
			<!-- <div class="card-body"> -->

				<div class="row">
					<div class="col-12 mb-3 mb-lg-5">
						<div class="overflow-hidden card table-nowrap table-card">
							<div
								class="card-header d-flex justify-content-between align-items-center">
								<h5 class="mb-0">작성댓글</h5>
								<!-- <a href="#!" class="btn btn-danger btn-sm" onclick="del()">삭제</a> -->
							</div>
							<div class="table-responsive">
								<table class="table mb-0">
									<thead class="small text-uppercase bg-body text-muted">
										<tr>
											<th style="width: 10%;">게시판</th>
											<th style="width: 30%;">제목</th>
											<th style="width: 50%;">작성댓글</th>
											<th style="width: 10%;">작성날짜</th>
										</tr>
									</thead>


									<tbody>

										<c:forEach items="${ reply }" var="list">

											<tr class="align-middle">
												<td>${list.cat_name}</td>
												<td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.b_title}</td>
												<td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.r_content}</td>
												<td ><fmt:formatDate value="${ list.reply_date }" pattern="yy-MM-dd" type="date" /></td>
				
											</tr>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			<!-- </div> -->
			
			
		<!-- </div> -->
	</div>



</body>
</html>
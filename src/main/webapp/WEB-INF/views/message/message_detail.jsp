<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>  </title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" />
<style type="text/css">
	.form-control[readonly] {
		background-color: white;
	}
</style>
</head>
<body>
	
<main class='main_content'>

		<div class="row">
			<div class="col-12 mb-3 mb-lg-5">
				<div class="overflow-hidden card table-nowrap table-card">


					
					<!-- <p class="text-center"><h3>쪽지쓰기<h3></h2></p> -->
					<form action="message_send" method="post" style="margin: 20px;">
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-1 col-form-label" style="text-align: right;">보낸 사람</label>
							<div class="col-sm-11">
								<input type="text" class="form-control" id="m_receive" name="m_receive" placeholder="id 입력" value="${dto.m_send}" readonly="readonly" >
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-1 col-form-label"></label>
							<div class="col-sm-11">
								<textarea class="form-control" id="m_content" name="m_content" rows="12" placeholder="쪽지 내용" readonly>${dto.m_content }</textarea>
							</div>
						</div>

						<div class="form-group" style="float: right;">
							<button type="button" class="btn btn_write" onclick="m_send()" style="width: 100px;">답장</button>

						</div>

					</form>


				</div>
			</div>
		</div>




	</main>


</body>
</html>
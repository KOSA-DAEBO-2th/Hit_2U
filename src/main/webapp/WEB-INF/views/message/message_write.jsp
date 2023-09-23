<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"> -->
<link
	href="${pageContext.request.contextPath }/resources/css/message_write.css?after"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" />
<script type="text/javascript">
/* function m_send(){
	console.log("clickedddddd");
	var m_receive = document.getElementById('m_receive').value;
	console.log(m_receive);
	var m_content = document.getElementById('m_content').value;
	console.log(m_content);
	var message = { m_receive: m_receive, m_content: m_content}

	$.ajax({
		type: "POST",
		url: "/message_send",
		data: message,
		dataType: "json",
		success: function(){
			console.log("success");
			let url = `/message`;
			console.log(url);
			location.replace(url);
		}
	});  
} */

</script>


</head>
<body>
	<%-- <c:import url="../includes/header.jsp"></c:import> --%>



	<main class='main_content'>

		<div class="row">
			<div class="col-12 mb-3 mb-lg-5">
				<div class="overflow-hidden card table-nowrap table-card">


					
					<!-- <p class="text-center"><h3>쪽지쓰기<h3></h2></p> -->
					<form action="message_send" method="post" style="margin: 20px;">
						<div class="form-group row">
							<label for="staticEmail" class="col-sm-1 col-form-label" style="text-align: right;">받는사람</label>
							<div class="col-sm-11">
								<input type="text" class="form-control" id="m_receive" name="m_receive" placeholder="id 입력">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-1 col-form-label"></label>
							<div class="col-sm-11">
								<textarea class="form-control" id="m_content" name="m_content" rows="12" placeholder="쪽지 내용"></textarea>
							</div>
						</div>

						<div class="form-group" style="float: right;">
							<button type="button" class="btn btn_write" onclick="m_send()" style="width: 100px;">전송</button>

						</div>

					</form>


				</div>
			</div>
		</div>




	</main>



</body>
</html>
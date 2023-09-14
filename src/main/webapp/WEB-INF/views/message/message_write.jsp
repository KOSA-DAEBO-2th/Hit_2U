<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>  </title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/message_write.css?after" rel="stylesheet">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
	
	<div class=" bootdey">
<div class="email-app">

    <main>
        <p class="text-center">쪽지쓰기</p>
        <form action="message_send" method="post" >
            <div class="form-row mb-3">
                <label for="to" class="col-2 col-sm-1 col-form-label">받는</label>
                <div class="col-11 col-sm-11">
                    <input type="text" class="form-control" id="m_receive" name="m_receive" placeholder="id 입력">
                </div>
            </div>

        
        <div class="row">
            <div class="col-sm-11 ml-auto">
                
                <div class="form-group mt-4">
                    <textarea class="form-control" id="m_content" name="m_content" rows="12" placeholder="Click here to reply"></textarea>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-success" onclick="m_send()" >보내기</button>

                </div>
            </div>
        </div>
        </form>
    </main>
</div>
</div>
	

</body>
</html>
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


</head>
<body>
	<%-- <c:import url="../includes/header.jsp"></c:import> --%>
	
	<div class="container bootdey">
<div class="email-app">
<!--     <nav>
        <a href="#" class="btn btn-danger btn-block">쪽지쓰기</a>
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-inbox"></i> 받은쪽지함 <span class="badge badge-danger">4</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-star"></i> 보낸쪽지함</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-rocket"></i> Sent</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-trash-o"></i> Trash</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-bookmark"></i> Important</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-inbox"></i> Inbox <span class="badge badge-danger">4</span></a>
            </li>
        </ul>
    </nav> -->
    <main>
        <p class="text-center">쪽지쓰기</p>
        <form>
            <div class="form-row mb-3">
                <label for="to" class="col-2 col-sm-1 col-form-label">받는</label>
                <div class="col-11 col-sm-11">
                    <input type="text" class="form-control" id="to" placeholder="id 입력">
                </div>
            </div>

        </form>
        <div class="row">
            <div class="col-sm-11 ml-auto">
                
                <div class="form-group mt-4">
                    <textarea class="form-control" id="message" name="body" rows="12" placeholder="Click here to reply"></textarea>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success" onclick="m_send();">Send</button>
                    <button type="submit" class="btn btn-light">Draft</button>
                    <button type="submit" class="btn btn-danger">Discard</button>
                </div>
            </div>
        </div>
    </main>
</div>
</div>
	

</body>
</html>
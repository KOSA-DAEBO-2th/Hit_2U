<%-- <%@ include file="../includes/header.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>  </title>
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"> -->
 <link href="${pageContext.request.contextPath }/resources/css/message_write.css?after" rel="stylesheet"> 
<script src="${pageContext.request.contextPath }/resources/js/message.js" defer="defer"></script>

  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"> -->
  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/css/footer.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath }/resources/css/util.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
	
	<c:import url="../includes/header.jsp"></c:import>
	<!-- <div class="container bootdey"> -->
	
	<main class="main_content">
<div class="email-app">
    <nav>
        <a onclick="m_write();" class="btn btn-primary btn-blue" style="width: 100%;">쪽지쓰기</a>
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link " onclick="m_list();"><i class="fa fa-inbox"></i> 받은쪽지함<!--  <span class="badge badge-danger">4</span> --></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" onclick="m_sendList();"><i class="fa fa-rocket"></i> 보낸쪽지함</a>
            </li>

        </ul>
    </nav>
    
	<div class="main_area" style="width: 100%" >
		<c:import url="message_list.jsp"></c:import>
	</div>
    
</div>
<!-- </div> -->
	<c:import url="../includes/footer.jsp"></c:import>
</main>
</body>
</html>
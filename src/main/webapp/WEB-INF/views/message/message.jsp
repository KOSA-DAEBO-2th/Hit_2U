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
 <style type="text/css">
	.active{
		background-color: #e9ecef;
		color: gray;
	}

</style>
</head>
<body>
	
	<c:import url="../includes/header.jsp"></c:import>
	<!-- <div class="container bootdey"> -->
	
	<main class="main_content">
<div class="email-app">
    <nav>
        <a onclick="m_write();" class="btn btn-primary btn-blue" style="width: 100%; margin-bottom: 20px; margin-top: 10px;">쪽지쓰기</a>
        <ul class="nav">
            <li class="nav-item active">
                <a class="nav-link " id="m_list"><i class="fa fa-inbox"></i> 받은쪽지함<!--  <span class="badge badge-danger">4</span> --></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="m_sendList"><i class="fa fa-rocket"></i> 보낸쪽지함</a>
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




		<!-- Message Modal -->
<div class="modal fade" id="msgDetailModal" tabindex="-1" aria-labelledby="msgDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="msgDetailModalLabel">쪽지 보내기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <!--  <form> -->
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">받는사람:</label>
            <input type="text" class="form-control" id="receive-id" value="">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
     <!--    </form> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary btn_msg_submit">보내기</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>
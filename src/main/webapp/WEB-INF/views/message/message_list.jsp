<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>  </title>
<link href="${pageContext.request.contextPath }/resources/css/message_list.css?after" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" />

<style type="text/css">
	tr {
		height: 40px;
	}
	
	td {
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

		<!-- <div class=" bootdey"> -->
<!-- <div class="email-app"> -->
	<main class='main_content'>
		<!-- <div class="container"> -->
    <div class="row">
        <div class="col-12 mb-3 mb-lg-5">
            <div class="overflow-hidden card table-nowrap table-card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="mb-0">받은 쪽지</h3>
                    <a class="btn btn-danger " onclick="del()">삭제</a>
                </div>
                <div class="table-responsive">
                    <table class="table mb-0" id="tableView">
                        <thead class="small text-uppercase bg-body text-muted" id="listTable">
                            <tr>
                                <th style="width: 10%"><input type="checkbox"  id="cbx_chkAll" ></th>
                                <th style="width: 20%">보낸사람</th>
                                <th style="width: 50%">내용</th>
                                <th style="width: 20%">날짜</th>
                                <!-- <th class="text-end">Action</th> -->
                            </tr>
                        </thead>
                        
                        
                        <tbody>
                        
                        	<c:forEach items="${ list }" var="list">
                        
                            <tr class="align-middle" style="cursor: pointer;">     <!-- data-bs-toggle="modal" data-bs-target="#msgDetailModal"  -->
                                <td>
                                    <div class="d-flex align-items-center">

                                        <input type="checkbox" class="chk" name="chk" value="${ list.m_no }">
                                    </div>
                                </td>
                                <td>${ list.m_send }</td>
                                <td> <span class="d-inline-block align-middle">${ list.m_content }</span></td>
                                <td> <fmt:formatDate value="${ list.m_date }" pattern="yy-MM-dd [HH:mm]" type="date"/> </td>
 <!--                                <td class="text-end">
                                    <div class="drodown">
                                        <a data-bs-toggle="dropdown" href="#" class="btn p-1" aria-expanded="false">
                                  <i class="fa fa-bars" aria-hidden="true"></i>
                                </a>
                                        <div class="dropdown-menu dropdown-menu-end" style="">
                                            <a href="#!" class="dropdown-item">View Details</a>
                                            <a href="#!" class="dropdown-item">Delete user</a>
                                        </div>
                                    </div>
                                </td> -->
                            </tr>
                        	
                        	</c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <!-- </div> -->
</div>




	</main>
	<!-- </div> -->
	<!-- </div> -->


</body>
</html>
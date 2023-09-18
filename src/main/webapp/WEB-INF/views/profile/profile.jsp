<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>  </title>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath }/resources/js/profile.js" defer="defer"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <style type="text/css">
 .breadcrumb-item {
 	cursor: pointer;
 }
 </style>
</head>
<body>
	<c:import url="../includes/header.jsp"></c:import>
	
	<h2><a href="/logout">로그아웃</a></h2>
	<h2><a href="/chatting">채팅</a></h2>
	
	<main class='main_content'>
		<section style="background-color: #eee;">
  <div class="container py-5">
  
  	<div class="row">
      <div class="col">
        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item active"  onclick="profile()">사용자 정보</li>
            <li class="breadcrumb-item" onclick="writeList()"> 작성 글 </li>
            <li class="breadcrumb-item" onclick="meetingList()"><a href="#"> 모임 현황 </a></li>
            <li class="breadcrumb-item "><a href="#">수강 강의</a></li>
          </ol>
        </nav>
      </div>
    </div>
    <div class="row changeSection">
	<h2>마이페이지</h2>
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3">${ dto.nickname }</h5>
<!--             <p class="text-muted mb-1">Full Stack Developer</p>
            <p class="text-muted mb-4">Bay Area, San Francisco, CA</p> -->
            <div class="d-flex justify-content-center mb-2">
              <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1" onclick="location.href='profile_edit'">수정</button>
            </div>
          </div>
        </div>
        
        <div class="card mb-4 mb-lg-0">
          <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <img src="https://i.namu.wiki/i/7p1FbLbH2WJz3CsYlZi5vahinYOhhiyjlyvLX910dc9M5lFVgSCwCUmb0PDBGS5ECzRiSZI7bpFzrKn00q3-Gw.webp"  height="20">
                <p class="mb-0">${ dto.baekjoon }</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                <p class="mb-0">${ dto.git_link }</p>
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
                <p class="mb-0">ID</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"> ${ dto.member_id } </p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">NickName</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"> ${ dto.nickname } </p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"> ${ dto.email }</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">${ dto.contact }</p>
              </div>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="card mb-4 mb-md-0">
              <div class="card-body">
                <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> 게시판 별 게시글 수</p>
                <div>
  					<canvas id="board"></canvas>
				</div>
                
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card mb-4 mb-md-0">
              <div class="card-body">
              <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> 게시판 별 댓글 수</p>
				<div>
  					<canvas id="reply"></canvas>
				</div>
              
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	</main>
	<c:import url="../includes/footer.jsp"></c:import>

<script type="text/javascript">
	//chart
    $(document).ready(function() {

      var countW=[0,0,0,0];
      var countR=[0,0,0,0];

    	$.ajax({
    		type: "GET",
    		url: "profile_count",
    		contentType: 'application/json',
    		dataType: 'json',
    		async: false,
    		success: function(data, status){
    			console.log("success");
    			console.log(data);

    			console.log(data.cntW);
         
          for(i in data.cntW){
        	  console.log(data.cntW[i].cat_name);
            switch(data.cntW[i].cat_name){
              case "커뮤니티": countW[0] = data.cntW[i].count; break;
              case "QnA": countW[1] = data.cntW[i].count; break;
              case "모임": countW[2] = data.cntW[i].count; break;
              case "프리랜서": countW[3] = data.cntW[i].count; break;
              return countW;
            }
          }
          console.log(countW);
          for (i in data.cntR) {
            console.log(data.cntR[i].cat_name);
            switch (data.cntR[i].cat_name) {
              case "커뮤니티": countR[0] = data.cntR[i].count; break;
              case "QnA": countR[1] = data.cntR[i].count; break;
              case "모임": countR[2] = data.cntR[i].count; break;
              case "프리랜서": countR[3] = data.cntR[i].count; break;
                return countR;
            }
          }
          console.log(countR);

    		}
    	});  
    	
    	const board = document.getElementById('board');
    	new Chart(board, {
    	    type: 'doughnut',
    	    data: {
    	    	labels: [
    			    '커뮤니티',
    			    'QnA',
    			    '모임',
    			    '프리랜서'
    			  ],
    			  datasets: [{
    			    label: '게시글 개수',
    			    data: countW,
    			    backgroundColor: [
    			      'rgba(255, 99, 132, 1)',
    			      'rgba(54, 162, 235, 1)',
    			      'rgba(255, 206, 86, 1)',
    			      'rgba(75, 192, 192, 1)'
    			    ],
    			    hoverOffset: 4
    			  }]
    	    }
    	  });

    	  const ctx = document.getElementById('reply');
    	  new Chart(ctx, {
    	    type: 'doughnut',
    	    data: {
    	    	labels: [
    			    '커뮤니티',
    			    'QnA',
    			    '모임',
    			    '프리랜서'
    			  ],
    			  datasets: [{
    			    label: '댓글 개수',
    			    data: countR,
    			    backgroundColor: [
    			      'rgba(255, 99, 132, 1)',
    			      'rgba(54, 162, 235, 1)',
    			      'rgba(255, 206, 86, 1)',
    			      'rgba(75, 192, 192, 1)'
    			    ],
    			    hoverOffset: 4
    			  }]
    	    }
    	  });
    });



</script>

</body>
</html>
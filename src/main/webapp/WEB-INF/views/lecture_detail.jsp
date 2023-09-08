<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>  </title>
<link
	href="${pageContext.request.contextPath }/resources/css/lecture_detail.css?after"
	rel="stylesheet">
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css?after"
	rel="stylesheet">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	  <!-- Bootstrap cdn 설정 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
	<%-- <c:import url="includes/header.jsp"></c:import> --%>
<!-- 	
	<main class='main_content'>

			<section class="main_">
				<div class="main_info">
					<section class="image">
						<img alt="메인 이미지" src="" height="480" width="600px">
					</section>
					<nav class="info_tab">
						<div class="tab">
							<div class="service_info service">서비스 설명</div>
							<div class="service_price service">가격 정보</div>
							<div class="service_rating service">서비스 평가</div>
						</div>
					</nav>
					<section class="info_box">
						<div class="info">
							어쩌구저쩌구 서비스 정보~~~
						</div>
					</section>
				</div>
				<aside class="side_info">
					<section class="title">
						<h1>무슨무슨 강의이름</h1>
					</section>
					<section></section>
				</aside>
			</section>
		

	</main> 
	<c:import url="includes/footer.jsp"></c:import>-->
	

<div class="container">

    <div class="row">
    
    <!-- ============================================================================================================================================================ -->   
    
    <!-- ============================================================================================================================================================ -->
        
        <div class="col-md-7 mb30">
        
        	<div class="" style="border: 1px solid black; margin-bottom: 10px;">
						<img alt="사진--" src="https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg" >
			</div>
			
            <div class="card">
                <div>
					
					
                    <!-- Nav tabs -->
                    <ul class="nav tabs-admin" role="tablist">
                        <li role="presentation" class="nav-item"><a class="nav-link active" href="#t1" aria-controls="t1" role="tab" data-toggle="tab">서비스 설명</a></li>
                        <li role="presentation" class="nav-item"><a class="nav-link" href="#t2" aria-controls="t2" role="tab" data-toggle="tab">가격정보</a></li>
                        <li role="presentation" class="nav-item"><a class="nav-link" href="#t3" aria-controls="t3" role="tab" data-toggle="tab">서비스 평가</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content admin-tab-content pt30">
                        <div role="tabpanel" class="tab-pane active" id="t1">   <!-- class에 mshow 쓰면 계속 보임 -->
                            <ul class="activity-list list-unstyled">
                                <li class="clearfix">
                                    <div class="float-left">
                                        <a href="#"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="img-fluid rounded-circle"></a>
                                    </div>
                                    <div class="act-content">
                                        <div class="font400">

                                            <a href="#" class="font600">John Doe</a> Sent you a direct Image
                                        </div>
                                        <span class="text-small">11 Min Ago</span>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut.
                                        </p>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="img-fluid img-thumbnail">
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="float-left">
                                        <a href="#"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="img-fluid rounded-circle"></a>
                                    </div>
                                    <div class="act-content">
                                        <div class="font400">

                                            <a href="#" class="font600">Robin jackson</a> Started Following You
                                        </div>
                                        <span class="text-small">11 Min Ago, On <a href="#">Twitter</a></span>
                                        <p class="mb0">
                                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut.
                                        </p>
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="float-left">
                                        <a href="#"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="img-fluid rounded-circle"></a>
                                    </div>
                                    <div class="act-content">
                                        <div class="font400">

                                            <a href="#" class="font600">Pamela jackson</a> Sent you a private message
                                        </div>
                                        <span class="text-small">11 Min Ago, On <a href="#">Facebook</a></span>
                                        <p class="mb20">
                                            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                        </p>
                                        <a href="#" class="btn btn-sm btn-secondary">Reply</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="t2">
                            <ul class="activity-list list-unstyled">
                                <li class="clearfix">
                                    <div class="float-left">
                                        <a href="#"><i class="icon-palette"></i></a>
                                    </div>
                                    <div class="act-content">
                                        <div class="font400">

                                            <a href="#" class="font600">Admin Dashboard</a>

                                        </div>
                                        <span class="text-small">11 Min Ago</span>
                                        <div class="mb10">
                                            <span class="label label-default">Bootstrap4</span>
                                            <span class="label label-default">Angular4</span>
                                            <span class="label label-default">HTML5/CSS3</span>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                                        </p>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="float-left">
                                        <a href="#"><i class="icon-user"></i></a>
                                    </div>
                                    <div class="act-content">
                                        <div class="font400">

                                            <a href="#" class="font600">Assan Beauty Spa</a>

                                        </div>
                                        <span class="text-small">11 Min Ago</span>
                                        <div class="mb10">
                                            <span class="label label-default">Bootstrap4</span>
                                            <span class="label label-default">Angular4</span>
                                            <span class="label label-default">HTML5/CSS3</span>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                                        </p>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="float-left">
                                        <a href="#"><i class="icon-pencil"></i></a>
                                    </div>
                                    <div class="act-content">
                                        <div class="font400">

                                            <a href="#" class="font600">Admin Education Bootstraap4</a>

                                        </div>
                                        <span class="text-small">11 Min Ago</span>
                                        <div class="mb10">
                                            <span class="label label-default">Bootstrap4</span>
                                            <span class="label label-default">Angular4</span>
                                            <span class="label label-default">HTML5/CSS3</span>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                                        </p>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100" style="width: 5%"></div>
                                        </div>
                                    </div>
                                </li>
                                <li class="clearfix">
                                    <div class="float-left">
                                        <a href="#"><i class="icon-star"></i></a>
                                    </div>
                                    <div class="act-content">
                                        <div class="font400">

                                            <a href="#" class="font600">Assan Restaurant</a>

                                        </div>
                                        <span class="text-small">11 Min Ago</span>
                                        <div class="mb10">
                                            <span class="label label-default">Bootstrap4</span>
                                            <span class="label label-default">Angular4</span>
                                            <span class="label label-default">HTML5/CSS3</span>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                                        </p>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%"></div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="t3">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- ============================================================================================================================================================ -->
        
         <div class="col-md-5 mb30">
            <div class="card">

                <div class="card-content pt20 pb20 profile-header">
                    <h2 class="card-title text-center mb20">강의 이름---</h2>
                    <p>
                        강의 설명 짧게 어쩌구

                    </p>

                    <hr>
                    <div class="row">
                        <div class="col-md-4 mb20">
                            <h5>947</h5>
                            <h6 class="text-small text-muted">Followers</h6>
                        </div>
                        <div class="col-md-4 mb20">
                            <h5>583</h5>
                            <h6 class="text-small text-muted">Tweets</h6>
                        </div>
                        <div class="col-md-4 mb20">
                            <h5>48</h5>
                            <h6 class="text-small text-muted">Posts</h6>
                        </div>
                    </div>
                    <a href="#" class="btn btn-primary btn-rounded">Follow</a>
                    <hr>
                    <div class="skill-bar mb20 clearfix">

                        <span>HTML5 / CSS3</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%"></div>
                        </div>
                    </div>
                    <!--skill bar-->
                    <div class="skill-bar mb20 clearfix">

                        <span>Javascript</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 89%"></div>
                        </div>
                    </div>
                    <!--skill bar-->
                    <div class="skill-bar mb20 clearfix">

                        <span>Bootstrap</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 80%"></div>
                        </div>
                    </div>
                    <!--skill bar-->
                    <div class="skill-bar clearfix">

                        <span>Coffee</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 30%"></div>
                        </div>
                    </div>
                    <!--skill bar-->
                </div>
                <!--content-->

            </div>
        </div>
        
        
        <!-- ============================================================================================================================================================ -->
        
        
        
        
    </div>
</div>

	<c:import url="includes/footer.jsp"></c:import>

</body>
</html>
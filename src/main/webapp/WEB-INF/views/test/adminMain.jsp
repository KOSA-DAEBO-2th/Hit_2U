<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>  </title>

<!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/assets/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/assets/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/assets/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/assets/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/assets/perfect-scrollbar.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/assets/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath }/resources/js/assets/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath }/resources/js/assets/config.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/admin.js" defer="defer"></script>
    <script type="text/javascript">
	    $(document).ready(function () {
	        $("#cbx_chkAll").click(function () {
	            console.log("clicked");
	            if ($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
	            else $("input[name=chk]").prop("checked", false);
	        });
	
	        $("input[name=chk]").click(function () {
	            var total = $("input[name=chk]").length;
	            var checked = $("input[name=chk]:checked").length;
	
	            if (total != checked) $("#cbx_chkAll").prop("checked", false);
	            else $("#cbx_chkAll").prop("checked", true);
	        });
	    });
    </script>
    <style type="text/css">
            #searchRes {

                overflow: auto;
            }
 
            #searchRes::-webkit-scrollbar {
                width: 5px; /*스크롤바의 너비*/
            }
 
            #searchRes::-webkit-scrollbar-thumb {
                background-color: dimgray; /*스크롤바의 색상*/
            }
 
            #searchRes::-webkit-scrollbar-track {
                background-color: lightgray; /*스크롤바 트랙 색상*/
            }
            
            table>thead {
            	position: sticky;
            	top:0;
            }
            
            .my-swal {
            	z-index: 2000;
            }
 
        </style>
</head>
<body>

	
	
	    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
            	<select class="form-select" id="searchCat" onchange="changeCat()" aria-label="Default select example" style="width: 100px; margin-right: 10px;">
  					<option selected value="1">게시글</option>
  					<option value="2">회원</option>
  					<option value="3">신고</option>
				</select>
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>    <!-- ---------------------------------search icon-------------------- -->
                  <input name="search_key"
                    type="text"
                    class="form-control border-0 shadow-none searchKey"
                    placeholder="Search..."
                    aria-label="Search..."
                    onkeyup="search();"
                  />
                </div>
              </div>
              <!-- /Search -->



            </div>
          </nav>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
              
              
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      
                     <div class="row"  style="height: 500px;"  >
        <div class="col-12 mb-3 mb-lg-5"       >
            <!-- <div class="overflow-hidden card table-nowrap table-card"> -->
            	<div class="listDiv">
                <div class="card-header d-flex justify-content-between align-items-center table-card-header">
                    <h5 class="mb-0 divTitle">게시글</h5>
                    <a class="btn btn-danger btn-sm" onclick="del()" style="color: white;">삭제</a>
                </div>
                
                
                <div class="table-responsive" id="searchRes"  style="max-height: 400px; ">
                    <table class="table mb-0" id="printTable">
                        <thead class="small text-uppercase bg-body text-muted tableHead">
                            <tr>
                                <th class="fixedHeader" style="width:5%"></th>
                                <th class="fixedHeader" style="width:20%">게시판</th>
                                <th class="fixedHeader" style="width:55%">제목</th>
                                <th class="fixedHeader" style="width:20%">작성날짜</th>
                            </tr>
                        </thead>
                        
                        
                        <tbody class="tableResult">
                        	<c:forEach items="${ list }" var="list">
                        	
                            <tr class="align-middle">
                                <td>
                                    <div class="d-flex align-items-center">

                                        <input type="checkbox" class="chk" name="chk" value="${ list.b_no }">
                                    </div>
                                </td>
                                <td>${ list.cat_name } </td>
                                <td> <span class="d-inline-block align-middle">${ list.b_title }</span></td>
                                <td> <fmt:formatDate value="${ list.b_write_date }" pattern="yy-MM-dd" type="date"/> </td>
                            </tr>
                        	</c:forEach>

                        </tbody>
                    </table>
                </div>
                </div>
            <!-- </div> -->
        </div>
    <!-- </div> -->
</div>
                
                    </div>
                  </div>
                </div>
                
                
                
                
                
                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">게시글 수</h5>
                        <small class="text-muted">일주일 내 작성</small>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                          <h2 class="mb-2 cntBoard">           </h2>
                          <span>총 게시글 수</span>
                        </div>
                        <div id="cntWeekBoard"></div>
                      </div>
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary"
                              ><i class="bx bx-mobile-alt"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">커뮤니티</h6>
                              <small class="text-muted">자유게시판</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold comCnt">0</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">QnA</h6>
                              <small class="text-muted">코딩 질문 게시판</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold qnaCnt">0</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">모임</h6>
                              <small class="text-muted">스터디, 프로젝트 인원 모집</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold meetCnt">0</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-secondary"
                              ><i class="bx bx-football"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">마켓</h6>
                              <small class="text-muted">중고 물품 판매(IT관련)</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold marketCnt">0</small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                
                
                
              <!-- <div class="row"> -->
<!-- =========================================  ========================================================================================================================= -->
               <!-- Total Revenue -->
                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-0 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-12">
                        <h5 class="card-header m-0 me-2 pb-3">일일 가입자수</h5>
                        <div id="totalRevenueChart" class="px-2"></div>
                      </div>
                    </div>
                  </div>
                </div>
               
              
<!-- ================================================================================================================================================================== -->
                
                               
                <div class="col-md-6 col-lg-4 col-xl-4 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">댓글 수</h5>
                        <small class="text-muted">일주일 내 작성</small>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                          <h2 class="mb-2 cntReply">           </h2>
                          <span>총 댓글 수</span>
                        </div>
                        <div id="cntWeekReply"></div>
                      </div>
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary"
                              ><i class="bx bx-mobile-alt"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">커뮤니티</h6>
                              <small class="text-muted">자유게시판</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold comCntR">0</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">QnA</h6>
                              <small class="text-muted">코딩 질문 게시판</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold qnaCntR">0</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">모임</h6>
                              <small class="text-muted">스터디, 프로젝트 인원 모집</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold meetCntR">0</small>
                            </div>
                          </div>
                        </li>

                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-secondary"
                              ><i class="bx bx-football"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">마켓</h6>
                              <small class="text-muted">중고 물품 판매(IT관련)</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold marketCntR">0</small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>

             <!--  </div> -->
            </div>
            <!-- / Content -->

  

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
</div>

    <div class="buy-now">
      <a
        href="localhost:8080"
        target="_blank"
        class="btn btn-primary btn-buy-now"
        >Go to HOME</a
      >
    </div>
    
    
    		<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">권한 변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        회원 권한 변경하기 <text class="apply_position font_blue"></text><br>
      	<select class="form-select" id="role_change" aria-label="Default select example" style="width: 200px; margin-right: 10px;">
      		<option>ROLE_USER</option>
      		<option>ROLE_BLACK</option>
      		<option>ROLE_ADMIN</option>
      	</select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn_apply_cancle" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary btn_change_submit">변경</button>
      </div>
    </div>
  </div>
</div>
   
    
    

	  <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${pageContext.request.contextPath }/resources/js/assets/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/assets/popper.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/assets/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/assets/perfect-scrollbar.js"></script>

    <script src="${pageContext.request.contextPath }/resources/js/assets/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath }/resources/js/assets/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/resources/js/assets/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath }/resources/js/assets/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    

	<script type="text/javascript">
	$(document).ready(function () {
		$('searchCat').change(function(){
			var cat = $('#searchCat option:selected').val();
			if(cat == '1'){
				console.log("게시글");
				$('.boardDiv').show();
				search();
			} else if(cat == '2') {
				console.log("회원");
				$('.memberDiv').show();
				search();
			} else {
				$('.reportDiv').show();
			}

		});
	});
	

	</script>
</body>
</html>
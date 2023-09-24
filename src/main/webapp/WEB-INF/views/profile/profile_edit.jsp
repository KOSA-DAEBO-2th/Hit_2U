<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title></title>
<link
	href="${pageContext.request.contextPath }/resources/css/profile_edit.css?after"
	rel="stylesheet">
</head>
<body>
	<c:import url="../includes/header.jsp"></c:import>
		<c:set var="image_url" value="${dto.image_url}"/>
	<main class='main_content'>
		<div class="container-xl px-4 mt-4">
			<!-- Account page navigation-->
		 <nav class="nav nav-borders" style="margin-left: 30px;">
				<a class="nav-link active ms-0"
					href="/profile">Profile</a>	<!-- <a class="nav-link"
					href="https://www.bootdey.com/snippets/view/bs5-profile-billing-page"
					target="__blank">Billing</a> <a class="nav-link"
					href="https://www.bootdey.com/snippets/view/bs5-profile-security-page"
					target="__blank">Security</a> <a class="nav-link"
					href="https://www.bootdey.com/snippets/view/bs5-edit-notifications-page"
					target="__blank">Notifications</a> -->
			</nav> 
			<hr class="mt-0 mb-4">
			<div class="row">
				<div class="col-xl-4">
					<!-- Profile picture card-->
					<div class="card mb-4 mb-xl-0">
						<div class="card-header">프로필 사진</div>
						<form id="imageUpload" action="/test/image" method="POST"
							enctype="multipart/form-data">
							<div class="card-body text-center">
								<!-- Profile picture image-->
								<c:choose>
									<c:when test="${empty image_url}">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
											alt="avatar" class="rounded-circle img-fluid"
											style="width: 150px;">
									</c:when>
									<c:when test="${not empty image_url}">
										<img src="${image_url}" alt="avatar"
											class="rounded-circle img-fluid" style="width: 150px;">
									</c:when>
								</c:choose>
								<!-- Profile picture help block-->
								<div class="small font-italic text-muted mb-4">JPG or PNG
									no larger than 5 MB</div>
								<!-- Profile picture upload button-->
								<input type="file" id="imageInput" name="image"
									style="visibility: hidden;" accept="image/*">
								<div><button class="btn btn-primary" type="button" style="width: 120px;"
									id="imageUploadBtn" onclick="imageUpload()">이미지 불러오기</button>
								<button class="btn btn-primary" type="button" style="width: 120px; display: none;"
									id="imageChangeBtn" onclick="imageChange()">프로필 변경하기</button></div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-xl-8">
					<!-- Account details card-->
					<div class="card mb-4">
						<div class="card-header">계정 정보</div>
						<div class="card-body">
							<form>
								<!-- Form Group (username)-->
								<div class="mb-3">
									<label class="small mb-1" for="inputID">계정 ID(변경 불가) </label> <input
										class="form-control" id="inputID" type="text"
										placeholder="Enter your username" value="${ dto.member_id }"
										style="background-color: #E2E2E2;" readonly>
								</div>
								<!-- Form Group (nickName)-->
								<div class="mb-3">
									<label class="small mb-1" for="inputNickname">닉네임</label>
									<input class="form-control" id="inputNickname" type="text"
										placeholder="Enter your username" value="${ dto.nickname }">
								</div>
								<!-- Form Row        -->
								<div class="row gx-3 mb-3">
									<!-- Form Group (location)-->
									<div class="col-md-6">
										<label class="small mb-1" for="inputEmail">이메일</label> <input
											class="form-control" id="inputEmail" type="email"
											placeholder="Enter your email" value="${ dto.email }">
									</div>
									<!-- Form Group (organization name)-->
									<div class="col-md-6">
										<label class="small mb-1" for="inputContact">연락처</label> <input
											class="form-control" id="inputContact" type="text"
											placeholder="Enter your phone number"
											value="${ dto.contact }">
									</div>
								</div>
								<!-- Form Row-->
								<div class="row gx-3 mb-3">
									<!-- Form Group (phone number)-->
									<div class="col-md-6">
										<label class="small mb-1" for="inputGitLink">깃허브</label>
										<input class="form-control" id="inputGitLink" type="tel"
											placeholder="github link" value="${ dto.git_link }">
									</div>
									<!-- Form Group (birthday)-->
									<div class="col-md-6">
										<label class="small mb-1" for="inputBaekjoon">백준</label>
										<input class="form-control" id="inputBaekjoon" type="text"
											name="birthday" placeholder="baekjoon link"
											value="${ dto.baekjoon }">
									</div>
								</div>
								<!-- Save changes button-->
								<button class="btn btn-primary" type="button" style="width: 120px;"
									onclick="updateInfo()">변경 내용 적용</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<c:import url="../includes/footer.jsp"></c:import>
	
	<script type="text/javascript">
		function imageUpload() {
			let myInput = document.getElementById("imageInput");
			myInput.click();
			var imageUploadBtn = document.getElementById('imageUploadBtn');
			var imageChangeBtn = document.getElementById('imageChangeBtn');
			imageUploadBtn.style.display = 'none';
			imageChangeBtn.style.display = 'inline-block';
		}

		function imageChange() {
			document.getElementById("imageUpload").submit();
			Swal.fire({
                icon: 'success',
                title: '변경되었습니다',
                showConfirmButton: false,
                timer: 1000
            });
			//setTimeout(()=> location.href = "profile", 1100);
		}

		function updateInfo() {
			console.log("update clicked");

			var data = {};
			data.member_id = document.getElementById('inputID').value;
			data.nickname = document.getElementById('inputNickname').value;
			data.email = document.getElementById('inputEmail').value;
			data.contact = document.getElementById('inputContact').value;
			data.git_link = document.getElementById('inputGitLink').value;
			data.baekjoon = document.getElementById('inputBaekjoon').value;

			$.ajax({
				type : "POST",
				url : "/profile_update",
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(data) {
					console.log("success");
					Swal.fire({
		                icon: 'success',
		                title: '변경되었습니다',
		                showConfirmButton: false,
		                timer: 1000
		            });
					setTimeout(()=> location.href = "profile", 1100);

				}
			});

		}
	</script>

</body>
</html>
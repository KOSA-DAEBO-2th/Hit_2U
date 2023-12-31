<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg"
	href="${pageContext.request.contextPath }/resources/images/maple.jpg" />
<title></title>
<link href="${pageContext.request.contextPath }/resources/css/reset.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css?after"
	rel="stylesheet" />
<!-- 부트스트랩 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Jquery -->

<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/header.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/footer.css"
	rel="stylesheet" />

<link href="${pageContext.request.contextPath }/resources/css/util.css"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/d7766e5822.js"
	crossorigin="anonymous"></script>
<script async
	src="${pageContext.request.contextPath}/resources/js/header.js"
	type="text/javascript" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

        <link href="${pageContext.request.contextPath }/resources/css/util.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/d7766e5822.js" crossorigin="anonymous"></script>
        <script
            async
            src="${pageContext.request.contextPath}/resources/js/header.js"
            type="text/javascript"
            defer
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>
    <body>
        <header class="header">
            <div class="header_left">
                <a href="/"
                    ><img src="${pageContext.request.contextPath}/resources/images/logo.png" width="180" height="48px"
                /></a>
            </div>
            <nav class="nav header_center flex">
                <div class="nav_link">
                    <a href="/community" id="community">커뮤니티</a>
                </div>
                <div class="nav_link">
                    <a href="/qna" id="qna">Q & A</a>
                </div>
                <div class="nav_link">
                    <a href="/meeting" id="meeting">모임</a>
                </div>
                <div class="nav_link">
                    <a href="/lecture" id="lecture">프리랜서</a>
                </div>
                <div class="nav_link">
                    <a href="/market" id="market">HIT 마켓</a>
                </div>
                <div class="nav_link">
                    <a href="/chat/chatting">채팅</a>
                </div>
            </nav>
            <div class="header_right">
            <sec:authorize access="isAnonymous()">
                <div style="flex-shrink: 0; width: 180px;">
                    <button class="btn btn-primary btn-ghost btn-open" onclick="location.href='/member/login'">로그인</button>
                    <button class="btn btn-primary btn-jelly btn-blue" onclick="location.href='/member/signup'">
                        회원가입
                    </button>
                </div>
                </sec:authorize>
                 <sec:authorize access="isAuthenticated()">
                <div style="flex-shrink: 0; font-size: 18px;">
                	<sec:authentication property="principal.nickname"/>님 
                	<i class="fa-solid fa-user" onclick="location.href='/profile'" style="margin-left:5px; margin-right:5px; cursor:pointer;"></i>
                	<i class="fa-regular fa-envelope"  onclick="location.href='/message'" style="margin-left:5px; margin-right:10px; cursor:pointer;"></i>
                	<i class="fa-solid fa-right-from-bracket" onclick="location.href='/logout'" style="cursor:pointer;"></i>
                </div>
                </sec:authorize>
            </div>
            
        </header>
    </body>
</html>


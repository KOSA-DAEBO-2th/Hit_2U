<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
	<h2>임시 관리자 페이지입니다.</h2>
	
	<p>principal:<sec:authentication property="principal"/></p>
	<p>아이디:<sec:authentication property="principal.member_id"/></p>
	<p>authlist:<sec:authentication property="principal.authList"/></p>
	<p>권한:<sec:authentication property="principal.authority"/></p>
	
	<h2><a href="/logout">로그아웃</a></h2>
	
</body>

</body>
</html>
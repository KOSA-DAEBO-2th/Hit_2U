<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
	<form action="/test/upload"  method="post" enctype="multipart/form-data">
	작성자 : <input type="text"  name="user"> <br>
	제   목 : <input type="text"  name="title"> <br>
	파일명 : <input type="file"  name="file"> <br><br>
		   <input type="submit"  value="파일 올리기"> <br>
	</form>
</body>

</body>
</html>
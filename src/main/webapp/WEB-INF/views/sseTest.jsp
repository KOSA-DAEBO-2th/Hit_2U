<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  </title>
<script type="text/javascript">
	const eventSource = new EventSource("/see")
	eventSource.onmessage = event => {
		const p = document.createElement("p")
		p.innerText = event.data
		document.getElementById("message").appendChild(p)
	}
</script>
</head>
<body>

<div id="message"></div>

</body>
</html>
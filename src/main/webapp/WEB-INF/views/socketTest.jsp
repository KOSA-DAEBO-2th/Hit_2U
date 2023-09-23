<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<title>  </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/chatting.css?after" rel="stylesheet">
<script async src="${pageContext.request.contextPath}/resources/js/chat.js" type="text/javascript" defer></script>

<script type="text/javascript">
	
	var nickname;
	$(function(){
		var aaa = document.getElementById('getNickname');
		console.log("aaa"+aaa);
		var bbb = aaa.innerHTML;
		nickname = $("#getNickname").text();
		console.log("nickname: " + bbb);
		console.log("----"+nickname);
		  
		});

</script>


</head>
<body>
	<h1>Socket Test Page</h1>
	<input type="text" id="testInput">
	<button type="button" id="btn">전송</button>

	<main class='main_content'>
		<h1>채팅방</h1>
        <button class="new_chat">새 채팅방 만들기</button>
        <nav>
        	<span>방 제목</span>
        	<span>인원</span>
        </nav>
       	<hr>
       	
        <ul>
            <li>
            <!-- 
				<span class="chat_title"></span>
				<span class="chat_count"></span>
				 -->
            </li> 
        </ul>
	</main>
	
	
	 <div class="chat">
   		<div>
   		<%-- <div id="getNickname" ><sec:authentication property="principal.nickname"/></div> --%>
   			<div class="chat_body" >
		        <h2 class="chat_title">1번방</h2>		
		        <button class="chat_back">◀</button>
		
		        <ul class="chat_list">
		            <li>
		            	<!-- <div class="notification">
		            		<span></span>
		            	</div> -->
		            </li>
		        </ul>
	
		        <div class="chat_input">
		            <div class="chat_input_area">
		                <textarea id="textInput"></textarea>
		            </div>
		            
		            <div class="chat_button_area">
		                <button id="sendBtn">전송</button>
		            </div>
		        </div>
	        </div>
        
	        <div class="chat_users">
	        	<h2>
	        		참가인원
	        		<span class="user"></span>
	        	</h2>
	        	
	        	<div class="chat_nickname">
	        		<ul>
	        			<li>
	       				</li>
	        		</ul>
	        	</div>
	        </div>	
   		</div>
    </div>
	
	

</body>

</html>

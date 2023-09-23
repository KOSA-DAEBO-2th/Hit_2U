<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<title> 채팅 </title>
 <link href="${pageContext.request.contextPath }/resources/css/chat.css?after" rel="stylesheet">
<%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> --%>
      <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <link href="${pageContext.request.contextPath }/resources/css/chatting.css?after" rel="stylesheet">
<script async src="${pageContext.request.contextPath}/resources/js/chatReal.js" type="text/javascript" defer></script>


</head>
<body>
<c:import url="./includes/header.jsp"></c:import>
<%-- <div id="getNickname" ><sec:authentication property="principal.nickname"/></div> --%>
<div class="chat_window">
    <div class="top_menu">
        <div class="buttons">
            <div class="button close"></div>
            <div class="button minimize"></div>
            <div class="button maximize"></div>
        </div>
        <div class="title">Chat</div>
    </div>
    <ul class="messages"></ul>
    <div class="bottom_wrapper clearfix">
        <div class="message_input_wrapper">
            <input type="text" class="message_input" id="textInput" placeholder="Type your message here..." > 
        </div>
        <div class="send_message" id="sendBtn">
            <div class="icon"></div>
            <div class="text" id="sendBtn">전송</div>
            <!-- <button class="text" id="sendBtn">전송</button> -->
        </div>
    </div>
</div>
<div class="message_template">
    <li class="message">
        <div class="avatar"></div>
        <div class="text_wrapper">
            <div class="text"></div>
        </div>
    </li>
</div>
	
</body>
</html>
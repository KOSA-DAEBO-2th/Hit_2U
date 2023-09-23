package kr.co.hit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/chat/chatting")
	public String chatting() {
		return "chatting";
	}
	
	//ui 바꾼거--------------
	@RequestMapping("/uichatting")
	public String chat() {
		return "socketTest";
	}

}

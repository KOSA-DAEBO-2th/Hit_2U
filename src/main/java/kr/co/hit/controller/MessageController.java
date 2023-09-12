package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hit.dto.MessageDto;
import kr.co.hit.service.MessageService;

@Controller
@RequestMapping("/")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/message")
	public String message() {
		return "message/message";
	}
	
	@RequestMapping("/m_test")
	public String messageTest() {
		return "message/m_test";
	}
	
	@RequestMapping("/message_list")
	public String message(Model model) {
		List<MessageDto> list = messageService.selectMessageList();
		model.addAttribute("list", list);
		return "message/message_list";
	}
	
	
	@RequestMapping("/message_write")
	public String receive(Model model) {
//		List<BoardDto> list = lectureService.selectLectureList();
//		model.addAttribute("list", list);
		return "message/message_write";
	}
	
	@RequestMapping("/message_send")
	public String message_send() {
		
		return "message/message_list";
	}

}

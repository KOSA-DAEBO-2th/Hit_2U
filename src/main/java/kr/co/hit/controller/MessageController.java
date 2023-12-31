package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MessageDto;
import kr.co.hit.security.User;
import kr.co.hit.service.MessageService;

@Controller
@RequestMapping("/")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/message")
	public String message(Model model) {
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<MessageDto> list = messageService.selectMessageList(user.getMember_id());
		model.addAttribute("list", list);
		return "message/message";
	}
	
	@RequestMapping("/m_test")
	public String messageTest() {
		return "message/m_test";
	}
	
	@RequestMapping("/message_list")
	public String message_list(Model model) {
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<MessageDto> list = messageService.selectMessageList(user.getMember_id());
		model.addAttribute("list", list);
		return "message/message_list";
	}
	
	@RequestMapping("/message_slist")
	public String sendMessage(Model model) {
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<MessageDto> list = messageService.selectSendList(user.getMember_id());
		model.addAttribute("list", list);
		return "message/message_sendList";
	}
	
	
	@RequestMapping("/message_write")
	public String receive(Model model) {
//		List<BoardDto> list = lectureService.selectLectureList();
//		model.addAttribute("list", list);
		return "message/message_write";
	}
	
	@RequestMapping("/message/{m_no}")
	public String message_detail(@PathVariable int m_no, Model model) {
		MessageDto dto = messageService.detailMessage(m_no);
		model.addAttribute("dto", dto);
		return "message/message_detail";
	}
	

	

}

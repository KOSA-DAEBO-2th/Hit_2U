package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/message_slist")
	public String sendMessage(Model model) {
		List<MessageDto> list = messageService.selectSendList();
		model.addAttribute("list", list);
		return "message/message_sendList";
	}
	
	
	@RequestMapping("/message_write")
	public String receive(Model model) {
//		List<BoardDto> list = lectureService.selectLectureList();
//		model.addAttribute("list", list);
		return "message/message_write";
	}
	
	//@PostMapping("/message_send")
//	@RequestMapping("message_send")
//	public String message_send(@RequestBody MessageDto dto) {
//		messageService.sendMessage(dto);
//		return "redirect:message";
//	}
	
//	@ResponseBody
//	@PostMapping("/message_send")
//	public ModelAndView message_send(@RequestParam("m_receive") String m_receive, @RequestParam("m_content") String m_content ) {
//		MessageDto dto = new MessageDto();
//		dto.setM_receive(m_receive);
//		dto.setM_content(m_content);
//		messageService.sendMessage(dto);
//		ModelAndView mav = new ModelAndView("message/message");
//		return mav;
//	}
	
	@RequestMapping("/message_del")
	public String message_del(Model model) {
		List<MessageDto> list = messageService.selectMessageList();
		model.addAttribute("list", list);
		return "message/message_list";
	}
	

}

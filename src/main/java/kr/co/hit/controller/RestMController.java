package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MessageDto;
import kr.co.hit.service.MessageService;

@RestController
@RequestMapping("/")
public class RestMController {

	@Autowired
	private MessageService messageService;
	
	@ResponseBody
	@PostMapping("/message_send")
	public ModelAndView message_send(@RequestBody MessageDto dto ) {
		System.out.println(dto);
//		MessageDto dto = new MessageDto();
//		dto.setM_receive(m_receive);
//		dto.setM_content(m_content);
		messageService.sendMessage(dto);
		ModelAndView mav = new ModelAndView("message/message");
		return mav;
	}
	
}

package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.dto.MessageDto;
import kr.co.hit.service.MailService;
import kr.co.hit.service.MessageService;
import kr.co.hit.service.ProfileService;

@RestController
@RequestMapping("/")
public class RestMController {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	MailService mailService;
	
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
	
	@ResponseBody
	@PostMapping("/member/confirm")
	public String mailConfirm(@RequestBody MemberDto dto) throws Exception{
		System.out.println(dto);
		System.out.println("d여기까지---");
		String code = mailService.sendSimpleMessage(dto.getEmail());
		System.out.println("사용자에게 발송한 인증코드==> "+ code);
		return code;
	}
	
	@ResponseBody
	@PostMapping("/profile_update")
	public ModelAndView updateProfile(@RequestBody MemberDto dto) {
		System.out.println("update controller");
		profileService.updateInfo(dto);
		ModelAndView mav = new ModelAndView("profile/profile");
		return mav;
	}
	
}

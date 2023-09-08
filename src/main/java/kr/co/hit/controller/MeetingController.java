package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.service.JoinService;

@RestController
public class MeetingController {

	@GetMapping(value = "/meeting")
	public ModelAndView meeting() {
		ModelAndView mv = new ModelAndView("meeting");

		return mv;
	}
	
	@GetMapping(value="/meeting/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {
		ModelAndView mv = new ModelAndView("/meeting_read");
		
	
		mv.addObject("test1", 1);
		mv.addObject("test2", "안녕성호");
		
		return mv;
	}
}

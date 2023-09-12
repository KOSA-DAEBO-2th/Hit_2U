package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MeetDto;
import kr.co.hit.service.MeetingService;

@Controller("meeting")
public class MeetingController {
	
	@Autowired
	MeetingService meetingService;
	
	@GetMapping(value="/write")
	public String writeForm() throws Exception {
		return "meeting_write";
	}
	
	@PostMapping(value="/write")
	public void write(@RequestBody MeetDto dto) throws Exception {
		
		System.out.println("안뇽");
		meetingService.insert(dto);
	}
	
	@GetMapping(value="/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {
		ModelAndView mv = new ModelAndView("meeting_read");
		
	
		mv.addObject("test1", 1);
		mv.addObject("test2", "안녕성호");
		
		return mv;
	}
	


}

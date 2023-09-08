package kr.co.hit.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.service.ProfileService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "main";
	}

	@RequestMapping("/community")
	public String community() {

		return "community";
	}

	@RequestMapping("/meeting")
	public String meeting() {

		return "meeting";
	}
	

	@RequestMapping("/meeting_t")
	public String meeting_t() {

		return "meeting_t";
	}

	@RequestMapping("/community/communityWrite")
	public String communityWrite() {

		return "communityWrite";
	}
	
	
	@RequestMapping("/qna")
	public String qna() {
		
		return "qna";
		
	}


	@RequestMapping("/lecture")
	public String lecture() {
		return "lecture";
	}

	@RequestMapping("/lecture_write")
	public String lecture_write() {
		return "lecture_write";
	}

	@RequestMapping("/lecture_detail")
	public String lecture_detail() {
		return "lecture_detail";
	}

	@RequestMapping("/profile")
	public String profile(Model model) {
		System.out.println("profile----");
		MemberDto dto = profileService.getUserInfo();
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "profile";
	}

}

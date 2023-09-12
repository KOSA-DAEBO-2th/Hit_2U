package kr.co.hit.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hit.dto.BoardDto;
import kr.co.hit.dto.MemberDto;
import kr.co.hit.service.LectureBoardService;
import kr.co.hit.service.ProfileService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

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

	@RequestMapping("/community/communityWrite")
	public String communityWrite() {

		return "communityWrite";
	}

	@RequestMapping("/qna")
	public String qna() {

		return "qna";

	}

}

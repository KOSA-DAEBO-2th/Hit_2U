package kr.co.hit.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
<<<<<<< Updated upstream
	@RequestMapping("/meeting_t")
	public String meeting_t() {

		return "meeting_t";
	}
=======
	@RequestMapping("/community/communityWrite")
	public String communityWrite() {

		return "communityWrite";
	}
	
	
	@RequestMapping("/qna")
	public String qna() {
		
		return "qna";
		
	}
	
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream

=======
		
>>>>>>> Stashed changes
}

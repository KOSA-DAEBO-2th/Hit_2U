package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hit.dto.CommunityDto;
import kr.co.hit.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@RequestMapping("/community")
	public String community(Model model) {
		List<CommunityDto> list = communityService.CommunityList();
		model.addAttribute("list", list);
		return "community";
	}

	@RequestMapping("/community/community_write")
	public String community_write() {

		return "community_write";
	}

	@RequestMapping("/community/community_detail")
	public String community_detail() {

		return "community_detail";
	}

	@RequestMapping("/community/profile")
	public String profile() {

		return "profile";
	}

	@RequestMapping("/qna")
	public String qna() {

		return "qna";

	}
}

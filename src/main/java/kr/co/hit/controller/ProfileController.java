package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.service.JoinService;
import kr.co.hit.service.ProfileService;

@Controller
@RequestMapping("/")
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping("/profile")
	public String profile(Model model) {
//		System.out.println("profile----");
		MemberDto dto = profileService.getUserInfo();
//		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "profile/profile";
	}
	
	@RequestMapping("/profile_edit")
	public String profile_edit(Model model) {
		MemberDto dto = profileService.getUserInfo();
		model.addAttribute("dto", dto);
		return "profile/profile_edit";
	}
	
	
}

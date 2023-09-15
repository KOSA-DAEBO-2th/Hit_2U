package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.security.User;
import kr.co.hit.service.JoinService;
import kr.co.hit.service.ProfileService;

@Controller
@RequestMapping("/")
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping("/profile")
	public String profile(Model model) {
		System.out.println("-------------profile");
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("============="+user);
		String id = user.getMember_id();
		//model.addAttribute("id", id);
//		System.out.println("profile----");
		MemberDto dto = profileService.getUserInfo(id);
//		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "profile/profile";
	}
	
	@RequestMapping("/profile_edit")
	public String profile_edit(Model model) {
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberDto dto = profileService.getUserInfo(user.getMember_id());
		model.addAttribute("dto", dto);
		return "profile/profile_edit";
	}
	
//	@RequestMapping("/profile_update")
//	public String updateProfile() {
//		
//		return "";
//	}
	
	
}

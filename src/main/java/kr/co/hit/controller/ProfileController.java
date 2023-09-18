package kr.co.hit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MeetingDto;
import kr.co.hit.dto.MemberDto;
import kr.co.hit.dto.MessageDto;
import kr.co.hit.dto.ProfileDto;
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
//		List<ProfileDto> cntW = profileService.getCountWrite(id);
//		List<ProfileDto> cntR = profileService.getCountReply(id);
		model.addAttribute("dto", dto);
//		model.addAttribute("cntW", cntW);
//		model.addAttribute("cntR", cntR);
//		
//		System.out.println("cntW: "+cntW);
//		System.out.println("cntR: "+cntR);
		
		return "profile/profile";
	}
	
	@RequestMapping("/profile_edit")
	public String profile_edit(Model model) {
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberDto dto = profileService.getUserInfo(user.getMember_id());
		model.addAttribute("dto", dto);
		return "profile/profile_edit";
	}
	
	@RequestMapping("/profile_writeList")
	public String getList(Model model) {
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("id: "+user.getMember_id());
		String id = user.getMember_id();
		List<ProfileDto> list = profileService.getWriteList(id);
		System.out.println("====================================================");
		System.out.println(list);
		System.out.println("====================================================");
		List<ProfileDto> reply = profileService.getReplyList(id);
		model.addAttribute("list", list);
		model.addAttribute("reply", reply);
		return "profile/writeList";
	}
	
	@RequestMapping("/profile_main")
	public String profile() {
		
		return "profile/profile_main";
	}
	
	@RequestMapping("/profile_meetingList")
	public ModelAndView meetingList() {
		ModelAndView mav = new ModelAndView("profile/meetingList");
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<MeetingDto> list = profileService.getMeetingList(user.getMember_id());
		System.out.println(user.getMember_id());
		mav.addObject("list", list);
		
		List<MeetingDto> apply = profileService.applyMeetingList(user.getMember_id());
//		System.out.println("====================================================================");
//		System.out.println(apply);
//		System.out.println("====================================================================");
		mav.addObject("apply", apply);
		return mav;
	}
	
	
}

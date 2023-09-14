package kr.co.hit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

	// community write page
	@RequestMapping("/community/community_write_form")
	public String community_write_form() {

		return "community_write_form";
	}
	
	// community_write
	@RequestMapping("/community/community_write")
	public String community_write(CommunityDto dto) {

		communityService.InsertCommunity(dto);

		return "redirect:/community";
	}

	// community detail
	@RequestMapping("/community/community_detail")
	public String community_detail(int b_no, Model model) {
		
		CommunityDto dto = communityService.getCommunityDetail(b_no);
		model.addAttribute("dto", dto);
		System.out.println(dto+"   detail");
		
		return "community_detail";
	}
	
	// update form
	@RequestMapping("/community/community_update_form")
	public String updateform(int b_no, Model model) {

		CommunityDto dto = communityService.getCommunityDetail(b_no);
		model.addAttribute("dto", dto);
		System.out.println(dto+"   community_update_form");

		return "community_update_form";

	}	
	
	@RequestMapping("/community_update")
	public String update(CommunityDto dto ) {
		int result = communityService.updateCommunity(dto);
		String res = "redirect:/community"; // 리다이렉트 URL를 재지정. 주소가 바뀜
		if (result == 0)
			res = "fail";
		return res;

	}	
	
	
	

//	@RequestMapping("/community/profile")
//	public String profile() {
//
//		return "profile";
//	}
//
//	@RequestMapping("/qna")
//	public String qna() {
//
//		return "qna";
//
//	}
}

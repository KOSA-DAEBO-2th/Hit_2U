package kr.co.hit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hit.dto.AdminDto;
import kr.co.hit.dto.BoardDto;
import kr.co.hit.dto.MemberDto;
import kr.co.hit.service.AdminService;

@Controller
@RequestMapping("/")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/adminMain")
	public String mainAdmin(Model model) {
//		int cntBoard = adminService.cntWeekBoard();
//		int cntReply = adminService.cntWeekReply();
//		model.addAttribute("cntBoard", cntBoard);
//		model.addAttribute("cntReply", cntReply);
		List<AdminDto> list = adminService.searchBoard("");
		model.addAttribute("list", list);
		return "/test/adminMain";
	}
	
	@ResponseBody
	@PostMapping(value = "/adminSearch")//, method = {RequestMethod.POST})
	public List<AdminDto> adminSearch(@RequestBody AdminDto dto, Model model) {
		//System.out.println("key: "+search_key+"     cat:  "+cat+" ==================");
		System.out.println(dto);
		System.out.println(dto.getCat());
		
		if(dto.getCat().equals("1")) {
			System.out.println("게시판---");
			List<AdminDto> list = adminService.searchBoard(dto.getSearch_key());
			model.addAttribute("list", list);
			return list;
		}
		else {
			List<AdminDto> list = adminService.searchMember(dto.getSearch_key());
			model.addAttribute("list", list);
			return list;
		}
		
	}
	
	
//	@RequestMapping("/message")
//	public String message(Model model) {
//		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		List<MessageDto> list = messageService.selectMessageList(user.getMember_id());
//		model.addAttribute("list", list);
//		return "message/message";
//	}
	
}

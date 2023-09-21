package kr.co.hit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.AdminDto;
import kr.co.hit.dto.MemberDto;
import kr.co.hit.dto.MessageDto;
import kr.co.hit.dto.ProfileDto;
import kr.co.hit.security.User;
import kr.co.hit.service.AdminService;
import kr.co.hit.service.MailService;
import kr.co.hit.service.MessageService;
import kr.co.hit.service.ProfileService;

@RestController
@RequestMapping("/")
public class RestMController {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	private AdminService adminService;
	
	@ResponseBody
	@PostMapping("/message_send")
	public ModelAndView message_send(@RequestBody MessageDto dto ) {
		System.out.println(dto);
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setM_send(user.getMember_id());
		messageService.sendMessage(dto);
		ModelAndView mav = new ModelAndView("message/message");
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/member/confirm")
	public String mailConfirm(@RequestBody MemberDto dto) throws Exception{
		System.out.println(dto);
		System.out.println("d여기까지---");
		String code = mailService.sendSimpleMessage(dto.getEmail());
		System.out.println("사용자에게 발송한 인증코드==> "+ code);
		return code;
	}
	
	@ResponseBody
	@PostMapping("/profile_update")
	public ModelAndView updateProfile(@RequestBody MemberDto dto) {
		System.out.println("update controller");
		profileService.updateInfo(dto);
		ModelAndView mav = new ModelAndView("profile/profile");
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/profile_count")
	public HashMap<String, List<ProfileDto>> countWrite() {
		System.out.println("count값 전송--");
		User user =  (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<ProfileDto> cntW = profileService.getCountWrite(user.getMember_id());
		List<ProfileDto> cntR = profileService.getCountReply(user.getMember_id());
		HashMap<String, List<ProfileDto>> map = new HashMap<String, List<ProfileDto>>();
		map.put("cntW", cntW);
		map.put("cntR", cntR);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/message_del")
	public int message_del(@RequestBody List<Integer> checkArr) {   //@RequestBody List<MessageDto> checkArr
		System.out.println("========controller============");
		for(int i=0; i<checkArr.size(); i++) {
			System.out.println(checkArr.get(i));
		}
		int result = messageService.deleteMessage(checkArr);
		return result;
	}
	
	
	@ResponseBody
	@GetMapping("/week_count")
	public HashMap<String, List<AdminDto>> countWeek(Model model) {
		System.out.println("count값 전송--");
		List<AdminDto> cntW = adminService.cntWeekBoard();
		List<AdminDto> cntR = adminService.cntWeekReply();
		HashMap<String, List<AdminDto>> map = new HashMap<String, List<AdminDto>>();
		map.put("cntW", cntW);
		map.put("cntR", cntR);
//		model.addAttribute("cntBoard", cntW.get(4).getCntWeek());
//		model.addAttribute("cntReply", cntR.get(4).getReplyWeek());
		return map;
	}

	
	@ResponseBody
	@PostMapping("/admin_del")
	public void admin_del_mem(@RequestBody List<Integer> checkArr) {  
		int size = checkArr.size();
		System.out.println("========delete admin============");
		for(int i=0; i<size; i++) {
			System.out.println(checkArr.get(i));
		}
		int cat = checkArr.get(size-1);
		checkArr.remove(size-1);
		if(cat == 1) {
			adminService.delBoard(checkArr);
		}
		else adminService.delMember(checkArr);
	}
	
	@ResponseBody
	@GetMapping("/join_count")
	public List<AdminDto> memberChart(){
		List<AdminDto> list = adminService.memberChart();
		return list;
	}
	
	@GetMapping("/reportList")
	public List<AdminDto> reportList(){
		List<AdminDto> list = adminService.reportList();
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		return list;
	}
	
	@ResponseBody
	@PostMapping("/roleChange")
	public int changeRole( @RequestBody AdminDto dto) {  //@RequestBody Map<String, String> map
		int result = adminService.changeRole(dto);
		return result;
	}
	
}

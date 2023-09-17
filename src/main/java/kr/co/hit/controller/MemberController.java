package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.service.JoinService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private JoinService joinService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
	
		return "member/login";
	}
	
	@RequestMapping("/signup")
	public String signup() {
	
		return "member/signup";
	}
	
	@PostMapping("/signok")
	public String signok(MemberDto dto) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword()));
		int result =0;
		result = joinService.insertMember(dto);
		if(result>0) System.out.println("회원가입 성공");
		
		return "member/login";
	}
	
//	@PostMapping("/loginok")
//	public String loginok(MemberDto dto) {
//		System.out.println("로그인 체크");
//		System.out.println(dto.getMember_id());
//		System.out.println(dto.getNickname());
//		System.out.println(dto.getPassword());
//		System.out.println(dto.getAuthority());
//		System.out.println(dto.getEmail());
//		System.out.println("세션 체크");
//		return "/main";
//	}
}

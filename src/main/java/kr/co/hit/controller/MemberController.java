package kr.co.hit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.dto.NaverLoginDto;
import kr.co.hit.security.NaverLogin;
import kr.co.hit.security.User;
import kr.co.hit.service.JoinService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private JoinService joinService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Inject
	private NaverLoginDto naver;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		
		NaverLogin naverLogin = new NaverLogin(naver);
		model.addAttribute("naver_url",naverLogin.getNaverAuthURL());
		System.out.println(naverLogin.getNaverAuthURL());
		return "/member/login";
	}
	
	@RequestMapping(value = "/login/oauth2/code/naver", method = RequestMethod.POST)
	public String naverLoginCallback(Model model, @RequestParam String code, HttpSession session) throws Exception {
		NaverLogin naverLogin = new NaverLogin(naver);
		User naverUser = naverLogin.getUserProfile(code);
		System.out.println("profile"+naverUser);
		model.addAttribute("result", naverUser);
		return "loginResult";
	}
	
	@RequestMapping("/signup")
	public String signup() {
	
		return "member/signup";
	}
	
	@ResponseBody
	@RequestMapping(value= "/checkId", method = RequestMethod.POST)
    public int checkId(MemberDto dto) {
		int result =0;
        int flag = joinService.checkId(dto.getMember_id());
        if(flag == 1) result =1; 
        //아이디가 있을시 Y 없을시 N 으로jsp view 로 보냄
       System.out.println(result);
        return result;
    }
 
	
	@PostMapping("/signok")
	public String signok(MemberDto dto) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword()));
		int result =0;
		result = joinService.insertMember(dto);
		if(result>0) System.out.println("회원가입 성공");
		
		return "member/login";
	}
}

package kr.co.hit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.security.CustomUserDetailService;
import kr.co.hit.security.NaverLogin;
import kr.co.hit.service.JoinService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private CustomUserDetailService cusd;
	// 이메일 인증-
	@Autowired
	private JavaMailSender mailSender;
	// 네이버
	@Autowired
	private NaverLogin naverlogin;
	private String apiResult = null;

	@Autowired
	private JoinService joinService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("/login")
	public void login(Model model, HttpSession session) {
		String naverUrl = naverlogin.getAuthorizationUrl(session);
        model.addAttribute("naverUrl",naverUrl);
	}
	
	@RequestMapping(value = "/login/oauth2/code/naver", method = { RequestMethod.GET, RequestMethod.POST })
	public String callBack(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = naverlogin.getAccessToken(session, code, state);

		// 로그인 사용자 정보 읽어오기
		// String형식의 json데이터
		apiResult = naverlogin.getUserProfile(oauthToken);

		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 2. String 형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3.데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// 네이버에서 주는 고유 ID
		String naver_id = (String) response_obj.get("id");
		// 네이버에서 설정된 사용자 이름
		String naverNickname = (String) response_obj.get("nickname");
		// 네이버에서 설정된 이메일
		String naverEmail = (String) response_obj.get("email");

		// 네이버 같은경우 진짜ID+@ 형식이기 때문에 문자열 잘라서 id값을 추출하는 작업을 펼친다.
		String target = "@";
		int target_num = naverEmail.indexOf(target);
		// 네이버 진짜 ID
		String newId = (String) naverEmail.substring(0, target_num);

		MemberDto member = new MemberDto();
		member.setMember_id(newId); // 아이디
		member.setNickname(naverNickname); // 닉네임
		member.setEmail(naverEmail); // 이메일
		member.setNaver_id(naver_id); // 네이버 고유id번호
		// 네이버로 연동된 회원정보 찾기 =>[가입된 이메일] 또는 [네이버 고유번호id]를 조회하여 비교
		MemberDto naverIdChk = joinService.naverChk(naver_id);

		// 1.쌩판 홈페이지에 연동된 정보가 없는경우=>등록된 네이버 이메일x,네이버고유번호idx , 회원 가입절차 시작
		if (naverIdChk == null) {
			session.setAttribute("user", member);
			System.out.println("네이버 회원가입 전달정보"+member);
			return "/member/Nsignup";
		} else {
			// 가입된 상태에서 네이버아이디=웹사이트아이디 인지, 혹은 다른아이디인지(네이버 고유번호로 id찾음)
			// 시큐리티의 파라미터로 id값을 결정해서 로그인처리를 한다.
			String id = joinService.naverChk(naver_id).getMember_id() == null ? newId
					: joinService.naverChk(naver_id).getMember_id();
			UserDetails navervo = (UserDetails) cusd.loadUserByUsername(id);
			Authentication authentication = new UsernamePasswordAuthenticationToken(navervo, navervo.getPassword(),
					navervo.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			session = request.getSession(true);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			return "redirect:/";
		}
	}

	@RequestMapping("/signup")
	public String signup(Model model, HttpSession session) {

		return "/member/signup";
	}

	@ResponseBody
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public int checkId(MemberDto dto) {
		int result = 0;
		int flag = joinService.checkId(dto.getMember_id());
		if (flag == 1)
			result = 1;
		// 아이디가 있을시 Y 없을시 N 으로jsp view 로 보냄
		System.out.println(result);
		return result;
	}

	@PostMapping("/signok")
	public String signok(MemberDto dto) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword()));
		int result = 0;
		result = joinService.insertMember(dto);
		if (result > 0)
			System.out.println("회원가입 성공");

		return "/member/login";
	}

	@PostMapping("/Nsignok")
	public String Nsignok(MemberDto dto) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword()));
		int result = 0;
		result = joinService.insertNMember(dto);
		if (result > 0)
			System.out.println("회원가입 성공");
		
		return "redirect:/member/login";
	}
}

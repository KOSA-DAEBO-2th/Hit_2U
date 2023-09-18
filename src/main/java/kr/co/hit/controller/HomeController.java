package kr.co.hit.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.hit.security.NaverLogin;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
    private NaverLogin naverlogin;
	private String apiResult = null;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "main";
	}
}
//	@RequestMapping(value = "/login/oauth2/code/naver", method = RequestMethod.GET)
//	 public String callBack(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws Exception{
//        OAuth2AccessToken oauthToken;
//        oauthToken = naverlogin.getAccessToken(session, code, state);
//        
//        //로그인 사용자 정보 읽어오기 
//        // String형식의 json데이터
//        apiResult = naverlogin.getUserProfile(oauthToken);
//        
//        /**
//         * apiResult json 구조 {"resultcode":"00", "message":"success",
//         * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
//         **/
//        
//        //2. String 형식인 apiResult를 json형태로 바꿈 
//        JSONParser parser = new JSONParser();
//        Object obj = parser.parse(apiResult);
//        JSONObject jsonObj = (JSONObject)obj;
//        
//        //3.데이터 파싱
//        // Top레벨 단계 _response 파싱
//        JSONObject response_obj = (JSONObject)jsonObj.get("response");
//
//        // 네이버에서 주는 고유 ID
//        String naverId = (String) response_obj.get("id");
//        // 네이버에서 설정된 사용자 이름
//        String naverNickname = (String) response_obj.get("nickname");
//        // 네이버에서 설정된 이메일
//        String naverEmail = (String) response_obj.get("email");
//        
//        //네이버 같은경우 진짜ID+@ 형식이기 때문에 문자열 잘라서 id값을 추출하는 작업을 펼친다.
//        String target ="@";
//        int target_num = naverEmail.indexOf(target);
//        //네이버 진짜 ID
//        String newId=(String) naverEmail.substring(0,target_num);
//        System.out.println(newId);
//        
//        MemberVO member = new MemberVO();
//        member.setUserid(newId); //아이디
//        member.setUsername(naverNickname); //닉네임
//        member.setUseremail(naverEmail); //이메일
//        member.setNaverLogin(naverId); //네이버 고유id번호
//        
//        
//        //네이버로 연동된 회원정보 찾기 =>[가입된 이메일] 또는 [네이버 고유번호id]를 조회하여 비교
//        MemberDto naverIdChk = service.naverChk(member);
//    
//        //1.쌩판 홈페이지에 연동된 정보가 없는경우=>등록된 네이버 이메일x,네이버고유번호idx , 회원 가입절차 시작
//        if (naverIdChk == null) {
//                session.setAttribute("user", member);
//                return "member/customRegister";
//        //2.가입된 이메일은 있으나 네이버와의 연동이 안된경우        
//        }else if(naverIdChk.getNaverLogin() == null && naverIdChk.getUseremail() !=null) {
//                //2-1 가입된 계정에 네이버 연동 진행
//                service.updateN(member);
//                //2-2 연동 끝났으면 자동 로그인
//                //네이버 고유id번호를 가진 계정의 id값을 추출하여 자동로그인 설정
//                String id=service.naverChk(member).getUserid();
//                UserDetails navervo = (UserDetails)cusd.loadUserByUsername(id);
//                System.out.println(id);
//                Authentication authentication = new UsernamePasswordAuthenticationToken(navervo, navervo.getPassword(),
//                        navervo.getAuthorities());
//                SecurityContext securityContext = SecurityContextHolder.getContext();
//                securityContext.setAuthentication(authentication);
//                session = request.getSession(true);
//                session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
//                return "redirect:/board/list";
//
//        //3.둘다 아니라면 네이버로 가입 된 상태임. 네이버 로그인시 바로 로그인됨
//        }else {
//                //가입된 상태에서 네이버아이디=웹사이트아이디 인지, 혹은 다른아이디인지(네이버 고유번호로 id찾음)
//                //시큐리티의 파라미터로 id값을 결정해서 로그인처리를 한다.
//                String id=service.naverChk(member).getUserid()==null?newId:service.naverChk(member).getUserid();
//                UserDetails navervo = (UserDetails)cusd.loadUserByUsername(id);
//                System.out.println(newId);
//                Authentication authentication = new UsernamePasswordAuthenticationToken(navervo, navervo.getPassword(),
//                        navervo.getAuthorities());
//                SecurityContext securityContext = SecurityContextHolder.getContext();
//                securityContext.setAuthentication(authentication);
//                session = request.getSession(true);
//                session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
//                return "redirect:/board/list";
//        }
//
//}

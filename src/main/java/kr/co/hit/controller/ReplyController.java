package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hit.dao.MemberDao;
import kr.co.hit.dto.MemberDto;
import kr.co.hit.dto.ReplyDto;
import kr.co.hit.security.User;
import kr.co.hit.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@Autowired
	private MemberDao memberDao;

	@PostMapping("/community/{b_no}/replies")
	@ResponseBody
	public ReplyDto addComment(@PathVariable("b_no") int bNo, @RequestParam("r_content") String content,
			ReplyDto reply) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		if (principal instanceof String && ((String) principal).equals("anonymousUser")) {

		}

		// 로그인 후 글 작성 페이지 넘어갈수 있음
		User user = (User) principal;
		
		String userId = user.getMember_id(); // 'User' 클래스에 'getUsername()' 메소드가 있다고 가정합니다.

		MemberDto member = memberDao.getMember(userId);

		reply.setB_no(bNo);
		reply.setR_content(content);
		reply.setNickname(member.getNickname());

		replyService.addReply(reply);
		replyService.updateBreply(bNo);
		System.out.println(reply);
		return reply;
	}

}
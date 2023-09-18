package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hit.dto.ReplyDto;
import kr.co.hit.service.ReplyService;


@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;

//	@RequestMapping("/community/{b_no}/replies")
//	public String getReplies(@PathVariable("b_no") int bNo, Model model) {
//		List<ReplyDto> replies = replyService.getReplies(bNo);
//		model.addAttribute("replies", replies);
//
//		return "community_detail";
//	}


	@PostMapping("/community/{b_no}/replies")
	@ResponseBody
	public ResponseEntity<ReplyDto> addComment(@PathVariable("b_no") int bNo,
	                         @RequestParam("r_content") String content,
	                         @RequestParam("nickname") String nickname) {

	    ReplyDto reply = new ReplyDto();
	    reply.setB_no(bNo);
	    reply.setR_content(content);
	    reply.setNickname(nickname);

	    replyService.addReply(reply);

	    return ResponseEntity.ok(reply);
	}
	
//	@PostMapping("/community/{b_no}/replies/ajax")
//	@ResponseBody
//	public ResponseEntity<ReplyDto> addCommentAjax(@PathVariable("b_no") int bNo,
//	                                               @RequestParam("r_content") String content,
//	                                               @RequestParam("nickname") String nickname) {
//	    ReplyDto reply = new ReplyDto();
//	    reply.setBoard_no(bNo);
//	    reply.setR_content(content);
//	    reply.setNickname(nickname);
//
//	    replyService.addReply(reply);
//
//	    return ResponseEntity.ok(reply); 
//	}

}
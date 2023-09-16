package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hit.dto.ReplyDto;
import kr.co.hit.service.ReplyService;

@Controller
@RequestMapping("")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@GetMapping("")
	public String list(@PathVariable("board_no") int board_no, Model model) {
		List<ReplyDto> replies = replyService.getReplies(board_no);
		model.addAttribute("replies", replies);

		return "postDetail";

	}
	
	@PostMapping("")
	public String create(@PathVariable("board_no") int board_no, @ModelAttribute("reply") ReplyDto reply, 
			RedirectAttributes redirectAttributes) {
		
		reply.setBoard_no(board_no);
		
		replyService.saveReply(reply);
		
		redirectAttributes.addFlashAttribute("message", "Comment added successfully.");
		
		
		return "redirect:/community/"+board_no;
		
		
		
	}
	
	
	
	
	
	

}





















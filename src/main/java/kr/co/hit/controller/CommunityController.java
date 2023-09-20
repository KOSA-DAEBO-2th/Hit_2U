package kr.co.hit.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hit.dto.CommunityDto;
import kr.co.hit.dto.ReplyDto;
import kr.co.hit.security.User;
import kr.co.hit.service.CommunityService;
import kr.co.hit.service.ReplyService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	@Autowired
	private ReplyService replyService;

	@RequestMapping("/community")
	public String community(HttpServletRequest request, CommunityDto dto) {

		int pg = 1;
		String strPg = request.getParameter("pg");

		if (strPg != null) {
			pg = Integer.parseInt(strPg);

		}

		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = communityService.getCommunityCount(); // 총 게시물 수

		System.out.println("시작번호: " + start + ", 끝번호: " + end + ", 전체: " + total);
		
		// 페이지수
		int allPage = (int) Math.ceil(total / (double) rowSize); 

		System.out.println("전체 페이지수:" + allPage);

		int block = 10; // 한페이지에 보여줄 범위
		int formPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝

		if (toPage > allPage) { // 20 > 17
			toPage = allPage;
		}

		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<CommunityDto> list = communityService.CommunityList(map);

		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("allPage", allPage);
		request.setAttribute("formPage", formPage);
		request.setAttribute("toPage", toPage);
		request.setAttribute("block", block);

		return "community"; // community.jsp
		

	}

	// community write page
	@RequestMapping("/community/community_write_form")
	public String community_write_form(CommunityDto dto) {

		// 로그인 후 글 작성 페이지 넘어갈수 있음
//		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		dto.setMember_no(user.getMember_no());
//
//		return "community_write_form";
		
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

	    // 로그인하지 않은 경우, 로그인 페이지로 리다이렉트
	    if (principal instanceof String && ((String) principal).equals("anonymousUser")) {
	        return "redirect:/member/login";
	    }

	    // 로그인 후 글 작성 페이지 넘어갈수 있음
	    User user = (User) principal;
	    dto.setMember_no(user.getMember_no());

	    return "community_write_form";
	}

	// 이거 작동 안되면 위에거 주석 풀어서 사용하면됨
	@RequestMapping("/community/community_write")
	public String community_write(CommunityDto dto, @RequestParam("topic") String topic) {

		// 로그인후 글 작성
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setMember_no(user.getMember_no());

		dto.setTopic_name(topic); // 사용자가 선택한 토픽 설정
		communityService.InsertCommunity(dto);
		return "redirect:/community";
	}

	// community detail
	@RequestMapping("/community/community_detail")
	public String community_detail(int b_no, Model model) {

		// 상세보기 클릭시 조회수 증가
		communityService.updateView(b_no);

		// 상세보기
		CommunityDto dto = communityService.getCommunityDetail(b_no);
		model.addAttribute("dto", dto);
		System.out.println(dto + "   detail");

		// 본문 아래 댓글 리스트 가져오기
		List<ReplyDto> replies = replyService.getReplies(b_no);
		model.addAttribute("replies", replies);
		
		System.out.println("~~~~~community_detail~~~~~~");
		System.out.println("dto: "+ dto);
		System.out.println("replies " + replies);
		
		

		return "community_detail";
	}

	// update form
	@RequestMapping("/community/community_update_form")
	public String updateform(int b_no, Model model) {

		CommunityDto dto = communityService.getCommunityDetail(b_no);
		model.addAttribute("dto", dto);
		System.out.println(dto + "   community_update_form");

		return "community_update_form";
	}

	@RequestMapping("/community_update")
	public String update(CommunityDto dto) {
		int result = communityService.updateCommunity(dto);
		String res = "redirect:/community"; // 리다이렉트 URL를 재지정. 주소가 바뀜
		if (result == 0)
			res = "fail";
		return res;
	}

	@RequestMapping(value = "/community_delete/{dto.b_no}", method = RequestMethod.GET)
	public String delete(@PathVariable("dto.b_no") int b_no) {
		System.out.println(b_no + " 오니?");
		communityService.deleteCommunity(b_no);

		System.out.println(b_no + " 지워졌니?");
		return "redirect:/community";

	}

	@RequestMapping("/category")
	public String category(@RequestParam("topic_no") int topicNo,
			@RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest request, Model model) {

		int postsPerPage = 10;
		int startPost = (page - 1) * postsPerPage + 1;
		int endPost = startPost + postsPerPage - 1;

		HashMap<String, Object> map = new HashMap<>();
		map.put("start", startPost);
		map.put("end", endPost);
		map.put("topicNo", topicNo);

		List<CommunityDto> list = communityService.getPostsByTopic(map);

		int totalPosts = communityService.getPostCountByTopic(topicNo); // 주제별 총 게시글 개수 조회
		int totalPages = totalPosts / postsPerPage;
		if (totalPosts % postsPerPage != 0) {
			totalPages++;
		}

		// 여기에 페이지 그룹 관련 코드 추가
		int startPageGroup = (page - 1) / 10 * 10 + 1;
		int endPageGroup = Math.min(startPageGroup + 9, totalPages); // 마지막 페이지 그룹이 범위를 초과하지 않도록 조정

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPageGroup", startPageGroup);
		model.addAttribute("endPageGroup", endPageGroup);

		model.addAttribute("list", list);

		return "category";
	}

	@RequestMapping("/community/search")
	public String search(@RequestParam("title") String title, Model model) {
	    List<CommunityDto> list = communityService.searchByTitle(title);
	    model.addAttribute("list", list);
	    return "community";
	}

	
//	@RequestMapping("/qna")
//	public String qna() {
//
//		return "qna";
//
//	}
}

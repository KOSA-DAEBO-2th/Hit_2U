package kr.co.hit.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.hit.dto.CommunityDto;
import kr.co.hit.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// 밑에 페이징 처리 포함하는 커뮤니티 컨트롤러 진행중 작동 안될시에 밑에 삭제하고 위에 주석 풀어서 사용하면됨
	@RequestMapping("/community")
	public String community(HttpServletRequest request) {

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

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수

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
	public String community_write_form() {

		return "community_write_form";
	}

	// community_write
	@RequestMapping("/community/community_write")
	public String community_write(CommunityDto dto) {

		communityService.InsertCommunity(dto);

		return "redirect:/community";
	}

	// community detail
	@RequestMapping("/community/community_detail")
	public String community_detail(int b_no, Model model) {
		
		communityService.updateView(b_no);

		CommunityDto dto = communityService.getCommunityDetail(b_no);
//		CommunityDto dto1 = communityService.getCommunityDetail(b_view);
		model.addAttribute("dto", dto);
//		model.addAttribute("dto1", dto1);
		
		
		System.out.println(b_no +" b_no 있냐");
//		System.out.println(b_view+" b_view 있냐");
		
		
		System.out.println(dto + "   detail");

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
	
	@RequestMapping(value="/community_delete/{dto.b_no}", method = RequestMethod.GET)
	public String delete(@PathVariable("dto.b_no") int b_no    )
	{
		System.out.println(b_no+" 오니?");
//		communityService.deleteCommunity(Integer.parseInt(b_no));
		communityService.deleteCommunity(b_no);

		System.out.println(b_no+" 지워졌니?");
		return "redirect:/community";
		
	}	
	
	

//	@RequestMapping("/community/profile")
//	public String profile() {
//
//		return "profile";
//	}
//
//	@RequestMapping("/qna")
//	public String qna() {
//
//		return "qna";
//
//	}
}

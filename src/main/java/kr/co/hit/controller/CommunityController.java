package kr.co.hit.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.CommunityDto;
import kr.co.hit.dto.CommunitySearchDto;
import kr.co.hit.dto.FileDto;
import kr.co.hit.security.User;
import kr.co.hit.service.CommunityService;
import kr.co.hit.service.FileService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	FileService fileService;

	@GetMapping()
	public ModelAndView community(String topic_option) {

		ModelAndView mv = new ModelAndView("community/community");
		List<CommunityDto> list = communityService.selectCommunityList();
		int limit = 10;
		int listcount = communityService.selectCommunityListCount();
		int maxPage = ((listcount - 1) / limit) + 1;
		
		mv.addObject("maxPage", maxPage);
		mv.addObject("list", list);
		mv.addObject("page_init", 1);
		return mv;

	}
	
	@GetMapping("/search")
	public ModelAndView communitySearch(CommunitySearchDto dto) {
		
		ModelAndView mv = new ModelAndView("community/community");
		
		int limit = 10;
		dto.setPage_limit(limit);
		int start = (dto.getPage() - 1) * limit;
		dto.setPage_start(start);
		int listcount = communityService.searchCommunityListCount(dto);
		int maxPage = ((listcount - 1) / limit) + 1;
		
		
		List<CommunityDto> list = communityService.searchCommunityList(dto);
		
		
		mv.addObject("list", list);
		mv.addObject("search_option", dto);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
	@GetMapping("/search/{topic}")
	public ModelAndView communitytotal(@PathVariable("topic") String topic, CommunitySearchDto dto) {
		
		ModelAndView mv = new ModelAndView("community/community");
		if(dto.getPage() <= 0) {
			dto.setPage(1);
		}
		
		if(topic.equals("free")) {
			dto.setTopic_name("자유");
		}else if(topic.equals("komin")) {
			dto.setTopic_name("고민");
		}else if(topic.equals("health")) {
			dto.setTopic_name("운동");
		}else if(topic.equals("anonymous")) {
			dto.setTopic_name("익명");
		}else {
			dto.setTopic_name("");
		}

			
		int limit = 10;
		dto.setPage_limit(limit);
		int start = (dto.getPage() - 1) * limit;
		dto.setPage_start(start);
		int listcount = communityService.searchCommunityListCount(dto);
		int maxPage = ((listcount - 1) / limit) + 1;
		if(dto.getPage() > maxPage) {
			dto.setPage(maxPage);
		}
		
		List<CommunityDto> list = communityService.searchCommunityList(dto);
		
		mv.addObject("list", list);
		mv.addObject("search_option", dto);
		mv.addObject("currunt_topic", topic);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
	
	
	@GetMapping("/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("community/community_detail");
		communityService.increaseView(boardIdx);
		CommunityDto list = communityService.selectCommunityDetail(boardIdx);
		List<CommunityDto> img_list = communityService.searchCommunityImgList(boardIdx);
		
		List<CommunityDto> reply_list = communityService.selectReplyList(boardIdx);
		mv.addObject("list", list);
		mv.addObject("img_list", img_list);
		mv.addObject("reply_list", reply_list);

		return mv;
	}	
	
	
	@GetMapping("/community_write_form")
	public String writeForm() throws Exception {
		return "community/community_write_form";
	}
	
	@PostMapping(value = "/write")
	public String write(CommunityDto dto) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setMember_no(user.getMember_no());


//		int board_ok = communityService.insertBoard(dto);

		int community_ok = communityService.insertCommunity(dto);

		return "redirect:/community";
	}	
	

	
	
	@GetMapping("/update/{boardIdx}")
	public ModelAndView updateForm(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("community/community_update_form");

		CommunityDto list = communityService.selectCommunityDetail(boardIdx);
		mv.addObject("list", list);

		return mv;
	}	
	
	@PostMapping("/update/{boardIdx}")
	public String update(@PathVariable("boardIdx") int boardIdx, CommunityDto dto) {


		dto.setB_no(boardIdx);

		int board_ok = communityService.updateBoard(dto);
		int community_ok = communityService.updateCommunity(dto);

		return "redirect:/community/" + Integer.toString(boardIdx);
	}	
	
	
	@PostMapping(value = "/uploadSummernoteImageFile/{boardIdx}", produces = "application/json")
	@ResponseBody
	public Map UpdateSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, @PathVariable("boardIdx") int boardIdx) throws Exception {

		JSONObject jsonObject = new JSONObject();
		Map result = new HashMap<String, Object>();

		List<MultipartFile> files = new ArrayList();
		files.add(multipartFile);
		UUID uuid = UUID.randomUUID();
		FileDto fileOne = new FileDto();
		String fileName = "Board/Community/" + uuid.toString() + "_" + multipartFile.getOriginalFilename();
		String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
		fileOne.setFile_url(fileUrl);
		fileOne.setFile_name(fileName);
		fileOne.setFile_realname(multipartFile.getOriginalFilename());
		fileOne.setFile_size(multipartFile.getSize());
		fileOne.setThumbnail(1);
		fileOne.setB_no(boardIdx);

		fileService.uploadThumb(files, fileOne);

		communityService.updateSummerNote(fileOne);

		try {
			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			result.put("url", fileUrl);
			result.put("responseCode", "success");

		} catch (IOException e) { // 저장된 파일 삭제
			result.put("responseCode", "error");
			e.printStackTrace();
		}

		return result;
	}
	
	
	@GetMapping("/delete/{boardIdx}")
	public String delete(@PathVariable("boardIdx") int boardIdx) throws Exception {
		
		int file_ok = communityService.deleteFile(boardIdx);
		int community_ok = communityService.deleteCommunity(boardIdx);
		int delete_reply_ok = communityService.deleteReplyBno(boardIdx);
		
		
//		int board_ok = communityService.deleteBoard(boardIdx);

		return "redirect:/community";
	}	
	
	
	@PostMapping("/reply")
	public String ajaxReturnPage(CommunityDto dto, Model model) {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setNickname(user.getNickname());
		
		int community_reply_ok = communityService.insertReply(dto);
		communityService.increaseReply(dto.getB_no());
		List<CommunityDto> reply_list = communityService.selectReplyList(dto.getB_no());
		
		model.addAttribute("reply_list", reply_list);

		return "community/communityReplyAjax";
	}	
	
}

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

import kr.co.hit.dto.FileDto;
import kr.co.hit.dto.MarketDto;
import kr.co.hit.dto.MarketSearchDto;
import kr.co.hit.dto.MeetingDto;
import kr.co.hit.security.User;
import kr.co.hit.service.FileService;
import kr.co.hit.service.MarketService;

@Controller
@RequestMapping("/market")
public class MarketController {

	@Autowired
	MarketService marketService;

	@Autowired
	FileService fileService;

	@GetMapping()
	public ModelAndView meeting(String topic_option) {
		
		ModelAndView mv = new ModelAndView("market/market");
		List<MarketDto> list = marketService.selectMarketList();
		int limit = 3;
		int listcount = marketService.selectMarketListCount();
		int maxPage = ((listcount - 1) / limit) + 1;
		
		mv.addObject("maxPage", maxPage);
		mv.addObject("list", list);
		mv.addObject("page_init", 1);
		return mv;
	}
	
	@GetMapping("/search")
	public ModelAndView meetingSearch(MarketSearchDto dto) {
		
		ModelAndView mv = new ModelAndView("market/market");
		
		int limit = 3;
		dto.setPage_limit(limit);
		int start = (dto.getPage() - 1) * limit;
		dto.setPage_start(start);
		int listcount = marketService.searchMarketListCount(dto);
		int maxPage = ((listcount - 1) / limit) + 1;
		
		
		List<MarketDto> list = marketService.searchMarketList(dto);
		
		
		mv.addObject("list", list);
		mv.addObject("search_option", dto);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
	@GetMapping("/search/{topic}")
	public ModelAndView meetingtotal(@PathVariable("topic") String topic, MarketSearchDto dto) {
		
		ModelAndView mv = new ModelAndView("market/market");
		if(dto.getPage() <= 0) {
			dto.setPage(1);
		}
		
		if(topic.equals("sell")) {
			dto.setTopic_name("팝니다");
		}else if(topic.equals("buy")) {
			dto.setTopic_name("삽니다");
		}else {
			dto.setTopic_name("");
		}

			
		int limit = 3;
		dto.setPage_limit(limit);
		int start = (dto.getPage() - 1) * limit;
		dto.setPage_start(start);
		int listcount = marketService.searchMarketListCount(dto);
		int maxPage = ((listcount - 1) / limit) + 1;
		if(dto.getPage() > maxPage) {
			dto.setPage(maxPage);
		}
		
		List<MarketDto> list = marketService.searchMarketList(dto);
		
		mv.addObject("list", list);
		mv.addObject("search_option", dto);
		mv.addObject("currunt_topic", topic);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
	

	@GetMapping("/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("market/market_read");
		marketService.increaseView(boardIdx);
		MarketDto list = marketService.selectMarketRead(boardIdx);
		List<MarketDto> img_list = marketService.searchMarketImgList(boardIdx);
		
		List<MarketDto> reply_list = marketService.selectReplyList(boardIdx);
		mv.addObject("list", list);
		mv.addObject("img_list", img_list);
		mv.addObject("reply_list", reply_list);

		return mv;
	}

	@GetMapping("/write")
	public String writeForm() throws Exception {
		return "market/market_write";
	}

	@PostMapping(value = "/write")
	public String write(MarketDto dto) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setMember_no(user.getMember_no());


		int board_ok = marketService.insertBoard(dto);

		int market_ok = marketService.insertMarket(dto);

		return "redirect:/market";
	}

	@PostMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		JSONObject jsonObject = new JSONObject();
		Map result = new HashMap<String, Object>();

		List<MultipartFile> files = new ArrayList();
		files.add(multipartFile);
		UUID uuid = UUID.randomUUID();
		FileDto fileOne = new FileDto();
		String fileName = "Board/Market/" + uuid.toString() + "_" + multipartFile.getOriginalFilename();
		String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
		fileOne.setFile_url(fileUrl);
		fileOne.setFile_name(fileName);
		fileOne.setFile_realname(multipartFile.getOriginalFilename());
		fileOne.setFile_size(multipartFile.getSize());
		fileOne.setThumbnail(1);

		fileService.uploadThumb(files, fileOne);

		marketService.insertThumb(fileOne);

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

	@GetMapping("/update/{boardIdx}")
	public ModelAndView updateForm(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("market/market_update");

		MarketDto list = marketService.selectMarketRead(boardIdx);
		mv.addObject("list", list);

		return mv;
	}

	@PostMapping("/update/{boardIdx}")
	public String update(@PathVariable("boardIdx") int boardIdx, MarketDto dto) {


		dto.setB_no(boardIdx);

		int board_ok = marketService.updateBoard(dto);
		int market_ok = marketService.updateMarket(dto);

		return "redirect:/market/" + Integer.toString(boardIdx);
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
		String fileName = "Board/Market/" + uuid.toString() + "_" + multipartFile.getOriginalFilename();
		String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
		fileOne.setFile_url(fileUrl);
		fileOne.setFile_name(fileName);
		fileOne.setFile_realname(multipartFile.getOriginalFilename());
		fileOne.setFile_size(multipartFile.getSize());
		fileOne.setThumbnail(1);
		fileOne.setB_no(boardIdx);

		fileService.uploadThumb(files, fileOne);

		marketService.updateSummerNote(fileOne);

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
		
		int file_ok = marketService.deleteFile(boardIdx);
		int market_ok = marketService.deleteMarket(boardIdx);
		int board_ok = marketService.deleteBoard(boardIdx);

		return "redirect:/market";
	}
	
	@PostMapping("/reply")
	public String ajaxReturnPage(MarketDto dto, Model model) {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setNickname(user.getNickname());
		
		int market_reply_ok = marketService.insertReply(dto);
		marketService.increaseReply(dto.getB_no());
		List<MarketDto> reply_list = marketService.selectReplyList(dto.getB_no());
		
		model.addAttribute("reply_list", reply_list);

		return "market/marketReplyAjax";
	}

}

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

import kr.co.hit.dto.QnaDto;
import kr.co.hit.dto.QnaSearchDto;
import kr.co.hit.dto.FileDto;
import kr.co.hit.security.User;
import kr.co.hit.service.QnaService;
import kr.co.hit.service.FileService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	FileService fileService;

	@GetMapping()
	public ModelAndView qna(String topic_option) {

		ModelAndView mv = new ModelAndView("qna/qna");
		List<QnaDto> list = qnaService.selectQnaList();
		int limit = 10;
		int listcount = qnaService.selectQnaListCount();
		int maxPage = ((listcount - 1) / limit) + 1;
		
		mv.addObject("maxPage", maxPage);
		mv.addObject("list", list);
		mv.addObject("page_init", 1);
		return mv;

	}
	
	@GetMapping("/search")
	public ModelAndView qnaSearch(QnaSearchDto dto) {
		
		ModelAndView mv = new ModelAndView("qna/qna");
		
		int limit = 10;
		dto.setPage_limit(limit);
		int start = (dto.getPage() - 1) * limit;
		dto.setPage_start(start);
		int listcount = qnaService.searchQnaListCount(dto);
		int maxPage = ((listcount - 1) / limit) + 1;
		
		
		List<QnaDto> list = qnaService.searchQnaList(dto);
		
		
		mv.addObject("list", list);
		mv.addObject("search_option", dto);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
	@GetMapping("/search/{topic}")
	public ModelAndView qnatotal(@PathVariable("topic") String topic, QnaSearchDto dto) {
		
		ModelAndView mv = new ModelAndView("qna/qna");
		if(dto.getPage() <= 0) {
			dto.setPage(1);
		}
		
		if(topic.equals("career")) {
			dto.setTopic_name("커리어");
		}else if(topic.equals("tech")) {
			dto.setTopic_name("기술");
		}else if(topic.equals("algorithm")) {
			dto.setTopic_name("알고리즘");
		}else if(topic.equals("other")) {
			dto.setTopic_name("기타");
		}else {
			dto.setTopic_name("");
		}

			
		int limit = 10;
		dto.setPage_limit(limit);
		int start = (dto.getPage() - 1) * limit;
		dto.setPage_start(start);
		int listcount = qnaService.searchQnaListCount(dto);
		int maxPage = ((listcount - 1) / limit) + 1;
		if(dto.getPage() > maxPage) {
			dto.setPage(maxPage);
		}
		
		List<QnaDto> list = qnaService.searchQnaList(dto);
		
		mv.addObject("list", list);
		mv.addObject("search_option", dto);
		mv.addObject("currunt_topic", topic);
		mv.addObject("maxPage", maxPage);
		return mv;
	}
	
	
	
	@GetMapping("/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("qna/qna_detail");
		qnaService.increaseView(boardIdx);
		QnaDto list = qnaService.selectQnaDetail(boardIdx);
		List<QnaDto> img_list = qnaService.searchQnaImgList(boardIdx);
		
		List<QnaDto> reply_list = qnaService.selectReplyList(boardIdx);
		mv.addObject("list", list);
		mv.addObject("img_list", img_list);
		mv.addObject("reply_list", reply_list);

		return mv;
	}	
	
	
	@GetMapping("/qna_write_form")
	public String writeForm() throws Exception {
		return "qna/qna_write_form";
	}
	
	@PostMapping(value = "/write")
	public String write(QnaDto dto) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setMember_no(user.getMember_no());


//		int board_ok = qnaService.insertBoard(dto);

		int qna_ok = qnaService.insertQna(dto);

		return "redirect:/qna";
	}	
	

	
	
	@GetMapping("/update/{boardIdx}")
	public ModelAndView updateForm(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("qna/qna_update_form");

		QnaDto list = qnaService.selectQnaDetail(boardIdx);
		mv.addObject("list", list);

		return mv;
	}	
	
	@PostMapping("/update/{boardIdx}")
	public String update(@PathVariable("boardIdx") int boardIdx, QnaDto dto) {


		dto.setB_no(boardIdx);

		int board_ok = qnaService.updateBoard(dto);
		int qna_ok = qnaService.updateQna(dto);

		return "redirect:/qna/" + Integer.toString(boardIdx);
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
		String fileName = "Board/Qna/" + uuid.toString() + "_" + multipartFile.getOriginalFilename();
		String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
		fileOne.setFile_url(fileUrl);
		fileOne.setFile_name(fileName);
		fileOne.setFile_realname(multipartFile.getOriginalFilename());
		fileOne.setFile_size(multipartFile.getSize());
		fileOne.setThumbnail(1);
		fileOne.setB_no(boardIdx);

		fileService.uploadThumb(files, fileOne);

		qnaService.updateSummerNote(fileOne);

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
		
		int file_ok = qnaService.deleteFile(boardIdx);
		int qna_ok = qnaService.deleteQna(boardIdx);
		
		int delete_reply_ok = qnaService.deleteReplyBno(boardIdx);
		
//		int board_ok = qnaService.deleteBoard(boardIdx);

		return "redirect:/qna";
	}	
	
	
	@PostMapping("/reply")
	public String ajaxReturnPage(QnaDto dto, Model model) {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setNickname(user.getNickname());
		
		int qna_reply_ok = qnaService.insertReply(dto);
		qnaService.increaseReply(dto.getB_no());
		List<QnaDto> reply_list = qnaService.selectReplyList(dto.getB_no());
		
		model.addAttribute("reply_list", reply_list);

		return "qna/qnaReplyAjax";
	}	
	
}

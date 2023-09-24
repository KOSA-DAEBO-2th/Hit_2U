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
import kr.co.hit.dto.MeetingDto;
import kr.co.hit.security.User;
import kr.co.hit.service.FileService;
import kr.co.hit.service.MeetingService;

@Controller
@RequestMapping("/meeting")
public class MeetingController {

	@Autowired
	MeetingService meetingService;
	
	@Autowired
	FileService fileService;
	
	@GetMapping()
	public ModelAndView meeting() {

		ModelAndView mv = new ModelAndView("meeting/meeting");
		int listcount = meetingService.getMeetingListCount("", "a");
//		List<MeetingDto> list = meetingService.selectMeetingList();
		int limit = 8;
		int start = 0;
		int maxPage = ((listcount - 1) / limit) + 1;
		String search_target = "";

		List<MeetingDto> list = meetingService.selectMeetingPage(search_target, start, limit);
		List<String[]> tag_list = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			String tag[] = list.get(i).getMeet_tags().split(" ");
			tag_list.add(tag);
		}

		mv.addObject("list", list);
		mv.addObject("tag_list", tag_list);
		mv.addObject("maxPage", maxPage);

		return mv;
	}

	@PostMapping("/meeting_page")
	public String ajaxReturnPage(@RequestParam(value = "page_num", defaultValue = "1") String page_num,
			@RequestParam("topic") String topic, @RequestParam("search_target") String search_target, Model model) {
		List<MeetingDto> list = new ArrayList();
		int listcount = 0;
		int limit = 8;
		int start = (Integer.parseInt(page_num) - 1) * limit;

		if (topic.equals("전체")) {
			list = meetingService.selectMeetingPage(search_target, start, limit);
			listcount = meetingService.getMeetingListCount(search_target, "a");
		} else {
			list = meetingService.selectMeetingTopicList(search_target, topic, start, limit);
			listcount = meetingService.getMeetingListCount(search_target, topic);
		}

		int maxPage = ((listcount - 1) / limit) + 1;
		if (Integer.parseInt(page_num) > maxPage) {
			page_num = Integer.toString(maxPage);
		}
		List<String[]> tag_list = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			String tag[] = list.get(i).getMeet_tags().split(" ");
			tag_list.add(tag);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("tag_list", tag_list);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("page_num", page_num);
		model.addAttribute("search_target", search_target);

		return "meeting/meetingListAjax";
	}


	@GetMapping("/write")
	public String writeForm() throws Exception {
		return "meeting/meeting_write";
	}

	@PostMapping(value = "write", headers = ("content-type=multipart/*"))
	public String write(MeetingDto dto, @RequestParam("chooseFile") List<MultipartFile> files) throws Exception {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		dto.setMember_no(user.getMember_no());
		System.out.println(user);
		meetingService.insert(dto);
		
		meetingService.insertMeeting(dto);
		meetingService.insertMeetingMember(meetingService.getMeetingBoardNumber(), user.getMember_no(), dto.getMeeting_position(), 1, 1);
		
		
		MultipartFile multiFile = files.get(0);
		UUID uuid = UUID.randomUUID();
		
		if (multiFile.getSize() != 0) {
			for (MultipartFile multipartfile : files) {

				FileDto fileOne = new FileDto();
				String fileName = "Board/Meeting/" + uuid.toString() + "_" + multipartfile.getOriginalFilename();
				String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
				fileOne.setFile_url(fileUrl);
				fileOne.setFile_name(fileName);
				fileOne.setFile_realname(multipartfile.getOriginalFilename());
				fileOne.setFile_size(multipartfile.getSize());

				fileService.uploadThumb(files, fileOne);
				System.out.println("파일 S3 업로드 성공");

				meetingService.insertThumb(fileOne);
				System.out.println("파일 DB 저장 성공");
			}
		}
		return "redirect:/meeting";
	}

	@GetMapping("/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("meeting/meeting_read");
		meetingService.increaseView(boardIdx);
		MeetingDto list = meetingService.selectMeetingRead(boardIdx);
		String tag[] = list.getMeet_tags().split(" ");
		List<Integer> like = new ArrayList<Integer>();
		List<Integer> apply_in = new ArrayList<Integer>();
		
		List<MeetingDto> meeting_member = meetingService.selectMeetingMember(boardIdx);
		List<MeetingDto> recommend_list = meetingService.selectRecommendList(boardIdx, list.getMeet_field());
		List<MeetingDto> reply_list = meetingService.selectReplyList(boardIdx);
		List<MeetingDto> apply_list = meetingService.selectApplyList(boardIdx);
		List<MeetingDto> apply_in_list = meetingService.selectApplyInList(boardIdx);

		mv.addObject("list", list);
		mv.addObject("tags", tag);
		mv.addObject("meeting_member", meeting_member);
		mv.addObject("recommend_list", recommend_list);
		mv.addObject("reply_list", reply_list);
		mv.addObject("apply_list", apply_list);
		
		for (int i = 0; i < apply_list.size(); i++) {
			like.add(apply_list.get(i).getMember_no());
		}
		
		for (int i = 0; i < apply_in_list.size(); i++) {
			apply_in.add(apply_in_list.get(i).getMember_no());
		}
		mv.addObject("like", like);
		mv.addObject("apply_in", apply_in);
		System.out.println(like);
	

		return mv;
	}

	@PostMapping("/meeting_apply")
	@ResponseBody
	public String meeting_insert(@RequestParam("boardIdx") int boardIdx, @RequestParam(value = "member_no", defaultValue = "4") int member_no,
			@RequestParam("meeting_position") String meeting_position,
			@RequestParam(value = "meeting_tmp", defaultValue = "0") int meeting_tmp,
			@RequestParam(value = "meeting_leader", defaultValue = "0") int meeting_leader) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		member_no = user.getMember_no();
		int result = meetingService.insertMeetingMember(boardIdx, member_no, meeting_position, meeting_tmp, meeting_leader);

		return Integer.toString(result);
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		
		JSONObject jsonObject = new JSONObject();
		Map result = new HashMap<String, Object>();
		
		List<MultipartFile> files = new ArrayList();
		files.add(multipartFile);
		UUID uuid = UUID.randomUUID();
		FileDto fileOne = new FileDto();
		String fileName = "Board/Meeting/" + uuid.toString() + "_" + multipartFile.getOriginalFilename();
		String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
		fileOne.setFile_url(fileUrl);
		fileOne.setFile_name(fileName);
		fileOne.setFile_realname(multipartFile.getOriginalFilename());
		fileOne.setFile_size(multipartFile.getSize());
		fileOne.setThumbnail(1);
		
		fileService.uploadThumb(files, fileOne);
		 
		meetingService.insertThumb(fileOne); 

		try {
			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			result.put("url", fileUrl);
			result.put("responseCode", "success");
				
		} catch (IOException e) {	//저장된 파일 삭제
			result.put("responseCode", "error");
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	@GetMapping("/apply/{boardIdx}/{member_no}/{meeting_position}")
	public String apply_ok(@PathVariable("boardIdx") int boardIdx, @PathVariable("member_no") int member_no, @PathVariable("meeting_position") String meeting_position) throws Exception {
		
		System.out.println(meeting_position);
		meetingService.meetingOk(boardIdx, member_no);
		meetingService.meetingCount(boardIdx, meeting_position);


		return "redirect:/meeting/"+Integer.toString(boardIdx);
	}
	
	@GetMapping("/apply_cancle/{boardIdx}/{member_no}")
	public String apply_cancle(@PathVariable("boardIdx") int boardIdx, @PathVariable("member_no") int member_no) throws Exception {
		
		System.out.println(member_no);
		meetingService.meetingCancle(boardIdx, member_no);
		meetingService.meetingCount(boardIdx, "백엔드1");


		return "redirect:/meeting/"+Integer.toString(boardIdx);
	}

}

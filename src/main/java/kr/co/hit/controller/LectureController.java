package kr.co.hit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.FileDto;
import kr.co.hit.dto.LectureDto;
import kr.co.hit.dto.MeetingDto;
import kr.co.hit.service.FileService;
import kr.co.hit.service.LectureService;

@Controller
@RequestMapping("/lecture")
public class LectureController {

	@Autowired
	LectureService lectureService;
	
	@Autowired
	FileService fileService;
	
	@GetMapping()
	public ModelAndView lecture() {

		ModelAndView mv = new ModelAndView("lecture/lecture");
		int listcount = lectureService.getLectureListCount("", "a");
//		List<MeetingDto> list = meetingService.selectMeetingList();
		int limit = 8;
		int start = 0;
		int maxPage = ((listcount - 1) / limit) + 1;
		String search_target = "";

		List<LectureDto> list = lectureService.selectLecturePage(search_target, start, limit);
		List<String[]> tag_list = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			String tag[] = list.get(i).getLecture_tags().split(" ");
			tag_list.add(tag);
		}

		mv.addObject("list", list);
		mv.addObject("tag_list", tag_list);
		mv.addObject("maxPage", maxPage);

		return mv;
	}
	
	@PostMapping("/lecture_page")
	public String ajaxReturnPage(@RequestParam(value = "page_num", defaultValue = "1") String page_num,
			@RequestParam("topic") String topic, @RequestParam("search_target") String search_target, Model model) {
		List<LectureDto> list = new ArrayList();
		int listcount = 0;
		int limit = 8;
		int start = (Integer.parseInt(page_num) - 1) * limit;

		if (topic.equals("전체")) {
			list = lectureService.selectLecturePage(search_target, start, limit);
			listcount = lectureService.getLectureListCount(search_target, "a");
		} else {
			list = lectureService.selectLectureTopicList(search_target, topic, start, limit);
			listcount = lectureService.getLectureListCount(search_target, topic);
		}

		int maxPage = ((listcount - 1) / limit) + 1;
		if (Integer.parseInt(page_num) > maxPage) {
			page_num = Integer.toString(maxPage);
		}
		List<String[]> tag_list = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			String tag[] = list.get(i).getLecture_tags().split(" ");
			tag_list.add(tag);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("tag_list", tag_list);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("page_num", page_num);
		model.addAttribute("search_target", search_target);

		return "lecture/lectureListAjax";
	}
	
	@GetMapping("/write")
	public String writeForm() throws Exception {
		return "lecture/lecture_write";
	}
	
	@PostMapping(value = "write", headers = ("content-type=multipart/*"))
	public String write(LectureDto dto, @RequestParam("chooseFile") List<MultipartFile> files) throws Exception {
		System.out.println(dto);
		lectureService.insert(dto);
		lectureService.insertLecture(dto);
		System.out.println("insertLecture성공");
		
		MultipartFile multiFile = files.get(0);
		UUID uuid = UUID.randomUUID();
		
		if (multiFile.getSize() != 0) {
			for (MultipartFile multipartfile : files) {

				FileDto fileOne = new FileDto();
				String fileName = "Board/Lecture/" + uuid.toString() + "_" + multipartfile.getOriginalFilename();
				String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
				fileOne.setFile_url(fileUrl);
				fileOne.setFile_name(fileName);
				fileOne.setFile_realname(multipartfile.getOriginalFilename());
				fileOne.setFile_size(multipartfile.getSize());

				fileService.uploadThumb(files, fileOne);
				System.out.println("파일 S3 업로드 성공");

				lectureService.insertThumb(fileOne);
				System.out.println("파일 DB 저장 성공");
			}
		}
		return "redirect:/lecture";
	}
	
	@GetMapping("/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("lecture/lecture_read");
		lectureService.increaseView(boardIdx);
		LectureDto list = lectureService.selectLectureRead(boardIdx);
		String tag[] = list.getLecture_tags().split(" ");

//		List<LectureDto> lecture_member = lectureService.selectLectureMember(boardIdx);
//		List<LectureDto> recommend_list = lectureService.selectRecommendList(boardIdx, list.getLecture_field());
//		List<LectureDto> reply_list = lectureService.selectReplyList(boardIdx);
//		List<LectureDto> apply_list = lectureService.selectReplyList(boardIdx);

		mv.addObject("list", list);
		mv.addObject("tags", tag);
//		mv.addObject("lecture_member", lecture_member);
//		mv.addObject("recommend_list", recommend_list);
//		mv.addObject("reply_list", reply_list);
	

		return mv;
	}
}

package kr.co.hit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.swing.DefaultListSelectionModel;
import javax.xml.stream.events.StartDocument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MeetingDto;
import kr.co.hit.service.MeetingService;

@Controller
@RequestMapping("/meeting")
public class MeetingController {

	@Autowired
	MeetingService meetingService;
	
//	@GetMapping()
//	public ModelAndView meeting() {
//
//		ModelAndView mv = new ModelAndView("meeting/meeting");
//		List<MeetingDto> list = meetingService.selectMeetingList();

//		List<String[]> tag_list = new ArrayList<String[]>();
//		for (int i = 0; i < list.size(); i++) {
//			String tag[] = list.get(i).getMeet_tags().split(" ");
//			tag_list.add(tag);
//		}
//
//		mv.addObject("list", list);
//		mv.addObject("tags", tag_list);
//		mv.addObject("listcount", listcount);
//
//		return mv;
//	}
	
	@GetMapping()
	public ModelAndView meeting() {

		ModelAndView mv = new ModelAndView("meeting/meeting");
		int listcount = meetingService.getMeetingListCount("","a");
		List<MeetingDto> list = meetingService.selectMeetingList();
		int limit = 8;
		int start = 0;
		int maxPage = ( (listcount - 1) / limit ) + 1;
		String search_target = "";
		
		list = meetingService.selectMeetingPage(search_target, start, limit);
		List<String[]> tag_list = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			String tag[] = list.get(i).getMeet_tags().split(" ");
			tag_list.add(tag);
		}

		mv.addObject("list", list);
		System.out.println(list);
		mv.addObject("tag_list", tag_list);
		mv.addObject("maxPage", maxPage);

		return mv;
	}
	

	@PostMapping("/meeting_page")
	public String ajaxReturnPage(@RequestParam(value="page_num", defaultValue = "1") String page_num, @RequestParam("topic") String topic, @RequestParam("search_target") String search_target, Model model) {
		List<MeetingDto> list = new ArrayList();
		int listcount = 0;
		int limit = 8;
		int start = (Integer.parseInt(page_num)-1) * limit; 
		
		if (topic.equals("전체")) {
			list = meetingService.selectMeetingPage(search_target, start, limit );
			listcount = meetingService.getMeetingListCount(search_target, "a");
		} else {
			list = meetingService.selectMeetingTopicList(search_target, topic, start, limit);
			listcount = meetingService.getMeetingListCount(search_target, topic);
		}
		
		int maxPage = ( (listcount - 1) / limit ) + 1;
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

	/*
	 * @PostMapping() public String ajaxReturnList(@RequestParam("select") String
	 * select, Model model) { List<MeetingDto> list = new ArrayList();
	 * 
	 * if (select.equals("전체")) { list = meetingService.selectMeetingList(); } else
	 * { list = meetingService.selectMeetingCategoyList(select); } List<String[]>
	 * tag_list = new ArrayList<String[]>(); for (int i = 0; i < list.size(); i++) {
	 * String tag[] = list.get(i).getMeet_tags().split(" "); tag_list.add(tag); }
	 * 
	 * model.addAttribute("list", list); model.addAttribute("tag_list", tag_list);
	 * 
	 * return "meeting/meetingListAjax"; }
	 */
	

	@PostMapping("/meeting_search")
	public String ajaxReturnSearch(@RequestParam("search_target") String search_target, Model model) {
		List<MeetingDto> list = new ArrayList();

		list = meetingService.selectMeetingSearch(search_target);

		List<String[]> tag_list = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			String tag[] = list.get(i).getMeet_tags().split(" ");
			tag_list.add(tag);
		}

		model.addAttribute("list", list);
		model.addAttribute("tag_list", tag_list);

		return "meeting/meetingListAjax";
	}

	@GetMapping("/write")
	public String writeForm() throws Exception {
		return "meeting/meeting_write";
	}

	@PostMapping("/write")
	public String write(MeetingDto dto) throws Exception {
		System.out.println(dto);
		meetingService.insert(dto);
		meetingService.insertMeeting(dto);
		return "redirect:/meeting";
	}

	@GetMapping("/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {
		ModelAndView mv = new ModelAndView("meeting/meeting_read");
		MeetingDto list = meetingService.selectMeetingRead(boardIdx);
		meetingService.increaseView(boardIdx);

		String tag[] = list.getMeet_tags().split(" ");
		mv.addObject("list", list);
		mv.addObject("tags", tag);

		return mv;
	}

}

package kr.co.hit.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MeetingDto;
import kr.co.hit.service.MeetingService;

@Controller
@RequestMapping("/meeting")
public class MeetingController {

	@Autowired
	MeetingService meetingService;

	@GetMapping()
	public ModelAndView meeting() {

		ModelAndView mv = new ModelAndView("meeting/meeting");

		List<MeetingDto> list = meetingService.selectMeetingList();
		List<String[]> tag_list = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			String tag[] = list.get(i).getMeet_tags().split(" ");
			tag_list.add(tag);
		}

		mv.addObject("list", list);
		mv.addObject("tags", tag_list);

		return mv;
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

		String tag[] = list.getMeet_tags().split(" ");
		mv.addObject("list", list);
		mv.addObject("tags", tag);

		return mv;
	}

}

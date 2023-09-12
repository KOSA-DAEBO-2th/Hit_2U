package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hit.dto.BoardDto;
import kr.co.hit.service.LectureBoardService;

@Controller
public class LectureBoardController {
	
	@Autowired
	private LectureBoardService lectureService;
	

	@RequestMapping("/lecture")
	public String lecture(Model model) {
		List<BoardDto> list = lectureService.selectLectureList();
		model.addAttribute("list", list);
		return "lecture/lecture";
	}

	@RequestMapping("/lecture_write")
	public String lecture_write() {
		return "lecture/lecture_write";
	}

	@RequestMapping("/lecture_detail")
	public String lecture_detail() {
		return "lecture/lecture_detail";
	}

}

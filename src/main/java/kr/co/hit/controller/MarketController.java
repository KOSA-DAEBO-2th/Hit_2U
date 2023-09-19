package kr.co.hit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hit.dto.MarketDto;
import kr.co.hit.dto.MeetingDto;
import kr.co.hit.service.FileService;
import kr.co.hit.service.MarketService;
import kr.co.hit.service.MeetingService;

@Controller
@RequestMapping("/market")
public class MarketController {

	@Autowired
	MarketService marketService;
	
	@Autowired
	FileService fileService;
	

	@GetMapping()
	public ModelAndView meeting() {

		ModelAndView mv = new ModelAndView("market/market");
		List<MarketDto> list = marketService.selectMarketList();
		
		mv.addObject("list", list);
		
//		int listcount = meetingService.getMeetingListCount("", "a");
////		List<MeetingDto> list = meetingService.selectMeetingList();
//		int limit = 8;
//		int start = 0;
//		int maxPage = ((listcount - 1) / limit) + 1;
//		String search_target = "";
//

//
//		mv.addObject("list", list);
//		mv.addObject("tag_list", tag_list);
//		mv.addObject("maxPage", maxPage);

		return mv;
	}

	@GetMapping("/{boardIdx}")
	public ModelAndView read(@PathVariable("boardIdx") int boardIdx) throws Exception {

		ModelAndView mv = new ModelAndView("market/market_read");
		marketService.increaseView(boardIdx);
		MarketDto list = marketService.selectMarketRead(boardIdx);

		mv.addObject("list", list);

		return mv;
	}


}

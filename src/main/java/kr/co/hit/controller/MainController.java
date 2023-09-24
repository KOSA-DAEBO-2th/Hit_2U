package kr.co.hit.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hit.dto.CommunityDto;
import kr.co.hit.dto.MainDto;
import kr.co.hit.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	@RequestMapping("/")
	public String main(HttpServletRequest request, Model model, MainDto dto) {
		
		HashMap map = new HashMap();
		
		List<MainDto> communityList = mainService.CommunityMainList(map);
		List<MainDto> qnaList = mainService.QnaMainList(map);
		List<MainDto> marketList = mainService.MarketMainList(map);
		List<MainDto> hitList = mainService.HitMainList(map);

		model.addAttribute("communityList", communityList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("marketList", marketList);
		model.addAttribute("hitList", hitList);
		
		return "/main";

	}
}

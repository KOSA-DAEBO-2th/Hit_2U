package kr.co.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hit.service.JoinService;
import kr.co.hit.service.ProfileService;

@Controller
@RequestMapping("/")
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	
//	public 
	
}

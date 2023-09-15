package kr.co.hit.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hit.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private TestService testService;

	@RequestMapping("fileTest")
	public String fileTest() {
		return "/test/fileTest";
	}

	@RequestMapping("admin")
	public String testAdmin() {
		return "/test/admin";
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/upload", headers = ("content-type=multipart/*"))
	public String upload(@RequestParam("file") List<MultipartFile> files) throws IOException {
		System.out.println("upload 실험 시작");
		testService.fileTest(files);
		System.out.println("업로드됐니?");
		return "main";
	}

}

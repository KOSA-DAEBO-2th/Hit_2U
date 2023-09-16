package kr.co.hit.controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hit.dto.FileDto;
import kr.co.hit.dto.MeetingDto;
import kr.co.hit.security.User;
import kr.co.hit.service.MeetingService;
import kr.co.hit.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private TestService testService;
	
	@Autowired
	MeetingService meetingService;

	@RequestMapping("fileTest")
	public String fileTest() {
		return "/test/fileTest";
	}

	@RequestMapping("admin")
	public String testAdmin() {
		return "/test/admin";
	}

	@RequestMapping("fileTest2")
	public String fileTest2() {
		return "/test/fileTest2";
	}
	
	@RequestMapping("s3Test")
	public String s3Test() {
		return "/test/s3Test";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/upload", headers = ("content-type=multipart/*"))
	public String upload(@RequestParam("file") List<MultipartFile> files) throws IOException {
		System.out.println("upload 실험 시작");
		testService.fileTest(files);
		System.out.println("업로드됐니?");
		return "main";
	}

	// @PreAuthorize("principal.")
	@RequestMapping("authority")
	public String authority() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("유저 정보 확인: " + user.getMember_id());
		System.out.println(user);
		return "main";
	}

	@RequestMapping(value = "write", headers = ("content-type=multipart/*"), method = RequestMethod.POST)
	public String write(MeetingDto dto, @RequestParam("chooseFile") List<MultipartFile> files) throws IOException {
	
		System.out.println(dto);
		meetingService.insert(dto);
		System.out.println("insert성공");
		meetingService.insertMeeting(dto);
		System.out.println("insertMeeing성공");
		
		MultipartFile multiFile = files.get(0);
		int result=0;
		UUID uuid = UUID.randomUUID();
		
		
		if (multiFile.getSize() != 0) {
			for (MultipartFile multipartfile : files) {

				FileDto fileOne = new FileDto();
				String fileName = "Board/Meeting/" + uuid.toString() + "_" + multipartfile.getOriginalFilename();
				String fileUrl = "https://2teams3.s3.ap-northeast-2.amazonaws.com/" + fileName;
				fileOne.setFile_url(fileUrl);
				System.out.println(fileUrl);
				fileOne.setFile_name(fileName);
				fileOne.setFile_realname(multipartfile.getOriginalFilename());
				fileOne.setFile_size(multipartfile.getSize());
				meetingService.insertThumb(fileOne);
				System.out.println("파일 DB 저장 성공");
				result = testService.uploadThumb(files, fileOne);
				System.out.println("파일 S3 업로드 성공");
			}
		}
		
		return "redirect:/meeting";
	}

}

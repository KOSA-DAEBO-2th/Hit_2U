package kr.co.hit.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hit.aws.AwsS3;
import kr.co.hit.dto.FileDto;

@Service
public class TestService {

	@Transactional(rollbackFor = Exception.class)
	public void fileTest(List<MultipartFile> files) throws IOException {
		MultipartFile multiFile = files.get(0);
		if (multiFile.getSize() != 0) {
			AwsS3 awsS3 = AwsS3.getInstance();
			System.out.println("인스턴스 생성하니?");
			
			for (MultipartFile multipartfile : files) {

				UUID uuid = UUID.randomUUID();
				FileDto fileOne = new FileDto();
				
				System.out.println("uuid");
				
				String fileName = "test" + "/" + "board" + "/" + "index" + "/" + uuid.toString() + "_"
						+ multipartfile.getOriginalFilename();

				String fileUrl = "s3://2teams3/Test/" + fileName;
				fileOne.setFileUrl(fileUrl);
				fileOne.setFileName(fileName);
				fileOne.setFileRealName(multipartfile.getOriginalFilename());
				fileOne.setFileSize(multipartfile.getSize());

				//this.fileWrite(fileOne);

				awsS3.upload(multipartfile, fileName);
			}
		}
	}
	
}

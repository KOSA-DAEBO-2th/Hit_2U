package kr.co.hit.dto;

import lombok.Data;

@Data
public class FileDto {
	private int filenum; //파일번호
	private int idx; //글번호
	private String fileName;
	private String fileRealName;
	private String fileUrl;
	private long fileSize;
}

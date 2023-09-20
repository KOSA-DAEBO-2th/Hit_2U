package kr.co.hit.dto;

import lombok.Data;

@Data
public class FileDto {
	private int file_num; //파일번호
	private String file_name; //사용자 지정 이름
	private String file_realname; //실제 업로드 된 파일 이름
	private String file_url;// 파일 경로
	private long file_size; // 파일크기
	private int b_no; //글번호
	private int thumbnail;
}

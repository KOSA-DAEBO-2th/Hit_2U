package kr.co.hit.dto;

import lombok.Data;

@Data
public class ImageDto {
	private int image_no; //이미지 번호
	private String image_name; //사용자 지정 이름
	private String image_realname; //실제 업로드 된 이미지 이름
	private String image_url;// 이미지 경로
	private int member_no; // 멤버번호
}

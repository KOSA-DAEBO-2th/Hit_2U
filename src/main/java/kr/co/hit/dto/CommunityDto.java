package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityDto {

	private int b_no, b_view, b_reply, b_recommend, member_no, cat_no;
	private String b_title, b_content, nickname, r_content, member_id;
	private Date b_write_date;
	
	private String topic_name;
	private int topic_no, grade;
	
	private String image_url;
	
}

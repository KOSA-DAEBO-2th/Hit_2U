package kr.co.hit.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommunitySearchDto {

	private int b_recommend, member_no, cat_no, reply_no, topic_no, grade, page,  page_limit, page_start;
	private String b_title = "", b_content, nickname, market_category, r_content, member_id, file_url, topic_name ="",topic_option, search_target;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp b_write_date, reply_date;
	

	

		
	
	
	
}

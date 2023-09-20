package kr.co.hit.dto;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MainDto {

//	CommunityDto  /  BoardDto  / QnaDto
	private int b_no, b_view, b_reply, b_recommend, member_no, cat_no;
	private String b_title, b_content, nickname;
	private Date b_write_date;

	private String topic_name;
	private int topic_no, grade;


//	ProfileDto	
	private int count;
	private String cat_name;
	private Date reply_date;	
	

	// LectureDto
	private int point, reply_no;
	private String lecture_topic_name, lecture_state, lecture_field, lecture_tags, git_link, r_content, member_id,
			file_url;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date meet_start_day, meet_end_day;

//	MarketDto
	private int price;
	private String market_category;
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
//	private Timestamp b_write_date, reply_date;

}

package kr.co.hit.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AdminDto {
	private int b_no, member_no, cat_no, cntWeek, replyWeek, count;
	private String b_title, b_content, search_key, cat, member_id, nickname, cat_name, authority, months;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date b_write_date;
}

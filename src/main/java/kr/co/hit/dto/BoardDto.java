package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {
	private int b_no, b_view, b_reply, b_recommend, member_no, cat_no;
	private String b_title, b_content;
	private Date b_write_date;
}

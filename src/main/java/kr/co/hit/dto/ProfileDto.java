package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProfileDto {
	private int b_no, member_no, count, cat_no;
	private String b_title, b_content, member_id, r_content, cat_name;
	private Date b_write_date, reply_date, join_date;
}

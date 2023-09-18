package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDto {

//	private int reply_no, board_no;
	private int reply_no, b_no;
	private String nickname, r_content;
	private Date reply_date;
	
	
}

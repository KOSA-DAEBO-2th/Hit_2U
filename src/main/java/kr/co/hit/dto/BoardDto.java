package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {
	private int board_no, view1, reply, recommend, member_no, cat_no;
	private String title, content1;
	private Date write_date;
}

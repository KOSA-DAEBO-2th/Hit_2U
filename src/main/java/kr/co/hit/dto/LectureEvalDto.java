package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LectureEvalDto {

	private int eval_no, raiting, member_no;
	private String nickname, eval_content;
	private Date eval_date;
}

package kr.co.hit.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LectureDto {

	private int b_no, b_view, b_reply, b_recommend, member_no, cat_no, point, reply_no;
	private String b_title, b_content, lecture_topic_name, lecture_state, lecture_field, lecture_tags, nickname, git_link, grade,
			r_content, member_id, file_url, eval_content, eval_date, rating;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date b_write_date, reply_date;
}

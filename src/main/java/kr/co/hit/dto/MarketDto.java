package kr.co.hit.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MarketDto {

	private int b_no, b_view, b_reply, b_recommend, like_no, member_no, cat_no, reply_no, topic_no, grade, price, completed, page;
	private String b_title, b_content, nickname, market_category, r_content, member_id, file_url, topic_name, state, trading, discount, profile;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp b_write_date, reply_date;
}

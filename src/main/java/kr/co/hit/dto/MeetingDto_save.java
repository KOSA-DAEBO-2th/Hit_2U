package kr.co.hit.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MeetingDto_save {

	private int b_no, b_view, b_reply, b_recommend, member_no, cat_no, backend, backend_apply, frontend, frontend_apply,
			server, server_apply, pm, pm_apply, apply, apply_max;
	private String b_title, b_content, meet_topic_name, meet_state, meet_field, meet_tags;
	private Date b_write_date, meet_start_day, meet_end_day;
}
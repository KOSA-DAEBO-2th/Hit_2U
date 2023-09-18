package kr.co.hit.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MeetingDto {

	private int b_no, b_view, b_reply, b_recommend, member_no, cat_no, backend, backend_apply, frontend, frontend_apply,
			server, server_apply, pm, pm_apply, apply, apply_max, point, reply_no, meeting_tmp;
	private String b_title, b_content, meet_topic_name, meet_state, meet_field, meet_tags, nickname, git_link, grade,
			meeting_position, meeting_leader, r_content, member_id, meeting_position;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date b_write_date, meet_start_day, meet_end_day, reply_date;
}

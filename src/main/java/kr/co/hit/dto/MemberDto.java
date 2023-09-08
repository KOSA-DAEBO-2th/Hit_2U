package kr.co.hit.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	private int member_no, login_method;
	private String member_id, nickname, password, email, contact, grade, git_link, baekjoon, authority;
}
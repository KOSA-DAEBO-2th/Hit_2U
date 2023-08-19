package kr.co.hit.dto;

import lombok.Data;

@Data
public class MemberDto {
	private int member_no, login_method;
	private String member_id, nickname, password, email, contact, grade, git_link, baekjoon, authority;
}
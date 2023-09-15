package kr.co.hit.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	private int member_no;
	private String member_id, nickname, member_method,password, email, contact, grade, git_link, baekjoon, authority;

	private List<MemberAuth> authList;
}
package kr.co.hit.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	private int member_no, grade;
	private String member_id, nickname, member_method,password, email, contact, git_link, baekjoon, authority, image_url;

	private List<MemberAuth> authList;
}
package kr.co.hit.dao;

import org.springframework.stereotype.Repository;

import kr.co.hit.dto.MemberDto;

public interface MemberDao {
	

	public int insertMember(MemberDto dto);
	

}

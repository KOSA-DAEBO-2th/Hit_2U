package kr.co.hit.dao;

import org.springframework.stereotype.Repository;

import kr.co.hit.dto.MemberDto;

public interface MemberDao {
	

	public int insertMember(MemberDto dto);
	
	//유저 정보 가져오기(프로필)
	public MemberDto getUserInfo();

}

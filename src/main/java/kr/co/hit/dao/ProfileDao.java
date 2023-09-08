package kr.co.hit.dao;

import kr.co.hit.dto.MemberDto;

public interface ProfileDao {

	//유저 정보 가져오기(프로필)
	public MemberDto getUserInfo();
	
	//프로필 변경
	public int updateInfo();
	
}

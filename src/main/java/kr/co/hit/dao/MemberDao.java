package kr.co.hit.dao;

import kr.co.hit.dto.MemberDto;

public interface MemberDao {
	
	//
	public int insertMember(MemberDto dto);

	public int insertNMember(MemberDto dto);

	public MemberDto getMember(String member_id);
	
	public int checkId(String member_id);
	
	public MemberDto naverChk(String naverId);
}

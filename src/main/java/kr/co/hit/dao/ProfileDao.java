package kr.co.hit.dao;

import java.util.List;
import java.util.Map;

import kr.co.hit.dto.MemberDto;
import kr.co.hit.dto.ProfileDto;

public interface ProfileDao {

	//유저 정보 가져오기(프로필)
	public MemberDto getUserInfo(String id);
	
	//프로필 변경
	public int updateInfo(MemberDto dto);
	
	//작성글/댓글 리스트 가져오기
	public List<ProfileDto> getWriteList(String id); 
	public List<ProfileDto> getReplyList(String id);
	
	//게시판 별 작성빈도
	public List<ProfileDto> getCountWrite(String id);
	public List<ProfileDto> getCountReply(String id);
	
}

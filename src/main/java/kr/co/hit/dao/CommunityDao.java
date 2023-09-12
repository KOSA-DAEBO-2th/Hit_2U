package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.CommunityDto;

public interface CommunityDao {

	public List<CommunityDto> CommunityList(); // select all
	
	public void insertCommunity(CommunityDto dto); // insert
	
	
}

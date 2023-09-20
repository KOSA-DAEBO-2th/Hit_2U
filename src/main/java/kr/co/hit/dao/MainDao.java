package kr.co.hit.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.hit.dto.MainDto;

public interface MainDao {

	
	// community top 5 list in Main
	public List<MainDto> CommunityMainList(HashMap map);
	
	
	// Qna top 5 list in Main
	public List<MainDto> QnaMainList(HashMap map);
	
	
	// Market top 5 list in Main
	public List<MainDto> MarketMainList(HashMap map);
	
	
}

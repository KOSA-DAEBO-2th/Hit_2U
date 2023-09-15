package kr.co.hit.dao;
import java.util.HashMap;
import java.util.List;
import kr.co.hit.dto.CommunityDto;
public interface CommunityDao {
	
	// insert
	public void InsertCommunity(CommunityDto dto); 
	
//	// select all
//	public List<CommunityDto> CommunityList(); 
	
	// community detail
	public CommunityDto getCommunityDetail(int b_no);

	// update community
	public int updateCommunity(CommunityDto dto);
	
	// select all with paging
	public List<CommunityDto> CommunityList(HashMap map);

	// count community list
	public int getCommunityCount();
	
	// delete
	public int deleteCommunity(int b_no);

//	public int deleteCommunity(CommunityDto dto);
	
	
	// 조회수 증가
	public int updateView(int b_no);
	
}
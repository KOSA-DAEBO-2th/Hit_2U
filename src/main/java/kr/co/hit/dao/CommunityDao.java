package kr.co.hit.dao;
import java.util.List;
import kr.co.hit.dto.CommunityDto;
public interface CommunityDao {
	
	// insert
	public void InsertCommunity(CommunityDto dto); 
	// select all
	public List<CommunityDto> CommunityList(); 
	// selectBy b_no
	public CommunityDto getCommunityDetail(int b_no);

	// update community
	public int updateCommunity(CommunityDto dto);
	
	
	
	
}
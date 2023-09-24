package kr.co.hit.dao;

import java.io.IOException;
import java.util.List;

import kr.co.hit.dto.CommunityDto;
import kr.co.hit.dto.CommunitySearchDto;
import kr.co.hit.dto.FileDto;

public interface CommunityDao {

	// select
	public List<CommunityDto> selectCommunityList();
	public int selectCommunityListCount();
	public void increaseView(int boardIdx);
	public CommunityDto selectCommunityDetail(int boardIdx);
	public int insertBoard(CommunityDto dto);

	
	

	// search

	public List<CommunityDto> selectReplyList(int boardIdx);
	public List<CommunityDto> searchCommunityImgList(int boardIdx);
	public int searchCommunityListCount(CommunitySearchDto dto);
	
	
	
	
	
	
	

	
	// insert
	
	public int insertCommunity(CommunityDto dto);


	public List<CommunityDto> searchCommunityList(CommunitySearchDto dto);

	public int InsertCommunity(CommunityDto dto);

	public void updateView(int b_no);

	public CommunityDto getCommunityDetail(int b_no);

	public int updateBoard(CommunityDto dto);

	public int updateCommunity(CommunityDto dto);

	public int deleteFile(int boardIdx);

	public int deleteCommunity(int boardIdx);

//	public int deleteBoard(int boardIdx);

	public void updateSummerNote(FileDto fileOne) throws IOException;



	public int insertReply(CommunityDto dto);

	public void increaseReply(int b_no);
	
	public int deleteReplyBno(int boardIdx);
	
	
	public List<CommunityDto> getAnonymousPosts();




}
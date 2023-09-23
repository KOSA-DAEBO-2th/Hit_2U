package kr.co.hit.dao;

import java.io.IOException;
import java.util.List;

import kr.co.hit.dto.FileDto;
import kr.co.hit.dto.MarketDto;
import kr.co.hit.dto.MarketSearchDto;

public interface MarketDao {
	
	public List<MarketDto> selectMarketList();
	public int selectMarketListCount();
	public void increaseView(int boardIdx);
	public MarketDto selectMarketRead(int boardIdx);
	public int insertBoard(MarketDto dto);
	public int insertMarket(MarketDto dto);
	public void insertThumb(FileDto fileOne) throws IOException;
	public int searchMarketListCount(MarketSearchDto dto);
	public List<MarketDto> searchMarketList(MarketSearchDto dto);
	public List<MarketDto> searchMarketImgList(int boardIdx);
	
	//update
	public int updateBoard(MarketDto dto);
	public int updateMarket(MarketDto dto);
	public void updateSummerNote(FileDto fileOne) throws IOException;
	
	//delete
	public int deleteFile(int boardIdx);
	public int deleteMarket(int boardIdx);
	public int deleteBoard(int boardIdx);
	
	//like
	public int insertLike(int boardIdx, int member_no);
	public void increaseLike(int boardIdx);
	public List<MarketDto> selectLikeList(int boardIdx);
	public int deleteLike(int boardIdx, int member_no);
	public void decreaseLike(int boardIdx);
	
	
	//reply
	
	public List<MarketDto> selectReplyList(int boardIdx);
	public int insertReply(MarketDto dto);
	public void increaseReply(int boardIdx);
	public int updateReply(MarketDto dto);
	public int deleteReply(MarketDto dto);
	public void decreaseReply(MarketDto dto);
	
	public void completedTrade(int boardIdx);
}

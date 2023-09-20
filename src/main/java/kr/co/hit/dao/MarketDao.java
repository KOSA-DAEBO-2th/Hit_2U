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
	
	//update
	public int updateBoard(MarketDto dto);
	public int updateMarket(MarketDto dto);
	public void updateSummerNote(FileDto fileOne) throws IOException;
	
	//delete
	public int deleteFile(int boardIdx);
	public int deleteMarket(int boardIdx);
	public int deleteBoard(int boardIdx);
}

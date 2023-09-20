package kr.co.hit.dao;

import java.util.List;

import kr.co.hit.dto.MarketDto;

public interface MarketDao {
	
	public List<MarketDto> selectMarketList();
	public void increaseView(int boardIdx);
	public MarketDto selectMarketRead(int boardIdx);
}

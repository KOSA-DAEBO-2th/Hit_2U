package kr.co.hit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MarketDao;
import kr.co.hit.dao.MeetingDao;
import kr.co.hit.dto.MarketDto;

@Service
public class MarketService implements MarketDao {

	@Autowired
	private SqlSession sqlsession;


	@Override
	public List<MarketDto> selectMarketList() {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		List<MarketDto> list = dao.selectMarketList();
		return list;
	}


	public void increaseView(int boardIdx) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		dao.increaseView(boardIdx);
	}


	@Override
	public MarketDto selectMarketRead(int boardIdx) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		MarketDto list = dao.selectMarketRead(boardIdx);
		return list;
	}

	



}

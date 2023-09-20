package kr.co.hit.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MarketDao;
import kr.co.hit.dto.FileDto;
import kr.co.hit.dto.MarketDto;
import kr.co.hit.dto.MarketSearchDto;

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


	@Override
	public int insertBoard(MarketDto dto) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.insertBoard(dto);
		return result;
	}


	@Override
	public int insertMarket(MarketDto dto) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.insertMarket(dto);
		return result;
	}


	@Override
	public void insertThumb(FileDto fileOne) throws IOException {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		dao.insertThumb(fileOne);
	}


	@Override
	public int updateBoard(MarketDto dto) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.updateBoard(dto);
		return result;
	}


	@Override
	public int updateMarket(MarketDto dto) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.updateMarket(dto);
		return result;
	}
	
	
	@Override
	public int deleteFile(int boardIdx) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.deleteFile(boardIdx);
		return result;
	}


	@Override
	public int deleteMarket(int boardIdx) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.deleteMarket(boardIdx);
		return result;
	}


	@Override
	public int deleteBoard(int boardIdx) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.deleteBoard(boardIdx);
		return result;
	}


	@Override
	public void updateSummerNote(FileDto fileOne) throws IOException {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		dao.updateSummerNote(fileOne);
	}


	@Override
	public List<MarketDto> searchMarketList(MarketSearchDto dto) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		List<MarketDto> list = dao.searchMarketList(dto);
		return list;
	}


	@Override
	public int searchMarketListCount(MarketSearchDto dto) {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.searchMarketListCount(dto);
		return result;
	}


	@Override
	public int selectMarketListCount() {
		MarketDao dao = sqlsession.getMapper(MarketDao.class);
		int result = dao.selectMarketListCount();
		return result;
	}


	

}

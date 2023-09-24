package kr.co.hit.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.CommunityDao;
import kr.co.hit.dao.MarketDao;
import kr.co.hit.dto.CommunityDto;
import kr.co.hit.dto.CommunitySearchDto;
import kr.co.hit.dto.FileDto;

@Service
public class CommunityService implements CommunityDao {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<CommunityDto> selectCommunityList() {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		List<CommunityDto> list = dao.selectCommunityList();
		return list;
	}

	public void increaseView(int boardIdx) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		dao.increaseView(boardIdx);
	}

	@Override
	public CommunityDto selectCommunityDetail(int boardIdx) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		CommunityDto list = dao.selectCommunityDetail(boardIdx);
		return list;
	}

	@Override
	public int insertBoard(CommunityDto dto) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.insertBoard(dto);
		return result;
	}

	@Override
	public int updateBoard(CommunityDto dto) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.updateBoard(dto);
		return result;
	}

	@Override
	public int updateCommunity(CommunityDto dto) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.updateBoard(dto);
		return result;
	}

	@Override
	public int deleteFile(int boardIdx) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.deleteCommunity(boardIdx);
		return result;
	}

	@Override
	public int deleteCommunity(int boardIdx) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.deleteCommunity(boardIdx);
		return result;

	}

//	@Override
//	public int deleteBoard(int boardIdx) {
//		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
//		int result = dao.deleteBoard(boardIdx);
//		return result;
//	}

	@Override
	public void updateSummerNote(FileDto fileOne) throws IOException {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		dao.updateSummerNote(fileOne);

	}

	@Override
	public List<CommunityDto> searchCommunityList(CommunitySearchDto dto) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		List<CommunityDto> list = dao.searchCommunityList(dto);
		return list;
	}

	@Override
	public int searchCommunityListCount(CommunitySearchDto dto) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.searchCommunityListCount(dto);
		return result;
	}

	@Override
	public int selectCommunityListCount() {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.selectCommunityListCount();
		return result;
	}

	@Override
	public List<CommunityDto> selectReplyList(int boardIdx) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		List<CommunityDto> list = dao.selectReplyList(boardIdx);
		return list;
	}

	@Override
	public int insertReply(CommunityDto dto) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.insertReply(dto);
		return result;
	}

	@Override
	public void increaseReply(int boardIdx) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		dao.increaseReply(boardIdx);

	}

	@Override
	public int deleteReplyBno(int boardIdx) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.deleteReplyBno(boardIdx);
		return result;

	}

//	익명 찾기
	public List<CommunityDto> getAnonymousPosts() {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		List<CommunityDto> list = dao.getAnonymousPosts();
		return list;

	}

//	익명 찾기
	public List<CommunityDto> getAllNonAnonymousPosts() {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		List<CommunityDto> list = dao.getAnonymousPosts();
		return list;
	}

//	==================================================================

	@Override
	public int insertCommunity(CommunityDto dto) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		int result = dao.insertCommunity(dto);
		return result;
	}

	@Override
	public void updateView(int b_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public CommunityDto getCommunityDetail(int b_no) {
		// TODO Auto-generated method stub
		return null;
	}
//================================================================

	@Override
	public List<CommunityDto> searchCommunityImgList(int boardIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int InsertCommunity(CommunityDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
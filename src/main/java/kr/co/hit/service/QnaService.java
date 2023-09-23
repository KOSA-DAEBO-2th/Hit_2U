package kr.co.hit.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.QnaDao;
import kr.co.hit.dao.CommunityDao;
import kr.co.hit.dao.MarketDao;
import kr.co.hit.dto.QnaDto;
import kr.co.hit.dto.QnaSearchDto;
import kr.co.hit.dto.FileDto;

@Service
public class QnaService implements QnaDao {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<QnaDto> selectQnaList() {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		List<QnaDto> list = dao.selectQnaList();
		return list;
	}
	
	
	public void increaseView(int boardIdx) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		dao.increaseView(boardIdx);
	}
	
	@Override
	public QnaDto selectQnaDetail(int boardIdx) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		QnaDto list = dao.selectQnaDetail(boardIdx);
		return list;
	}
	
	@Override
	public int insertBoard(QnaDto dto) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.insertBoard(dto);
		return result;
	}
	
	

	@Override
	public int updateBoard(QnaDto dto) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.updateBoard(dto);
		return result;
	}
	
	@Override
	public int updateQna(QnaDto dto) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.updateBoard(dto);
		return result;
	}
	
	@Override
	public int deleteFile(int boardIdx) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.deleteQna(boardIdx);
		return result;
	}
	
	@Override
	public int deleteQna(int boardIdx) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.deleteQna(boardIdx);
		return result;
		
	}
	
//	@Override
//	public int deleteBoard(int boardIdx) {
//		QnaDao dao = sqlsession.getMapper(QnaDao.class);
//		int result = dao.deleteBoard(boardIdx);
//		return result;
//	}
	
	@Override
	public void updateSummerNote(FileDto fileOne) throws IOException {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		dao.updateSummerNote(fileOne);
		
	}
	
	@Override
	public List<QnaDto> searchQnaList(QnaSearchDto dto) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		List<QnaDto> list = dao.searchQnaList(dto);
		return list;
	}
	
	
	@Override
	public int searchQnaListCount(QnaSearchDto dto) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.searchQnaListCount(dto);
		return result;
	}
	
	
	
	@Override
	public int selectQnaListCount() {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.selectQnaListCount();
		return result;
	}
	
	@Override
	public List<QnaDto> selectReplyList(int boardIdx) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		List<QnaDto> list = dao.selectReplyList(boardIdx);
		return list;
	}
	
	
	@Override
	public int insertReply(QnaDto dto) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.insertReply(dto);
		return result;
	}
	
	@Override
	public void increaseReply(int boardIdx) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		dao.increaseReply(boardIdx);
		
	}
	
	
	

//	==================================================================
	

	@Override
	public int insertQna(QnaDto dto) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.insertQna(dto);
		return result;
	}
//================================================================


	@Override
	public List<QnaDto> searchQnaImgList(int boardIdx) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int InsertQna(QnaDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void updateView(int b_no) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public QnaDto getQnaDetail(int b_no) {
		// TODO Auto-generated method stub
		return null;
	}





	@Override
	public List<QnaDto> QnaList(HashMap map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getQnaCount() {
		// TODO Auto-generated method stub
		return 0;
	}


	public int deleteReplyBno(int boardIdx) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		int result = dao.deleteReplyBno(boardIdx);
		return result;
	}






}
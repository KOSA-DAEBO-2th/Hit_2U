package kr.co.hit.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.CommunityDao;
import kr.co.hit.dao.QnaDao;
import kr.co.hit.dto.CommunityDto;
import kr.co.hit.dto.QnaDto;

@Service
public class QnaService implements QnaDao {

	@Autowired
	private SqlSession sqlsession;

//	// 커뮤니티 리스트
//	@Override
//	public List<CommunityDto> CommunityList() {
//
//		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
//		List<CommunityDto> list = new ArrayList<CommunityDto>();
//		list = dao.CommunityList();
//
//		return list;
//	}

	// Qna 리스트 with 페이징
	@Override
	public List<QnaDto> QnaList(HashMap map) {

		QnaDao dao = sqlsession.getMapper(QnaDao.class);

		System.out.println("map: " + map);
		return dao.QnaList(map);
	}

	// 총 게시물 수
	@Override
	public int getQnaCount() {

		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		return dao.getQnaCount();
	}

	@Override
	public void InsertQna(QnaDto dto) {

		QnaDao dao = sqlsession.getMapper(QnaDao.class);

//		이거 작동안할시 지움
		int topicNo = dao.getTopicNoByTopicName2(dto.getTopic_name());
		dto.setTopic_no(topicNo);
		// 위에서 아래로
		
		System.out.println("dto: "+ dto);
		System.out.println("topicNo: "+ topicNo );
		dao.InsertQna(dto);
	}

	@Override
	public QnaDto getQnaDetail(int b_no) {

		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		return dao.getQnaDetail(b_no);
	}

	public int updateQna(QnaDto dto) {

		QnaDao dao = sqlsession.getMapper(QnaDao.class);
//		dto.setCat_no(2);  
		
		return dao.updateQna(dto);
	}

//	@Override
//	public int deleteCommunity(CommunityDto dto) {
//
//		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
//		
//		return deleteCommunity(dto);
//	}

	@Override
	public int deleteQna(int b_no) {

		QnaDao dao = sqlsession.getMapper(QnaDao.class);

		return dao.deleteQna(b_no);

	}

	@Override
	public int getTopicNoByTopicName2(String topic_name) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		return dao.getTopicNoByTopicName2(topic_name);
	}

	public List<QnaDto> getPostsByTopic2(HashMap map) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		return dao.getPostsByTopic2(map);
	}

	public int getPostCountByTopic2(int topicNo) {

		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		return dao.getPostCountByTopic2(topicNo);
	}

	@Override
	public List<QnaDto> searchByTitle2(String title) {
		QnaDao dao = sqlsession.getMapper(QnaDao.class);
		return dao.searchByTitle2(title);
	}

}

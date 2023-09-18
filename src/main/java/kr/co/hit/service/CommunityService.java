package kr.co.hit.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.CommunityDao;
import kr.co.hit.dto.CommunityDto;

@Service
public class CommunityService implements CommunityDao {

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

	// 커뮤니티 리스트 with 페이징
	@Override
	public List<CommunityDto> CommunityList(HashMap map) {

		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		return dao.CommunityList(map);
	}

	// 총 게시물 수
	@Override
	public int getCommunityCount() {

		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		return dao.getCommunityCount();
	}

	@Override
	public void InsertCommunity(CommunityDto dto) {

		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);

//		이거 작동안할시 지움
		int topicNo = dao.getTopicNoByTopicName(dto.getTopic_name());
		dto.setTopic_no(topicNo);
		// 위에서 아래로

		dao.InsertCommunity(dto);
	}

	@Override
	public CommunityDto getCommunityDetail(int b_no) {

		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		return dao.getCommunityDetail(b_no);
	}

	public int updateCommunity(CommunityDto dto) {

		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		return dao.updateCommunity(dto);
	}

//	@Override
//	public int deleteCommunity(CommunityDto dto) {
//
//		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
//		
//		return deleteCommunity(dto);
//	}

	@Override
	public int deleteCommunity(int b_no) {

		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);

		return dao.deleteCommunity(b_no);

	}

	@Override
	public int updateView(int b_no) {
		System.out.println("update view");

		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);

		return dao.updateView(b_no);
	}

	@Override
	public int getTopicNoByTopicName(String topic_name) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		return dao.getTopicNoByTopicName(topic_name);
	}

	
	public List<CommunityDto> getPostsByTopic(HashMap map) {
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		return dao.getPostsByTopic(map);
	}

	public int getPostCountByTopic(int topicNo) {
		
		CommunityDao dao = sqlsession.getMapper(CommunityDao.class);
		return dao.getPostCountByTopic(topicNo);
	}

}

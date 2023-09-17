package kr.co.hit.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MeetingDao;
import kr.co.hit.dto.MeetingDto;

@Service
public class MeetingService implements MeetingDao {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<MeetingDto> selectMeetingList() {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectMeetingList();

		return list;
	}
	
	@Override
	public List<MeetingDto> selectMeetingCategoyList(String option) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectMeetingCategoyList(option);

		return list;
	}
	
	@Override
	public List<MeetingDto> selectMeetingSearch(String search_target) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectMeetingSearch(search_target);

		return list;
	}


	@Override
	public MeetingDto selectMeetingRead(int boardIdx) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		MeetingDto list = dao.selectMeetingRead(boardIdx);
		return list;
	}

	@Override
	public void insert(MeetingDto dto) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		dao.insert(dto);
	}

	@Override
	public void insertMeeting(MeetingDto dto) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		dao.insertMeeting(dto);
	}

	@Override
	public void increaseView(int boardIdx) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		dao.increaseView(boardIdx);
		
	}

	@Override
	public int getMeetingListCount(String search_target, String topic) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		return dao.getMeetingListCount(search_target ,topic);
	}

	@Override
	public List<MeetingDto> selectMeetingPage(String search_target, int start, int limit) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectMeetingPage(search_target, start, limit);
		return list;
	}

	@Override
	public List<MeetingDto> selectMeetingTopicList(String search_target, String topic, int start, int limit) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectMeetingTopicList(search_target, topic, start, limit );
		return list;
	}

	@Override
	public List<MeetingDto> selectMeetingMember(int boardIdx) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectMeetingMember(boardIdx);
		return list;
	}

	@Override
	public List<MeetingDto> selectRecommendList(int boardIdx, String field) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectRecommendList(boardIdx, field);
		return list;
	}

	@Override
	public List<MeetingDto> selectReplyList(int boardIdx) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectReplyList(boardIdx);
		return list;
	}



	@Override
	public int insertMeetingMember(int boardIdx, int member_no, String meeting_position, int meeting_tmp,
			int meeting_leader) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		int result = dao.insertMeetingMember(boardIdx, member_no, meeting_position, meeting_tmp, meeting_leader);
		return result;
	}

	



}

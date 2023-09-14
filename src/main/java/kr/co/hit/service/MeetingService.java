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

}

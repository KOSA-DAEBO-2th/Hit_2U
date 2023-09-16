package kr.co.hit.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hit.aws.AwsS3;
import kr.co.hit.dao.MeetingDao;
import kr.co.hit.dto.FileDto;
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
	public int getMeetingListCount() {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		return dao.getMeetingListCount();
	}

	@Override
	public List<MeetingDto> selectMeetingPage(int start, int limit) {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		List<MeetingDto> list = dao.selectMeetingPage(start, limit);
		return list;
	}

	@Override
	public void insertThumb(FileDto fileOne) throws IOException {
		MeetingDao dao = sqlsession.getMapper(MeetingDao.class);
		dao.insertThumb(fileOne);
	}

}

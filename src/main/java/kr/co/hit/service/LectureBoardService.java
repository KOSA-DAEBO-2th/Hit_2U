package kr.co.hit.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.LectureBoardDao;
import kr.co.hit.dto.BoardDto;

@Service
public class LectureBoardService implements LectureBoardDao {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<BoardDto> selectLectureList() {
		LectureBoardDao dao = sqlsession.getMapper(LectureBoardDao.class);
		List<BoardDto> list = new ArrayList<BoardDto>();
		list = dao.selectLectureList();
		return list;
	}

}
